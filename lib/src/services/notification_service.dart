import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/result_models.dart';

/// Universal notification service for Magento events
/// Provides centralized event broadcasting and subscription management
class MagentoNotificationService extends ChangeNotifier {
  MagentoNotificationService({
    this.enablePersistence = true,
    this.maxHistorySize = 1000,
  });

  final bool enablePersistence;
  final int maxHistorySize;

  // Private fields
  SharedPreferences? _prefs;
  final Map<MagentoNotificationType, StreamController<MagentoNotification>>
      _controllers = {};
  final List<MagentoNotification> _notificationHistory = [];
  final Map<String, MagentoNotificationSubscription> _subscriptions = {};
  int _notificationIdCounter = 0;

  /// Get stream for specific notification type
  Stream<MagentoNotification> getStream(MagentoNotificationType type) {
    _controllers[type] ??= StreamController<MagentoNotification>.broadcast();
    return _controllers[type]!.stream;
  }

  /// Get stream for all notifications
  Stream<MagentoNotification> get allNotifications {
    final controller = StreamController<MagentoNotification>.broadcast();

    for (final type in MagentoNotificationType.values) {
      getStream(type).listen((notification) {
        controller.add(notification);
      });
    }

    return controller.stream;
  }

  /// Initialize the notification service
  Future<void> initialize() async {
    if (enablePersistence) {
      _prefs ??= await SharedPreferences.getInstance();
      await _loadNotificationHistory();
    }
  }

  /// Send a notification
  void notify({
    required MagentoNotificationType type,
    required String message,
    String? title,
    MagentoNotificationPriority priority = MagentoNotificationPriority.normal,
    Map<String, dynamic>? data,
    Duration? ttl,
  }) {
    final notification = MagentoNotification(
      id: _generateNotificationId(),
      type: type,
      title: title,
      message: message,
      priority: priority,
      data: data,
      timestamp: DateTime.now(),
      expiresAt: ttl != null ? DateTime.now().add(ttl) : null,
    );

    _sendNotification(notification);
  }

  /// Send an error notification
  void notifyError(
    String message, {
    String? title,
    Map<String, dynamic>? context,
    Exception? exception,
  }) {
    final data = <String, dynamic>{
      if (context != null) ...context,
      if (exception != null) 'exception': exception.toString(),
    };

    notify(
      type: MagentoNotificationType.error,
      title: title ?? 'Error',
      message: message,
      priority: MagentoNotificationPriority.high,
      data: data.isNotEmpty ? data : null,
    );
  }

  /// Send a warning notification
  void notifyWarning(
    String message, {
    String? title,
    Map<String, dynamic>? context,
  }) {
    notify(
      type: MagentoNotificationType.warning,
      title: title ?? 'Warning',
      message: message,
      priority: MagentoNotificationPriority.normal,
      data: context,
    );
  }

  /// Send an info notification
  void notifyInfo(
    String message, {
    String? title,
    Map<String, dynamic>? context,
  }) {
    notify(
      type: MagentoNotificationType.info,
      title: title ?? 'Information',
      message: message,
      priority: MagentoNotificationPriority.low,
      data: context,
    );
  }

  /// Send a success notification
  void notifySuccess(
    String message, {
    String? title,
    Map<String, dynamic>? context,
  }) {
    notify(
      type: MagentoNotificationType.success,
      title: title ?? 'Success',
      message: message,
      priority: MagentoNotificationPriority.normal,
      data: context,
    );
  }

  /// Send a sync notification
  void notifySync({
    required String message,
    required MagentoSyncNotificationState state,
    String? dataType,
    int? itemCount,
    Map<String, dynamic>? additionalData,
  }) {
    final data = <String, dynamic>{
      'sync_state': state.name,
      if (dataType != null) 'data_type': dataType,
      if (itemCount != null) 'item_count': itemCount,
      if (additionalData != null) ...additionalData,
    };

    final priority = state == MagentoSyncNotificationState.error
        ? MagentoNotificationPriority.high
        : MagentoNotificationPriority.normal;

    notify(
      type: MagentoNotificationType.sync,
      title: 'Sync ${state.name.toUpperCase()}',
      message: message,
      priority: priority,
      data: data,
    );
  }

  /// Send a cloud feature notification
  void notifyCloudFeature({
    required String message,
    required MagentoCloudFeatureType featureType,
    required MagentoCloudNotificationState state,
    bool fallbackUsed = false,
    Map<String, dynamic>? additionalData,
  }) {
    final data = <String, dynamic>{
      'feature_type': featureType.name,
      'state': state.name,
      'fallback_used': fallbackUsed,
      if (additionalData != null) ...additionalData,
    };

    final priority = state == MagentoCloudNotificationState.error
        ? MagentoNotificationPriority.high
        : MagentoNotificationPriority.normal;

    notify(
      type: MagentoNotificationType.cloudFeature,
      title: 'Cloud Feature',
      message: message,
      priority: priority,
      data: data,
    );
  }

  /// Subscribe to notifications with a callback
  MagentoNotificationSubscription subscribe({
    required MagentoNotificationType type,
    required void Function(MagentoNotification) callback,
    MagentoNotificationPriority? minPriority,
    bool Function(MagentoNotification)? filter,
  }) {
    final subscriptionId = _generateSubscriptionId();

    final subscription = MagentoNotificationSubscription(
      id: subscriptionId,
      type: type,
      callback: callback,
      minPriority: minPriority,
      filter: filter,
    );

    _subscriptions[subscriptionId] = subscription;

    // Set up stream listener
    final streamSubscription = getStream(type).listen((notification) {
      if (_shouldDeliverNotification(notification, subscription)) {
        try {
          callback(notification);
        } catch (e) {
          if (kDebugMode) {
            print('Error in notification callback: $e');
          }
        }
      }
    });

    subscription._streamSubscription = streamSubscription;
    return subscription;
  }

  /// Subscribe to all notifications
  MagentoNotificationSubscription subscribeToAll({
    required void Function(MagentoNotification) callback,
    MagentoNotificationPriority? minPriority,
    bool Function(MagentoNotification)? filter,
  }) {
    final subscriptionId = _generateSubscriptionId();

    final subscription = MagentoNotificationSubscription(
      id: subscriptionId,
      type: null, // null means all types
      callback: callback,
      minPriority: minPriority,
      filter: filter,
    );

    _subscriptions[subscriptionId] = subscription;

    // Set up stream listener for all notifications
    final streamSubscription = allNotifications.listen((notification) {
      if (_shouldDeliverNotification(notification, subscription)) {
        try {
          callback(notification);
        } catch (e) {
          if (kDebugMode) {
            print('Error in notification callback: $e');
          }
        }
      }
    });

    subscription._streamSubscription = streamSubscription;
    return subscription;
  }

  /// Unsubscribe from notifications
  void unsubscribe(MagentoNotificationSubscription subscription) {
    subscription._streamSubscription?.cancel();
    _subscriptions.remove(subscription.id);
  }

  /// Get notification history
  List<MagentoNotification> getHistory({
    MagentoNotificationType? type,
    MagentoNotificationPriority? minPriority,
    int? limit,
    Duration? since,
  }) {
    var filtered = _notificationHistory.where((notification) {
      if (type != null && notification.type != type) return false;
      if (minPriority != null &&
          notification.priority.index < minPriority.index) return false;
      if (since != null &&
          notification.timestamp.isBefore(DateTime.now().subtract(since)))
        return false;
      return true;
    }).toList();

    // Sort by timestamp (newest first)
    filtered.sort((a, b) => b.timestamp.compareTo(a.timestamp));

    if (limit != null && limit < filtered.length) {
      filtered = filtered.take(limit).toList();
    }

    return filtered;
  }

  /// Clear notification history
  Future<void> clearHistory({
    MagentoNotificationType? type,
    Duration? olderThan,
  }) async {
    if (type == null && olderThan == null) {
      // Clear all history
      _notificationHistory.clear();
    } else {
      // Clear filtered history
      _notificationHistory.removeWhere((notification) {
        if (type != null && notification.type != type) return false;
        if (olderThan != null &&
            notification.timestamp.isAfter(DateTime.now().subtract(olderThan)))
          return false;
        return true;
      });
    }

    if (enablePersistence) {
      await _saveNotificationHistory();
    }
  }

  /// Get notification statistics
  MagentoNotificationStats getStats() {
    final now = DateTime.now();
    final last24Hours = now.subtract(const Duration(hours: 24));

    final recent =
        _notificationHistory.where((n) => n.timestamp.isAfter(last24Hours));

    final byType = <MagentoNotificationType, int>{};
    final byPriority = <MagentoNotificationPriority, int>{};

    for (final notification in recent) {
      byType[notification.type] = (byType[notification.type] ?? 0) + 1;
      byPriority[notification.priority] =
          (byPriority[notification.priority] ?? 0) + 1;
    }

    return MagentoNotificationStats(
      totalCount: _notificationHistory.length,
      recentCount: recent.length,
      countByType: byType,
      countByPriority: byPriority,
      activeSubscriptions: _subscriptions.length,
    );
  }

  // Private methods

  void _sendNotification(MagentoNotification notification) {
    // Add to history
    _notificationHistory.add(notification);

    // Maintain history size limit
    if (_notificationHistory.length > maxHistorySize) {
      _notificationHistory.removeAt(0);
    }

    // Send to appropriate stream
    final controller = _controllers[notification.type];
    if (controller != null && !controller.isClosed) {
      controller.add(notification);
    }

    // Persist if enabled
    if (enablePersistence) {
      _saveNotificationHistory();
    }

    // Notify listeners
    notifyListeners();

    if (kDebugMode) {
      print(
          'Notification sent: ${notification.type.name} - ${notification.message}');
    }
  }

  bool _shouldDeliverNotification(
    MagentoNotification notification,
    MagentoNotificationSubscription subscription,
  ) {
    // Check type (null means all types)
    if (subscription.type != null && notification.type != subscription.type) {
      return false;
    }

    // Check minimum priority
    if (subscription.minPriority != null &&
        notification.priority.index < subscription.minPriority!.index) {
      return false;
    }

    // Check custom filter
    if (subscription.filter != null && !subscription.filter!(notification)) {
      return false;
    }

    // Check if notification is expired
    if (notification.isExpired) {
      return false;
    }

    return true;
  }

  String _generateNotificationId() {
    return 'notification_${_notificationIdCounter++}_${DateTime.now().millisecondsSinceEpoch}';
  }

  String _generateSubscriptionId() {
    return 'subscription_${DateTime.now().millisecondsSinceEpoch}_${_subscriptions.length}';
  }

  Future<void> _loadNotificationHistory() async {
    // In a real implementation, this would load from persistent storage
    // For now, we'll skip the actual persistence logic
  }

  Future<void> _saveNotificationHistory() async {
    // In a real implementation, this would save to persistent storage
    // For now, we'll skip the actual persistence logic
  }

  @override
  void dispose() {
    // Close all stream controllers
    for (final controller in _controllers.values) {
      controller.close();
    }
    _controllers.clear();

    // Cancel all subscriptions
    for (final subscription in _subscriptions.values) {
      subscription._streamSubscription?.cancel();
    }
    _subscriptions.clear();

    super.dispose();
  }
}

/// Types of notifications
enum MagentoNotificationType {
  error,
  warning,
  info,
  success,
  sync,
  cloudFeature,
  network,
  auth,
  cache,
}

/// Notification priority levels
enum MagentoNotificationPriority {
  low,
  normal,
  high,
  critical,
}

/// Sync notification states
enum MagentoSyncNotificationState {
  started,
  progress,
  completed,
  error,
  conflict,
}

/// Cloud feature notification states
enum MagentoCloudNotificationState {
  executing,
  completed,
  error,
  fallback,
}

/// A notification object
@immutable
class MagentoNotification {
  const MagentoNotification({
    required this.id,
    required this.type,
    required this.message,
    this.title,
    this.priority = MagentoNotificationPriority.normal,
    this.data,
    required this.timestamp,
    this.expiresAt,
  });

  final String id;
  final MagentoNotificationType type;
  final String? title;
  final String message;
  final MagentoNotificationPriority priority;
  final Map<String, dynamic>? data;
  final DateTime timestamp;
  final DateTime? expiresAt;

  /// Whether the notification has expired
  bool get isExpired => expiresAt != null && DateTime.now().isAfter(expiresAt!);

  /// Age of the notification
  Duration get age => DateTime.now().difference(timestamp);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MagentoNotification &&
          runtimeType == other.runtimeType &&
          id == other.id;

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() => 'MagentoNotification('
      'type: $type, '
      'priority: $priority, '
      'message: $message'
      ')';
}

/// A notification subscription
class MagentoNotificationSubscription {
  MagentoNotificationSubscription({
    required this.id,
    required this.type,
    required this.callback,
    this.minPriority,
    this.filter,
  });

  final String id;
  final MagentoNotificationType? type; // null means all types
  final void Function(MagentoNotification) callback;
  final MagentoNotificationPriority? minPriority;
  final bool Function(MagentoNotification)? filter;

  StreamSubscription<MagentoNotification>? _streamSubscription;

  /// Cancel this subscription
  void cancel() {
    _streamSubscription?.cancel();
  }

  @override
  String toString() => 'MagentoNotificationSubscription('
      'id: $id, '
      'type: $type, '
      'minPriority: $minPriority'
      ')';
}

/// Notification statistics
@immutable
class MagentoNotificationStats {
  const MagentoNotificationStats({
    required this.totalCount,
    required this.recentCount,
    required this.countByType,
    required this.countByPriority,
    required this.activeSubscriptions,
  });

  final int totalCount;
  final int recentCount;
  final Map<MagentoNotificationType, int> countByType;
  final Map<MagentoNotificationPriority, int> countByPriority;
  final int activeSubscriptions;

  @override
  String toString() => 'MagentoNotificationStats('
      'total: $totalCount, '
      'recent: $recentCount, '
      'subscriptions: $activeSubscriptions'
      ')';
}

// MagentoCloudFeatureType is imported from result_models.dart
