import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../models/result_models.dart';
import 'network_service.dart';
import 'sync_service.dart';
import 'cache_service.dart';
import 'cloud_feature_service.dart';
import 'notification_service.dart';

/// Central service manager for all Magento services
/// Provides unified service lifecycle management and mode switching
class MagentoServiceManager extends ChangeNotifier {
  MagentoServiceManager._internal();

  static MagentoServiceManager? _instance;
  static MagentoServiceManager get instance =>
      _instance ??= MagentoServiceManager._internal();

  // Service instances
  NetworkService? _networkService;
  MagentoSyncService? _syncService;
  MagentoCacheService? _cacheService;
  MagentoCloudFeatureManager? _cloudFeatureManager;
  MagentoNotificationService? _notificationService;

  // Service state
  MagentoServiceMode _currentMode = MagentoServiceMode.initializing;
  bool _isInitialized = false;
  String? _baseUrl;
  final Map<Type, bool> _serviceStates = {};

  // Stream controllers
  final StreamController<MagentoServiceModeChange> _modeChangeController =
      StreamController<MagentoServiceModeChange>.broadcast();
  final StreamController<MagentoServiceEvent> _eventController =
      StreamController<MagentoServiceEvent>.broadcast();

  /// Current service mode
  MagentoServiceMode get currentMode => _currentMode;

  /// Whether the service manager is initialized
  bool get isInitialized => _isInitialized;

  /// Stream of mode changes
  Stream<MagentoServiceModeChange> get modeChangeStream =>
      _modeChangeController.stream;

  /// Stream of service events
  Stream<MagentoServiceEvent> get eventStream => _eventController.stream;

  /// Get network service instance
  NetworkService get networkService {
    _networkService ??= NetworkService();
    return _networkService!;
  }

  /// Get sync service instance
  MagentoSyncService get syncService {
    _syncService ??= MagentoSyncService(networkService: networkService);
    return _syncService!;
  }

  /// Get cache service instance
  MagentoCacheService get cacheService {
    _cacheService ??= MagentoCacheService();
    return _cacheService!;
  }

  /// Get cloud feature manager instance
  MagentoCloudFeatureManager get cloudFeatureManager {
    _cloudFeatureManager ??=
        MagentoCloudFeatureManager(networkService: networkService);
    return _cloudFeatureManager!;
  }

  /// Get notification service instance
  MagentoNotificationService get notificationService {
    _notificationService ??= MagentoNotificationService();
    return _notificationService!;
  }

  /// Initialize all services
  Future<MagentoOperationResult<bool>> initializeServices({
    required String baseUrl,
    MagentoServiceConfig? config,
  }) async {
    if (_isInitialized) {
      return MagentoOperationResult.success(true);
    }

    try {
      _baseUrl = baseUrl;
      _setMode(MagentoServiceMode.initializing, 'Initializing services');

      // Initialize core services
      await _initializeNetworkService();
      await _initializeCacheService();
      await _initializeNotificationService();

      // Initialize dependent services
      await _initializeSyncService();
      await _initializeCloudFeatureManager();

      // Setup service listeners
      _setupServiceListeners();

      // Determine initial mode based on network state
      if (networkService.isOnline) {
        _setMode(
            MagentoServiceMode.hybrid, 'Services initialized with network');
      } else {
        _setMode(MagentoServiceMode.offline, 'Services initialized offline');
      }

      _isInitialized = true;

      _eventController.add(MagentoServiceEvent(
        type: MagentoServiceEventType.initialized,
        message: 'All services initialized successfully',
      ));

      return MagentoOperationResult.success(true);
    } catch (e) {
      _setMode(MagentoServiceMode.error, 'Service initialization failed: $e');

      _eventController.add(MagentoServiceEvent(
        type: MagentoServiceEventType.error,
        message: 'Service initialization failed: $e',
      ));

      return MagentoOperationResult.error('Service initialization failed: $e');
    }
  }

  /// Get a service instance by type
  T getService<T>() {
    switch (T) {
      case NetworkService:
        return networkService as T;
      case MagentoSyncService:
        return syncService as T;
      case MagentoCacheService:
        return cacheService as T;
      case MagentoCloudFeatureManager:
        return cloudFeatureManager as T;
      case MagentoNotificationService:
        return notificationService as T;
      default:
        throw ArgumentError('Unknown service type: $T');
    }
  }

  /// Switch service mode
  Future<void> switchMode(MagentoServiceMode targetMode,
      {String? reason}) async {
    if (_currentMode == targetMode) {
      return;
    }

    final previousMode = _currentMode;

    try {
      _setMode(MagentoServiceMode.switching, reason ?? 'Mode switch requested');

      switch (targetMode) {
        case MagentoServiceMode.offline:
          await _switchToOfflineMode();
          break;
        case MagentoServiceMode.hybrid:
          await _switchToHybridMode();
          break;
        case MagentoServiceMode.cloudOnly:
          await _switchToCloudOnlyMode();
          break;
        default:
          throw ArgumentError('Invalid target mode: $targetMode');
      }

      _setMode(targetMode, reason ?? 'Mode switched successfully');

      _eventController.add(MagentoServiceEvent(
        type: MagentoServiceEventType.modeChanged,
        message: 'Mode changed from $previousMode to $targetMode',
      ));
    } catch (e) {
      _setMode(previousMode, 'Mode switch failed: $e');

      _eventController.add(MagentoServiceEvent(
        type: MagentoServiceEventType.error,
        message: 'Mode switch failed: $e',
      ));

      rethrow;
    }
  }

  /// Force sync all pending data across services
  Future<Map<String, MagentoSyncResult>> syncAllPendingData() async {
    if (!_isInitialized) {
      throw StateError('Service manager not initialized');
    }

    return await syncService.syncAllPending();
  }

  /// Get comprehensive service status
  MagentoServiceStatus getDetailedStatus() {
    return MagentoServiceStatus(
      mode: _currentMode,
      isInitialized: _isInitialized,
      networkOnline: networkService.isOnline,
      serviceStates: Map.from(_serviceStates),
      cacheStats: _cacheService?.getStats(),
      syncStats: null, // Would need to aggregate from sync service
      cloudFeatureStats: _cloudFeatureManager?.getAllStats(),
    );
  }

  /// Reset all services
  Future<void> resetServices() async {
    _eventController.add(MagentoServiceEvent(
      type: MagentoServiceEventType.resetting,
      message: 'Resetting all services',
    ));

    // Dispose existing services
    _syncService?.dispose();
    _cacheService?.dispose();
    _cloudFeatureManager?.dispose();
    _notificationService?.dispose();

    // Clear references
    _syncService = null;
    _cacheService = null;
    _cloudFeatureManager = null;
    _notificationService = null;

    _serviceStates.clear();
    _isInitialized = false;
    _setMode(MagentoServiceMode.initializing, 'Services reset');

    _eventController.add(MagentoServiceEvent(
      type: MagentoServiceEventType.reset,
      message: 'All services reset',
    ));
  }

  // Private methods

  Future<void> _initializeNetworkService() async {
    try {
      await networkService.initialize(baseUrl: _baseUrl!);
      _serviceStates[NetworkService] = true;
    } catch (e) {
      _serviceStates[NetworkService] = false;
      rethrow;
    }
  }

  Future<void> _initializeCacheService() async {
    try {
      await cacheService.initialize();
      _serviceStates[MagentoCacheService] = true;
    } catch (e) {
      _serviceStates[MagentoCacheService] = false;
      rethrow;
    }
  }

  Future<void> _initializeNotificationService() async {
    try {
      await notificationService.initialize();
      _serviceStates[MagentoNotificationService] = true;
    } catch (e) {
      _serviceStates[MagentoNotificationService] = false;
      rethrow;
    }
  }

  Future<void> _initializeSyncService() async {
    try {
      await syncService.initialize();
      _serviceStates[MagentoSyncService] = true;
    } catch (e) {
      _serviceStates[MagentoSyncService] = false;
      rethrow;
    }
  }

  Future<void> _initializeCloudFeatureManager() async {
    try {
      await cloudFeatureManager.initialize();
      _serviceStates[MagentoCloudFeatureManager] = true;
    } catch (e) {
      _serviceStates[MagentoCloudFeatureManager] = false;
      rethrow;
    }
  }

  void _setupServiceListeners() {
    // Listen to network changes
    networkService.connectionStream.listen((results) {
      final isOnline = results.isNotEmpty && !results.every((result) => result == ConnectivityResult.none);
      if (isOnline && _currentMode == MagentoServiceMode.offline) {
        switchMode(MagentoServiceMode.hybrid,
            reason: 'Network became available');
      } else if (!isOnline && _currentMode != MagentoServiceMode.offline) {
        switchMode(MagentoServiceMode.offline,
            reason: 'Network became unavailable');
      }
    });

    // Listen to sync events
    syncService.errorStream.listen((error) {
      _eventController.add(MagentoServiceEvent(
        type: MagentoServiceEventType.error,
        message: 'Sync error: $error',
      ));
    });

    // Listen to cloud feature events
    cloudFeatureManager.errorStream.listen((error) {
      _eventController.add(MagentoServiceEvent(
        type: MagentoServiceEventType.error,
        message: 'Cloud feature error: $error',
      ));
    });
  }

  Future<void> _switchToOfflineMode() async {
    // Configure services for offline operation
    // This would disable cloud features, pause sync, etc.
    if (kDebugMode) {
      print('Switching to offline mode');
    }
  }

  Future<void> _switchToHybridMode() async {
    // Configure services for hybrid operation
    // This would enable both local and cloud features
    if (kDebugMode) {
      print('Switching to hybrid mode');
    }
  }

  Future<void> _switchToCloudOnlyMode() async {
    // Configure services for cloud-only operation
    // This would prioritize cloud features over local ones
    if (kDebugMode) {
      print('Switching to cloud-only mode');
    }
  }

  void _setMode(MagentoServiceMode mode, String reason) {
    final previousMode = _currentMode;
    _currentMode = mode;

    _modeChangeController.add(MagentoServiceModeChange(
      previousMode: previousMode,
      newMode: mode,
      reason: reason,
      timestamp: DateTime.now(),
    ));

    notifyListeners();
  }

  @override
  void dispose() {
    // Dispose all services
    _syncService?.dispose();
    _cacheService?.dispose();
    _cloudFeatureManager?.dispose();
    _notificationService?.dispose();

    // Close stream controllers
    _modeChangeController.close();
    _eventController.close();

    super.dispose();
  }
}

/// Service operation modes
enum MagentoServiceMode {
  /// Services are being initialized
  initializing,

  /// Services are switching modes
  switching,

  /// Offline mode - only local features available
  offline,

  /// Hybrid mode - both local and cloud features available
  hybrid,

  /// Cloud-only mode - prioritize cloud features
  cloudOnly,

  /// Error state
  error,
}

/// Service mode change event
@immutable
class MagentoServiceModeChange {
  const MagentoServiceModeChange({
    required this.previousMode,
    required this.newMode,
    required this.reason,
    required this.timestamp,
  });

  final MagentoServiceMode previousMode;
  final MagentoServiceMode newMode;
  final String reason;
  final DateTime timestamp;

  @override
  String toString() => 'MagentoServiceModeChange('
      '$previousMode -> $newMode: $reason'
      ')';
}

/// Service event
@immutable
class MagentoServiceEvent {
  const MagentoServiceEvent({
    required this.type,
    required this.message,
    this.data,
  });

  final MagentoServiceEventType type;
  final String message;
  final Map<String, dynamic>? data;

  @override
  String toString() => 'MagentoServiceEvent($type: $message)';
}

/// Types of service events
enum MagentoServiceEventType {
  initialized,
  modeChanged,
  error,
  warning,
  resetting,
  reset,
}

/// Comprehensive service status
@immutable
class MagentoServiceStatus {
  const MagentoServiceStatus({
    required this.mode,
    required this.isInitialized,
    required this.networkOnline,
    required this.serviceStates,
    this.cacheStats,
    this.syncStats,
    this.cloudFeatureStats,
  });

  final MagentoServiceMode mode;
  final bool isInitialized;
  final bool networkOnline;
  final Map<Type, bool> serviceStates;
  final MagentoCacheStats? cacheStats;
  final Map<String, MagentoSyncStats>? syncStats;
  final Map<MagentoCloudFeatureType, MagentoCloudFeatureStats>?
      cloudFeatureStats;

  /// Whether all services are healthy
  bool get isHealthy => serviceStates.values.every((healthy) => healthy);

  /// Number of healthy services
  int get healthyServiceCount =>
      serviceStates.values.where((healthy) => healthy).length;

  /// Total number of services
  int get totalServiceCount => serviceStates.length;

  @override
  String toString() => 'MagentoServiceStatus('
      'mode: $mode, '
      'initialized: $isInitialized, '
      'online: $networkOnline, '
      'healthy: $healthyServiceCount/$totalServiceCount'
      ')';
}

/// Configuration for service manager
@immutable
class MagentoServiceConfig {
  const MagentoServiceConfig({
    this.enableOfflineMode = true,
    this.enableCloudFeatures = true,
    this.enableAutoSync = true,
    this.cacheMaxSize = 50 * 1024 * 1024, // 50MB
    this.syncInterval = const Duration(minutes: 30),
    this.networkTimeout = const Duration(seconds: 30),
  });

  final bool enableOfflineMode;
  final bool enableCloudFeatures;
  final bool enableAutoSync;
  final int cacheMaxSize;
  final Duration syncInterval;
  final Duration networkTimeout;
}
