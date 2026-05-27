/// Cache entry with metadata for TTL and expiration.
class CacheEntry<T> {
  /// The cached data.
  final T data;

  /// When the entry was created.
  final DateTime createdAt;

  /// When the entry expires (null means never).
  final DateTime? expiresAt;

  const CacheEntry({
    required this.data,
    required this.createdAt,
    this.expiresAt,
  });

  /// Whether this entry is expired.
  bool get isExpired {
    if (expiresAt == null) return false;
    return DateTime.now().isAfter(expiresAt!);
  }

  /// Remaining time until expiration.
  Duration? get timeToLive {
    if (expiresAt == null) return null;
    final remaining = expiresAt!.difference(DateTime.now());
    return remaining.isNegative ? Duration.zero : remaining;
  }

  /// Converts to JSON for storage.
  Map<String, dynamic> toJson(Object? Function(T) encoder) {
    return {
      'data': encoder(data),
      'createdAt': createdAt.toIso8601String(),
      'expiresAt': expiresAt?.toIso8601String(),
    };
  }

  /// Creates from JSON.
  static CacheEntry<T> fromJson<T>(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) decoder,
  ) {
    return CacheEntry<T>(
      data: decoder(json['data'] as Map<String, dynamic>),
      createdAt: DateTime.parse(json['createdAt'] as String),
      expiresAt: json['expiresAt'] != null
          ? DateTime.parse(json['expiresAt'] as String)
          : null,
    );
  }
}
