/// Result of a sync operation.
class SyncResult {
  /// Number of operations completed successfully.
  final int completed;

  /// Number of operations that failed.
  final int failed;

  /// List of error messages for failed operations.
  final List<String> errors;

  /// Time when sync started.
  final DateTime startedAt;

  /// Time when sync completed.
  final DateTime completedAt;

  const SyncResult({
    required this.completed,
    required this.failed,
    this.errors = const [],
    required this.startedAt,
    required this.completedAt,
  });

  /// Total number of operations processed.
  int get total => completed + failed;

  /// Whether all operations succeeded.
  bool get allSucceeded => failed == 0;

  /// Whether sync made any progress.
  bool get hasProgress => completed > 0;

  /// Duration of the sync operation.
  Duration get duration => completedAt.difference(startedAt);

  /// Creates an empty result (no operations to sync).
  factory SyncResult.empty() {
    final now = DateTime.now();
    return SyncResult(
      completed: 0,
      failed: 0,
      startedAt: now,
      completedAt: now,
    );
  }

  @override
  String toString() =>
      'SyncResult(completed: $completed, failed: $failed, duration: ${duration.inMilliseconds}ms)';
}
