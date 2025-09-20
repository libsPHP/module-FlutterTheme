import 'package:json_annotation/json_annotation.dart';

/// Запись кэша
@JsonSerializable()
class CacheEntry {
  final String key;
  final String data;
  final DateTime? expiry;
  final List<String> tags;
  final DateTime createdAt;
  final DateTime updatedAt;

  const CacheEntry({
    required this.key,
    required this.data,
    this.expiry,
    this.tags = const [],
    required this.createdAt,
    required this.updatedAt,
  });

  factory CacheEntry.fromJson(Map<String, dynamic> json) {
    return CacheEntry(
      key: json['key'] as String,
      data: json['data'] as String,
      expiry: json['expiry'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['expiry'] as int)
          : null,
      tags: (json['tags'] as List<dynamic>?)?.cast<String>() ?? [],
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(json['updatedAt'] as int),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'data': data,
      'expiry': expiry?.millisecondsSinceEpoch,
      'tags': tags,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  /// Создание из строки базы данных
  factory CacheEntry.fromDatabaseRow(Map<String, dynamic> row) {
    return CacheEntry(
      key: row['key'] as String,
      data: row['data'] as String,
      expiry: row['expiry'] != null
          ? DateTime.fromMillisecondsSinceEpoch(row['expiry'] as int)
          : null,
      tags: (row['tags'] as String?)?.split(',') ?? [],
      createdAt: DateTime.fromMillisecondsSinceEpoch(row['created_at'] as int),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(row['updated_at'] as int),
    );
  }

  /// Преобразование в строку для базы данных
  Map<String, dynamic> toDatabaseRow() {
    return {
      'key': key,
      'data': data,
      'expiry': expiry?.millisecondsSinceEpoch,
      'tags': tags.join(','),
      'created_at': createdAt.millisecondsSinceEpoch,
      'updated_at': updatedAt.millisecondsSinceEpoch,
    };
  }

  bool get isExpired => expiry != null && DateTime.now().isAfter(expiry!);
}


/// Статус офлайн операции
enum OfflineOperationStatus {
  pending,
  processing,
  completed,
  failed,
  cancelled
}

/// HTTP методы
enum HttpMethod { get, post, put, patch, delete }

/// Офлайн операция
@JsonSerializable()
class OfflineOperation {
  final String operationId;
  final String type;
  final String endpoint;
  final HttpMethod method;
  final Map<String, dynamic>? data;
  final Map<String, String>? headers;
  final int priority;
  final int retryCount;
  final int maxRetries;
  final DateTime createdAt;
  final DateTime? scheduledAt;
  final OfflineOperationStatus status;

  const OfflineOperation({
    required this.operationId,
    required this.type,
    required this.endpoint,
    required this.method,
    this.data,
    this.headers,
    this.priority = 0,
    this.retryCount = 0,
    this.maxRetries = 3,
    required this.createdAt,
    this.scheduledAt,
    this.status = OfflineOperationStatus.pending,
  });

  factory OfflineOperation.fromJson(Map<String, dynamic> json) {
    return OfflineOperation(
      operationId: json['operationId'] as String,
      type: json['type'] as String,
      endpoint: json['endpoint'] as String,
      method: HttpMethod.values.firstWhere(
        (e) => e.name == json['method'],
        orElse: () => HttpMethod.get,
      ),
      data: json['data'] as Map<String, dynamic>?,
      headers: (json['headers'] as Map<String, dynamic>?)?.cast<String, String>(),
      priority: json['priority'] as int? ?? 0,
      retryCount: json['retryCount'] as int? ?? 0,
      maxRetries: json['maxRetries'] as int? ?? 3,
      createdAt: DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
      scheduledAt: json['scheduledAt'] != null
          ? DateTime.fromMillisecondsSinceEpoch(json['scheduledAt'] as int)
          : null,
      status: OfflineOperationStatus.values.firstWhere(
        (e) => e.name == json['status'],
        orElse: () => OfflineOperationStatus.pending,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'operationId': operationId,
      'type': type,
      'endpoint': endpoint,
      'method': method.name,
      'data': data,
      'headers': headers,
      'priority': priority,
      'retryCount': retryCount,
      'maxRetries': maxRetries,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'scheduledAt': scheduledAt?.millisecondsSinceEpoch,
      'status': status.name,
    };
  }

  /// Создание из строки базы данных
  factory OfflineOperation.fromDatabaseRow(Map<String, dynamic> row) {
    return OfflineOperation(
      operationId: row['operation_id'] as String,
      type: row['type'] as String,
      endpoint: row['endpoint'] as String,
      method: HttpMethod.values.firstWhere(
        (m) => m.name == row['method'],
        orElse: () => HttpMethod.get,
      ),
      data: row['data'] != null
          ? Map<String, dynamic>.from(
              Map.from(Uri.splitQueryString(row['data'] as String)))
          : null,
      headers: row['headers'] != null
          ? Map<String, String>.from(
              Map.from(Uri.splitQueryString(row['headers'] as String)))
          : null,
      priority: row['priority'] as int? ?? 0,
      retryCount: row['retry_count'] as int? ?? 0,
      maxRetries: row['max_retries'] as int? ?? 3,
      createdAt: DateTime.fromMillisecondsSinceEpoch(row['created_at'] as int),
      scheduledAt: row['scheduled_at'] != null
          ? DateTime.fromMillisecondsSinceEpoch(row['scheduled_at'] as int)
          : null,
      status: OfflineOperationStatus.values.firstWhere(
        (s) => s.name == row['status'],
        orElse: () => OfflineOperationStatus.pending,
      ),
    );
  }

  /// Преобразование в строку для базы данных
  Map<String, dynamic> toDatabaseRow() {
    return {
      'operation_id': operationId,
      'type': type,
      'endpoint': endpoint,
      'method': method.name,
      'data': data?.toString(),
      'headers': headers?.toString(),
      'priority': priority,
      'retry_count': retryCount,
      'max_retries': maxRetries,
      'created_at': createdAt.millisecondsSinceEpoch,
      'scheduled_at': scheduledAt?.millisecondsSinceEpoch,
      'status': status.name,
    };
  }

  OfflineOperation copyWith({
    String? operationId,
    String? type,
    String? endpoint,
    HttpMethod? method,
    Map<String, dynamic>? data,
    Map<String, String>? headers,
    int? priority,
    int? retryCount,
    int? maxRetries,
    DateTime? createdAt,
    DateTime? scheduledAt,
    OfflineOperationStatus? status,
  }) {
    return OfflineOperation(
      operationId: operationId ?? this.operationId,
      type: type ?? this.type,
      endpoint: endpoint ?? this.endpoint,
      method: method ?? this.method,
      data: data ?? this.data,
      headers: headers ?? this.headers,
      priority: priority ?? this.priority,
      retryCount: retryCount ?? this.retryCount,
      maxRetries: maxRetries ?? this.maxRetries,
      createdAt: createdAt ?? this.createdAt,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      status: status ?? this.status,
    );
  }
}


/// Настройки офлайн режима
@JsonSerializable()
class OfflineSettings {
  final bool autoSyncEnabled;
  final Duration? autoSyncInterval;
  final bool forceOfflineMode;
  final int maxCacheSize;
  final Duration defaultCacheTtl;
  final int maxRetries;
  final Duration retryDelay;
  final bool compressData;
  final bool encryptSensitiveData;

  const OfflineSettings({
    this.autoSyncEnabled = true,
    this.autoSyncInterval = const Duration(minutes: 15),
    this.forceOfflineMode = false,
    this.maxCacheSize = 100 * 1024 * 1024, // 100MB
    this.defaultCacheTtl = const Duration(hours: 24),
    this.maxRetries = 3,
    this.retryDelay = const Duration(seconds: 5),
    this.compressData = true,
    this.encryptSensitiveData = true,
  });

  factory OfflineSettings.fromJson(Map<String, dynamic> json) {
    return OfflineSettings(
      autoSyncEnabled: json['autoSyncEnabled'] as bool? ?? true,
      autoSyncInterval: json['autoSyncInterval'] != null
          ? Duration(milliseconds: json['autoSyncInterval'] as int)
          : const Duration(minutes: 15),
      forceOfflineMode: json['forceOfflineMode'] as bool? ?? false,
      maxCacheSize: json['maxCacheSize'] as int? ?? 100 * 1024 * 1024,
      defaultCacheTtl: json['defaultCacheTtl'] != null
          ? Duration(milliseconds: json['defaultCacheTtl'] as int)
          : const Duration(hours: 24),
      maxRetries: json['maxRetries'] as int? ?? 3,
      retryDelay: json['retryDelay'] != null
          ? Duration(milliseconds: json['retryDelay'] as int)
          : const Duration(seconds: 5),
      compressData: json['compressData'] as bool? ?? false,
      encryptSensitiveData: json['encryptSensitiveData'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'autoSyncEnabled': autoSyncEnabled,
      'autoSyncInterval': autoSyncInterval?.inMilliseconds,
      'forceOfflineMode': forceOfflineMode,
      'maxCacheSize': maxCacheSize,
      'defaultCacheTtl': defaultCacheTtl.inMilliseconds,
      'maxRetries': maxRetries,
      'retryDelay': retryDelay.inMilliseconds,
      'compressData': compressData,
      'encryptSensitiveData': encryptSensitiveData,
    };
  }

  OfflineSettings copyWith({
    bool? autoSyncEnabled,
    Duration? autoSyncInterval,
    bool? forceOfflineMode,
    int? maxCacheSize,
    Duration? defaultCacheTtl,
    int? maxRetries,
    Duration? retryDelay,
    bool? compressData,
    bool? encryptSensitiveData,
  }) {
    return OfflineSettings(
      autoSyncEnabled: autoSyncEnabled ?? this.autoSyncEnabled,
      autoSyncInterval: autoSyncInterval ?? this.autoSyncInterval,
      forceOfflineMode: forceOfflineMode ?? this.forceOfflineMode,
      maxCacheSize: maxCacheSize ?? this.maxCacheSize,
      defaultCacheTtl: defaultCacheTtl ?? this.defaultCacheTtl,
      maxRetries: maxRetries ?? this.maxRetries,
      retryDelay: retryDelay ?? this.retryDelay,
      compressData: compressData ?? this.compressData,
      encryptSensitiveData: encryptSensitiveData ?? this.encryptSensitiveData,
    );
  }
}

/// События офлайн сервиса
abstract class OfflineEvent {
  const OfflineEvent();

  factory OfflineEvent.dataCached(String key, dynamic data) = DataCachedEvent;
  factory OfflineEvent.dataRemoved(String key) = DataRemovedEvent;
  factory OfflineEvent.cacheCleared(List<String>? tags) = CacheClearedEvent;
  factory OfflineEvent.operationQueued(OfflineOperation operation) =
      OperationQueuedEvent;
  factory OfflineEvent.operationCompleted(OfflineOperation operation) =
      OperationCompletedEvent;
  factory OfflineEvent.operationFailed(
      OfflineOperation operation, String error) = OperationFailedEvent;
  factory OfflineEvent.offlineModeChanged(bool enabled) =
      OfflineModeChangedEvent;
  factory OfflineEvent.syncStarted() = SyncStartedEvent;
  factory OfflineEvent.syncCompleted(int processedCount) = SyncCompletedEvent;
}

class DataCachedEvent extends OfflineEvent {
  final String key;
  final dynamic data;

  const DataCachedEvent(this.key, this.data);
}

class DataRemovedEvent extends OfflineEvent {
  final String key;

  const DataRemovedEvent(this.key);
}

class CacheClearedEvent extends OfflineEvent {
  final List<String>? tags;

  const CacheClearedEvent(this.tags);
}

class OperationQueuedEvent extends OfflineEvent {
  final OfflineOperation operation;

  const OperationQueuedEvent(this.operation);
}

class OperationCompletedEvent extends OfflineEvent {
  final OfflineOperation operation;

  const OperationCompletedEvent(this.operation);
}

class OperationFailedEvent extends OfflineEvent {
  final OfflineOperation operation;
  final String error;

  const OperationFailedEvent(this.operation, this.error);
}

class OfflineModeChangedEvent extends OfflineEvent {
  final bool enabled;

  const OfflineModeChangedEvent(this.enabled);
}

class SyncStartedEvent extends OfflineEvent {
  const SyncStartedEvent();
}

class SyncCompletedEvent extends OfflineEvent {
  final int processedCount;

  const SyncCompletedEvent(this.processedCount);
}
