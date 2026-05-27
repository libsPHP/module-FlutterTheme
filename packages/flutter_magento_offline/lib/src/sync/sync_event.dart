import 'package:flutter_magento_core/flutter_magento_core.dart';

/// Events emitted by the sync engine.
sealed class SyncEvent {
  const SyncEvent();

  /// Sync has started.
  factory SyncEvent.started() = SyncStarted;

  /// Sync progress update.
  factory SyncEvent.progress(int current, int total) = SyncProgress;

  /// Sync completed successfully.
  factory SyncEvent.completed(int completed, int failed) = SyncCompleted;

  /// Sync failed with an error.
  factory SyncEvent.failed(MagentoException error) = SyncFailed;

  /// Connectivity changed.
  factory SyncEvent.connectivityChanged(bool isOnline) = ConnectivityChanged;
}

/// Sync has started.
final class SyncStarted extends SyncEvent {
  const SyncStarted();
}

/// Sync progress update.
final class SyncProgress extends SyncEvent {
  /// Current operation number.
  final int current;

  /// Total number of operations.
  final int total;

  const SyncProgress(this.current, this.total);

  /// Progress as a percentage (0-100).
  int get percent => total > 0 ? (current * 100 ~/ total) : 0;
}

/// Sync completed successfully.
final class SyncCompleted extends SyncEvent {
  /// Number of operations completed.
  final int completed;

  /// Number of operations that failed.
  final int failed;

  const SyncCompleted(this.completed, this.failed);

  /// Total number of operations processed.
  int get total => completed + failed;

  /// Whether all operations succeeded.
  bool get allSucceeded => failed == 0;
}

/// Sync failed with an error.
final class SyncFailed extends SyncEvent {
  /// The error that caused the failure.
  final MagentoException error;

  const SyncFailed(this.error);
}

/// Connectivity changed.
final class ConnectivityChanged extends SyncEvent {
  /// Whether the device is online.
  final bool isOnline;

  const ConnectivityChanged(this.isOnline);
}
