import 'package:flutter/foundation.dart';

/// Base abstract class for all Magento operation results
@immutable
abstract class MagentoResult<T> {
  const MagentoResult._({
    required this.success,
    this.data,
    this.error,
    required this.timestamp,
  });

  /// Whether the operation was successful
  final bool success;

  /// The result data (null if operation failed)
  final T? data;

  /// Error message (null if operation succeeded)
  final String? error;

  /// When the result was created
  final DateTime timestamp;

  /// Whether the operation failed
  bool get isError => !success;

  /// Whether the operation succeeded and has data
  bool get hasData => success && data != null;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MagentoResult<T> &&
          runtimeType == other.runtimeType &&
          success == other.success &&
          data == other.data &&
          error == other.error;

  @override
  int get hashCode => success.hashCode ^ data.hashCode ^ error.hashCode;

  @override
  String toString() =>
      success ? 'MagentoResult.success($data)' : 'MagentoResult.error($error)';
}

/// Generic success/error result for Magento operations
class MagentoOperationResult<T> extends MagentoResult<T> {
  const MagentoOperationResult._({
    required super.success,
    super.data,
    super.error,
    required super.timestamp,
  }) : super._();

  /// Create a successful result
  factory MagentoOperationResult.success(T data) {
    return MagentoOperationResult._(
      success: true,
      data: data,
      timestamp: DateTime.now(),
    );
  }

  /// Create an error result
  factory MagentoOperationResult.error(String error) {
    return MagentoOperationResult._(
      success: false,
      error: error,
      timestamp: DateTime.now(),
    );
  }

  /// Create an error result from exception
  factory MagentoOperationResult.fromException(Exception exception) {
    return MagentoOperationResult.error(exception.toString());
  }
}

/// Result for authentication operations
class MagentoAuthResult extends MagentoResult<MagentoAuthData> {
  const MagentoAuthResult._({
    required super.success,
    super.data,
    super.error,
    required super.timestamp,
  }) : super._();

  /// Create a successful authentication result
  factory MagentoAuthResult.success(MagentoAuthData authData) {
    return MagentoAuthResult._(
      success: true,
      data: authData,
      timestamp: DateTime.now(),
    );
  }

  /// Create an authentication error result
  factory MagentoAuthResult.error(String error) {
    return MagentoAuthResult._(
      success: false,
      error: error,
      timestamp: DateTime.now(),
    );
  }

  /// Convenience getters
  String? get token => data?.token;
  String? get customerId => data?.customerId;
  Map<String, dynamic>? get customerData => data?.customerData;
}

/// Authentication data container
@immutable
class MagentoAuthData {
  const MagentoAuthData({
    required this.token,
    required this.customerId,
    this.customerData,
    this.expiresAt,
  });

  final String token;
  final String customerId;
  final Map<String, dynamic>? customerData;
  final DateTime? expiresAt;

  /// Whether the token is expired
  bool get isExpired => expiresAt != null && DateTime.now().isAfter(expiresAt!);

  /// Whether the token is still valid
  bool get isValid => !isExpired;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MagentoAuthData &&
          runtimeType == other.runtimeType &&
          token == other.token &&
          customerId == other.customerId;

  @override
  int get hashCode => token.hashCode ^ customerId.hashCode;

  @override
  String toString() =>
      'MagentoAuthData(customerId: $customerId, expired: $isExpired)';
}

/// Result for synchronization operations
class MagentoSyncResult<T> extends MagentoResult<List<T>> {
  const MagentoSyncResult._({
    required super.success,
    super.data,
    super.error,
    required super.timestamp,
    this.syncedCount = 0,
    this.failedCount = 0,
    this.conflictCount = 0,
    this.syncType = MagentoSyncType.full,
    this.syncedItems = const [],
    this.failedItems = const [],
    this.conflicts = const [],
  }) : super._();

  /// Number of successfully synced items
  final int syncedCount;

  /// Number of items that failed to sync
  final int failedCount;

  /// Number of conflicted items
  final int conflictCount;

  /// Type of sync operation performed
  final MagentoSyncType syncType;

  /// List of successfully synced item identifiers
  final List<String> syncedItems;

  /// List of failed item identifiers
  final List<String> failedItems;

  /// List of conflicted items requiring manual resolution
  final List<MagentoSyncConflict> conflicts;

  /// Total number of items processed
  int get totalCount => syncedCount + failedCount + conflictCount;

  /// Sync success rate (0.0 to 1.0)
  double get successRate => totalCount > 0 ? syncedCount / totalCount : 0.0;

  /// Whether sync was partially successful
  bool get hasPartialSuccess =>
      success && (failedCount > 0 || conflictCount > 0);

  /// Whether sync completed without any issues
  bool get isCompleteSuccess =>
      success && failedCount == 0 && conflictCount == 0;

  /// Create a successful sync result
  factory MagentoSyncResult.success({
    List<T>? data,
    int syncedCount = 0,
    int failedCount = 0,
    int conflictCount = 0,
    MagentoSyncType syncType = MagentoSyncType.full,
    List<String> syncedItems = const [],
    List<String> failedItems = const [],
    List<MagentoSyncConflict> conflicts = const [],
  }) {
    return MagentoSyncResult._(
      success: true,
      data: data ?? [],
      syncedCount: syncedCount,
      failedCount: failedCount,
      conflictCount: conflictCount,
      syncType: syncType,
      syncedItems: syncedItems,
      failedItems: failedItems,
      conflicts: conflicts,
      timestamp: DateTime.now(),
    );
  }

  /// Create a failed sync result
  factory MagentoSyncResult.error(
    String error, {
    MagentoSyncType syncType = MagentoSyncType.full,
  }) {
    return MagentoSyncResult._(
      success: false,
      error: error,
      syncType: syncType,
      timestamp: DateTime.now(),
    );
  }

  @override
  String toString() => success
      ? 'MagentoSyncResult.success(synced: $syncedCount, failed: $failedCount, conflicts: $conflictCount)'
      : 'MagentoSyncResult.error($error)';
}

/// Types of sync operations
enum MagentoSyncType {
  /// Full synchronization of all data
  full,

  /// Incremental sync of only changed data
  incremental,

  /// Selective sync of specific items
  selective,

  /// Background sync operation
  background,

  /// Manual sync triggered by user
  manual,
}

/// Represents a sync conflict that needs resolution
@immutable
class MagentoSyncConflict {
  const MagentoSyncConflict({
    required this.itemId,
    required this.conflictType,
    required this.localData,
    required this.remoteData,
    this.description,
  });

  /// Identifier of the conflicted item
  final String itemId;

  /// Type of conflict
  final MagentoSyncConflictType conflictType;

  /// Local version of the data
  final Map<String, dynamic> localData;

  /// Remote version of the data
  final Map<String, dynamic> remoteData;

  /// Human-readable description of the conflict
  final String? description;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MagentoSyncConflict &&
          runtimeType == other.runtimeType &&
          itemId == other.itemId &&
          conflictType == other.conflictType;

  @override
  int get hashCode => itemId.hashCode ^ conflictType.hashCode;

  @override
  String toString() =>
      'MagentoSyncConflict(itemId: $itemId, type: $conflictType)';
}

/// Types of sync conflicts
enum MagentoSyncConflictType {
  /// Both local and remote versions were modified
  bothModified,

  /// Item was deleted remotely but modified locally
  deletedRemoteModifiedLocal,

  /// Item was deleted locally but modified remotely
  deletedLocalModifiedRemote,

  /// Data format or schema conflict
  schemaConflict,

  /// Permission or access conflict
  permissionConflict,
}

/// Result for cache operations
class MagentoCacheResult<T> extends MagentoResult<T> {
  const MagentoCacheResult._({
    required super.success,
    super.data,
    super.error,
    required super.timestamp,
    this.cacheKey,
    this.cacheHit = false,
    this.expiresAt,
  }) : super._();

  /// The cache key used
  final String? cacheKey;

  /// Whether this was a cache hit
  final bool cacheHit;

  /// When the cached data expires
  final DateTime? expiresAt;

  /// Whether the cached data is expired
  bool get isExpired => expiresAt != null && DateTime.now().isAfter(expiresAt!);

  /// Create a successful cache result
  factory MagentoCacheResult.success(
    T data, {
    String? cacheKey,
    bool cacheHit = false,
    DateTime? expiresAt,
  }) {
    return MagentoCacheResult._(
      success: true,
      data: data,
      cacheKey: cacheKey,
      cacheHit: cacheHit,
      expiresAt: expiresAt,
      timestamp: DateTime.now(),
    );
  }

  /// Create a cache miss result
  factory MagentoCacheResult.miss(String cacheKey) {
    return MagentoCacheResult._(
      success: false,
      error: 'Cache miss',
      cacheKey: cacheKey,
      timestamp: DateTime.now(),
    );
  }

  /// Create a cache error result
  factory MagentoCacheResult.error(String error, {String? cacheKey}) {
    return MagentoCacheResult._(
      success: false,
      error: error,
      cacheKey: cacheKey,
      timestamp: DateTime.now(),
    );
  }
}

/// Result for cloud feature operations
class MagentoCloudFeatureResult<T> extends MagentoResult<T> {
  const MagentoCloudFeatureResult._({
    required super.success,
    super.data,
    super.error,
    required super.timestamp,
    this.featureType,
    this.fallbackUsed = false,
    this.cloudProcessingTime,
  }) : super._();

  /// The cloud feature that was executed
  final MagentoCloudFeatureType? featureType;

  /// Whether fallback logic was used instead of cloud
  final bool fallbackUsed;

  /// Time taken for cloud processing
  final Duration? cloudProcessingTime;

  /// Create a successful cloud feature result
  factory MagentoCloudFeatureResult.success(
    T data, {
    MagentoCloudFeatureType? featureType,
    Duration? processingTime,
  }) {
    return MagentoCloudFeatureResult._(
      success: true,
      data: data,
      featureType: featureType,
      cloudProcessingTime: processingTime,
      timestamp: DateTime.now(),
    );
  }

  /// Create a fallback result (when cloud is unavailable)
  factory MagentoCloudFeatureResult.fallback(
    T data, {
    MagentoCloudFeatureType? featureType,
  }) {
    return MagentoCloudFeatureResult._(
      success: true,
      data: data,
      featureType: featureType,
      fallbackUsed: true,
      timestamp: DateTime.now(),
    );
  }

  /// Create an error result
  factory MagentoCloudFeatureResult.error(
    String error, {
    MagentoCloudFeatureType? featureType,
  }) {
    return MagentoCloudFeatureResult._(
      success: false,
      error: error,
      featureType: featureType,
      timestamp: DateTime.now(),
    );
  }
}

/// Types of cloud features
enum MagentoCloudFeatureType {
  /// AI-powered analysis
  aiAnalysis,

  /// Smart recommendations
  smartRecommendations,

  /// Social sharing features
  socialSharing,

  /// Data backup and restore
  dataBackup,

  /// Premium features
  premiumFeatures,

  /// Machine learning models
  mlModels,

  /// Advanced computer vision
  advancedVision,

  /// Interior design assistance
  interiorDesign,

  /// Predictive analytics
  predictiveAnalytics,

  /// Voice assistance
  voiceAssistance,
}
