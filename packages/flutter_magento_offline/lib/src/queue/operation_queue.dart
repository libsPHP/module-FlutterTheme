import 'dart:async';

import 'package:hive_flutter/hive_flutter.dart';

import 'operations.dart';

/// Persistent queue for cart operations.
class OperationQueue {
  final Box<Map> _box;
  final _changeController = StreamController<List<CartOperation>>.broadcast();

  OperationQueue({required Box<Map> box}) : _box = box;

  /// Opens or creates an operation queue.
  static Future<OperationQueue> open({
    String boxName = 'magento_operation_queue',
  }) async {
    await Hive.initFlutter();
    final box = await Hive.openBox<Map>(boxName);
    return OperationQueue(box: box);
  }

  /// Stream of queue changes.
  Stream<List<CartOperation>> get changes => _changeController.stream;

  /// Gets all pending operations.
  Future<List<CartOperation>> getPending() async {
    return _getByStatus(OperationStatus.pending);
  }

  /// Gets all failed operations.
  Future<List<CartOperation>> getFailed() async {
    return _getByStatus(OperationStatus.failed);
  }

  /// Gets all operations in the queue.
  Future<List<CartOperation>> getAll() async {
    final operations = <CartOperation>[];
    for (final key in _box.keys) {
      final raw = _box.get(key);
      if (raw != null) {
        try {
          final map = Map<String, dynamic>.from(raw);
          operations.add(CartOperation.fromJson(map));
        } catch (_) {
          // Skip invalid entries
        }
      }
    }
    // Sort by creation time
    operations.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    return operations;
  }

  List<CartOperation> _getByStatus(OperationStatus status) {
    final operations = <CartOperation>[];
    for (final key in _box.keys) {
      final raw = _box.get(key);
      if (raw != null) {
        try {
          final map = Map<String, dynamic>.from(raw);
          final op = CartOperation.fromJson(map);
          if (op.status == status) {
            operations.add(op);
          }
        } catch (_) {
          // Skip invalid entries
        }
      }
    }
    operations.sort((a, b) => a.createdAt.compareTo(b.createdAt));
    return operations;
  }

  /// Enqueues a new operation.
  Future<void> enqueue(CartOperation operation) async {
    await _box.put(operation.id, operation.toJson());
    _notifyChanges();
  }

  /// Marks an operation as in progress.
  Future<void> markInProgress(String operationId) async {
    await _updateStatus(operationId, OperationStatus.inProgress);
  }

  /// Marks an operation as completed.
  Future<void> markCompleted(String operationId) async {
    await _box.delete(operationId);
    _notifyChanges();
  }

  /// Marks an operation as failed.
  Future<void> markFailed(String operationId, String errorMessage) async {
    final raw = _box.get(operationId);
    if (raw == null) return;

    final map = Map<String, dynamic>.from(raw);
    final operation = CartOperation.fromJson(map);
    final updated = operation.copyWith(
      status: OperationStatus.failed,
      errorMessage: errorMessage,
    );
    await _box.put(operationId, updated.toJson());
    _notifyChanges();
  }

  /// Retries a failed operation by marking it as pending.
  Future<void> retry(String operationId) async {
    await _updateStatus(operationId, OperationStatus.pending);
  }

  /// Retries all failed operations.
  Future<void> retryAll() async {
    final failed = await getFailed();
    for (final op in failed) {
      await retry(op.id);
    }
  }

  /// Removes an operation from the queue.
  Future<void> remove(String operationId) async {
    await _box.delete(operationId);
    _notifyChanges();
  }

  /// Clears all operations from the queue.
  Future<void> clear() async {
    await _box.clear();
    _notifyChanges();
  }

  /// Gets the count of pending operations.
  Future<int> get pendingCount async => (await getPending()).length;

  /// Gets the count of failed operations.
  Future<int> get failedCount async => (await getFailed()).length;

  /// Whether there are any pending operations.
  Future<bool> get hasPending async => (await pendingCount) > 0;

  Future<void> _updateStatus(String operationId, OperationStatus status) async {
    final raw = _box.get(operationId);
    if (raw == null) return;

    final map = Map<String, dynamic>.from(raw);
    final operation = CartOperation.fromJson(map);
    final updated = operation.copyWith(status: status);
    await _box.put(operationId, updated.toJson());
    _notifyChanges();
  }

  void _notifyChanges() {
    getAll().then((ops) {
      if (!_changeController.isClosed) {
        _changeController.add(ops);
      }
    });
  }

  /// Closes the queue.
  Future<void> close() async {
    await _changeController.close();
    await _box.close();
  }
}
