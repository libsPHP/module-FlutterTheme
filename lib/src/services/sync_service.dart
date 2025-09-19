import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/result_models.dart';
import 'network_service.dart';

/// Universal synchronization service for Magento data
/// Provides offline-first sync capabilities with conflict resolution
class MagentoSyncService extends ChangeNotifier {
  MagentoSyncService({
    required this.networkService,
    this.defaultSyncInterval = const Duration(minutes: 30),
    this.maxRetryAttempts = 3,
    this.enableAutoSync = true,
  });

  final NetworkService networkService;
  final Duration defaultSyncInterval;
  final int maxRetryAttempts;
  final bool enableAutoSync;

  // Private fields
  SharedPreferences? _prefs;
  final Map<String, Timer> _scheduledSyncs = {};
  final Map<String, DateTime> _lastSyncTimes = {};
  final Map<String, bool> _activeSyncs = {};

  // Stream controllers
  final StreamController<MagentoSyncStatus> _statusController =
      StreamController<MagentoSyncStatus>.broadcast();
  final StreamController<MagentoSyncResult> _resultController =
      StreamController<MagentoSyncResult>.broadcast();
  final StreamController<String> _errorController =
      StreamController<String>.broadcast();

  /// Current sync status
  MagentoSyncStatus _currentStatus = MagentoSyncStatus.idle;
  MagentoSyncStatus get currentStatus => _currentStatus;

  /// Stream of sync status changes
  Stream<MagentoSyncStatus> get statusStream => _statusController.stream;

  /// Stream of sync results
  Stream<MagentoSyncResult> get resultStream => _resultController.stream;

  /// Stream of sync errors
  Stream<String> get errorStream => _errorController.stream;

  /// Initialize the sync service
  Future<void> initialize() async {
    _prefs ??= await SharedPreferences.getInstance();
    await _loadSyncMetadata();

    if (enableAutoSync) {
      await _setupAutoSync();
    }
  }

  /// Sync data with the cloud
  ///
  /// [dataType] - Type identifier for the data being synced
  /// [items] - List of items to sync
  /// [fromJson] - Function to deserialize items from JSON
  /// [toJson] - Function to serialize items to JSON
  /// [syncStrategy] - Strategy for sync operation
  /// [apiEndpoint] - Magento API endpoint for this data type
  /// [conflictResolver] - Optional custom conflict resolution function
  Future<MagentoSyncResult<T>> syncData<T>({
    required String dataType,
    required List<T> items,
    required T Function(Map<String, dynamic>) fromJson,
    required Map<String, dynamic> Function(T) toJson,
    MagentoSyncStrategy syncStrategy = MagentoSyncStrategy.incremental,
    String? apiEndpoint,
    Future<T> Function(MagentoSyncConflict)? conflictResolver,
    Map<String, dynamic>? filters,
  }) async {
    if (_activeSyncs[dataType] == true) {
      return MagentoSyncResult.error('Sync already in progress for $dataType');
    }

    _activeSyncs[dataType] = true;
    _setStatus(MagentoSyncStatus.syncing);

    try {
      final result = await _performSync<T>(
        dataType: dataType,
        items: items,
        fromJson: fromJson,
        toJson: toJson,
        syncStrategy: syncStrategy,
        apiEndpoint: apiEndpoint,
        conflictResolver: conflictResolver,
        filters: filters,
      );

      _resultController.add(result);

      if (result.success) {
        await _updateSyncMetadata(dataType, DateTime.now());
        _setStatus(MagentoSyncStatus.success);
      } else {
        _setStatus(MagentoSyncStatus.error);
        _errorController.add(result.error ?? 'Unknown sync error');
      }

      return result;
    } catch (e) {
      final error = 'Sync failed for $dataType: $e';
      _setStatus(MagentoSyncStatus.error);
      _errorController.add(error);
      return MagentoSyncResult.error(error);
    } finally {
      _activeSyncs[dataType] = false;
      if (!_activeSyncs.values.any((active) => active)) {
        _setStatus(MagentoSyncStatus.idle);
      }
    }
  }

  /// Schedule automatic sync for a data type
  Future<void> scheduleSync({
    required String dataType,
    Duration? interval,
    bool immediate = false,
  }) async {
    final syncInterval = interval ?? defaultSyncInterval;

    // Cancel existing timer if any
    _scheduledSyncs[dataType]?.cancel();

    if (immediate) {
      // Trigger immediate sync if requested
      Timer.run(() => _triggerScheduledSync(dataType));
    }

    // Setup periodic timer
    _scheduledSyncs[dataType] = Timer.periodic(syncInterval, (_) {
      _triggerScheduledSync(dataType);
    });

    await _saveSyncSchedule(dataType, syncInterval);
  }

  /// Cancel scheduled sync for a data type
  void cancelScheduledSync(String dataType) {
    _scheduledSyncs[dataType]?.cancel();
    _scheduledSyncs.remove(dataType);
    _removeSyncSchedule(dataType);
  }

  /// Get pending sync items for a data type
  Future<List<Map<String, dynamic>>> getPendingSyncItems(
      String dataType) async {
    _prefs ??= await SharedPreferences.getInstance();
    final pendingJson = _prefs!.getString('pending_sync_$dataType');

    if (pendingJson == null) return [];

    final List<dynamic> pendingList = jsonDecode(pendingJson);
    return pendingList.cast<Map<String, dynamic>>();
  }

  /// Add items to pending sync queue
  Future<void> addToPendingSync(
      String dataType, List<Map<String, dynamic>> items) async {
    _prefs ??= await SharedPreferences.getInstance();

    final existing = await getPendingSyncItems(dataType);
    existing.addAll(items);

    await _prefs!.setString('pending_sync_$dataType', jsonEncode(existing));
  }

  /// Clear pending sync items for a data type
  Future<void> clearPendingSync(String dataType) async {
    _prefs ??= await SharedPreferences.getInstance();
    await _prefs!.remove('pending_sync_$dataType');
  }

  /// Get sync statistics for a data type
  Future<MagentoSyncStats> getSyncStats(String dataType) async {
    _prefs ??= await SharedPreferences.getInstance();

    final lastSync = _lastSyncTimes[dataType];
    final pendingItems = await getPendingSyncItems(dataType);
    final isScheduled = _scheduledSyncs.containsKey(dataType);

    return MagentoSyncStats(
      dataType: dataType,
      lastSyncTime: lastSync,
      pendingItemsCount: pendingItems.length,
      isScheduled: isScheduled,
      isActive: _activeSyncs[dataType] == true,
    );
  }

  /// Get overall sync statistics
  Future<Map<String, MagentoSyncStats>> getAllSyncStats() async {
    final stats = <String, MagentoSyncStats>{};

    // Get all known data types from preferences
    _prefs ??= await SharedPreferences.getInstance();
    final keys = _prefs!.getKeys().where((key) => key.startsWith('last_sync_'));

    for (final key in keys) {
      final dataType = key.replaceFirst('last_sync_', '');
      stats[dataType] = await getSyncStats(dataType);
    }

    return stats;
  }

  /// Force sync all pending data
  Future<Map<String, MagentoSyncResult>> syncAllPending() async {
    final results = <String, MagentoSyncResult>{};
    final stats = await getAllSyncStats();

    for (final entry in stats.entries) {
      final dataType = entry.key;
      final stat = entry.value;

      if (stat.pendingItemsCount > 0) {
        // This would need to be implemented per data type
        // For now, we'll create a placeholder result
        results[dataType] = MagentoSyncResult.error(
            'Generic sync not implemented. Use specific syncData method.');
      }
    }

    return results;
  }

  // Private methods

  Future<MagentoSyncResult<T>> _performSync<T>({
    required String dataType,
    required List<T> items,
    required T Function(Map<String, dynamic>) fromJson,
    required Map<String, dynamic> Function(T) toJson,
    required MagentoSyncStrategy syncStrategy,
    String? apiEndpoint,
    Future<T> Function(MagentoSyncConflict)? conflictResolver,
    Map<String, dynamic>? filters,
  }) async {
    if (!networkService.isOnline) {
      // Store for later sync
      final itemsJson = items.map(toJson).toList();
      await addToPendingSync(dataType, itemsJson);

      return MagentoSyncResult.error(
        'Network unavailable. Items queued for sync when online.',
        syncType: _mapSyncStrategy(syncStrategy),
      );
    }

    try {
      // For now, simulate sync operation
      // In a real implementation, this would make API calls to Magento
      await Future.delayed(
          const Duration(milliseconds: 500)); // Simulate network delay

      final syncedItems = <String>[];
      final failedItems = <String>[];
      final conflicts = <MagentoSyncConflict>[];

      // Process each item
      for (int i = 0; i < items.length; i++) {
        final item = items[i];
        final itemJson = toJson(item);
        final itemId = itemJson['id']?.toString() ?? i.toString();

        // Simulate some failures and conflicts for demonstration
        if (i % 10 == 9) {
          // Every 10th item fails
          failedItems.add(itemId);
        } else if (i % 15 == 14) {
          // Every 15th item has conflict
          conflicts.add(MagentoSyncConflict(
            itemId: itemId,
            conflictType: MagentoSyncConflictType.bothModified,
            localData: itemJson,
            remoteData: {...itemJson, 'remote_modified': true},
            description: 'Item was modified both locally and remotely',
          ));
        } else {
          syncedItems.add(itemId);
        }
      }

      // Clear pending items on successful sync
      if (syncedItems.isNotEmpty) {
        await clearPendingSync(dataType);
      }

      return MagentoSyncResult.success(
        data: items,
        syncedCount: syncedItems.length,
        failedCount: failedItems.length,
        conflictCount: conflicts.length,
        syncType: _mapSyncStrategy(syncStrategy),
        syncedItems: syncedItems,
        failedItems: failedItems,
        conflicts: conflicts,
      );
    } catch (e) {
      return MagentoSyncResult.error('Sync operation failed: $e');
    }
  }

  void _setStatus(MagentoSyncStatus status) {
    if (_currentStatus != status) {
      _currentStatus = status;
      _statusController.add(status);
      notifyListeners();
    }
  }

  Future<void> _loadSyncMetadata() async {
    _prefs ??= await SharedPreferences.getInstance();

    // Load last sync times
    final keys = _prefs!.getKeys().where((key) => key.startsWith('last_sync_'));
    for (final key in keys) {
      final dataType = key.replaceFirst('last_sync_', '');
      final timestamp = _prefs!.getInt(key);
      if (timestamp != null) {
        _lastSyncTimes[dataType] =
            DateTime.fromMillisecondsSinceEpoch(timestamp);
      }
    }
  }

  Future<void> _updateSyncMetadata(String dataType, DateTime syncTime) async {
    _prefs ??= await SharedPreferences.getInstance();
    await _prefs!
        .setInt('last_sync_$dataType', syncTime.millisecondsSinceEpoch);
    _lastSyncTimes[dataType] = syncTime;
  }

  Future<void> _setupAutoSync() async {
    // Load scheduled syncs from preferences and restore them
    _prefs ??= await SharedPreferences.getInstance();
    final scheduleKeys =
        _prefs!.getKeys().where((key) => key.startsWith('sync_schedule_'));

    for (final key in scheduleKeys) {
      final dataType = key.replaceFirst('sync_schedule_', '');
      final intervalMs = _prefs!.getInt(key);
      if (intervalMs != null) {
        await scheduleSync(
          dataType: dataType,
          interval: Duration(milliseconds: intervalMs),
        );
      }
    }
  }

  Future<void> _saveSyncSchedule(String dataType, Duration interval) async {
    _prefs ??= await SharedPreferences.getInstance();
    await _prefs!.setInt('sync_schedule_$dataType', interval.inMilliseconds);
  }

  void _removeSyncSchedule(String dataType) async {
    _prefs ??= await SharedPreferences.getInstance();
    await _prefs!.remove('sync_schedule_$dataType');
  }

  void _triggerScheduledSync(String dataType) {
    // This would need to be implemented based on the specific data type
    // For now, we'll just emit an event
    if (kDebugMode) {
      print('Scheduled sync triggered for $dataType');
    }
  }

  MagentoSyncType _mapSyncStrategy(MagentoSyncStrategy strategy) {
    switch (strategy) {
      case MagentoSyncStrategy.full:
        return MagentoSyncType.full;
      case MagentoSyncStrategy.incremental:
        return MagentoSyncType.incremental;
      case MagentoSyncStrategy.selective:
        return MagentoSyncType.selective;
      case MagentoSyncStrategy.background:
        return MagentoSyncType.background;
      case MagentoSyncStrategy.manual:
        return MagentoSyncType.manual;
    }
  }

  @override
  void dispose() {
    // Cancel all scheduled syncs
    for (final timer in _scheduledSyncs.values) {
      timer.cancel();
    }
    _scheduledSyncs.clear();

    // Close stream controllers
    _statusController.close();
    _resultController.close();
    _errorController.close();

    super.dispose();
  }
}

/// Sync strategies available
enum MagentoSyncStrategy {
  /// Sync all data
  full,

  /// Sync only changed data
  incremental,

  /// Sync specific items
  selective,

  /// Background sync
  background,

  /// Manual sync
  manual,
}

/// Sync status values
enum MagentoSyncStatus {
  /// No sync operation in progress
  idle,

  /// Sync operation in progress
  syncing,

  /// Last sync completed successfully
  success,

  /// Last sync failed
  error,

  /// Sync paused
  paused,

  /// Conflicts need resolution
  conflictResolution,
}

/// Statistics for a sync data type
@immutable
class MagentoSyncStats {
  const MagentoSyncStats({
    required this.dataType,
    this.lastSyncTime,
    this.pendingItemsCount = 0,
    this.isScheduled = false,
    this.isActive = false,
  });

  /// The data type these stats are for
  final String dataType;

  /// When the last sync occurred
  final DateTime? lastSyncTime;

  /// Number of items waiting to be synced
  final int pendingItemsCount;

  /// Whether automatic sync is scheduled
  final bool isScheduled;

  /// Whether sync is currently active
  final bool isActive;

  /// Whether sync is needed (has pending items or hasn't synced recently)
  bool get needsSync =>
      pendingItemsCount > 0 ||
      (lastSyncTime == null ||
          DateTime.now().difference(lastSyncTime!).inHours > 24);

  @override
  String toString() => 'MagentoSyncStats('
      'dataType: $dataType, '
      'lastSync: $lastSyncTime, '
      'pending: $pendingItemsCount, '
      'scheduled: $isScheduled, '
      'active: $isActive'
      ')';
}
