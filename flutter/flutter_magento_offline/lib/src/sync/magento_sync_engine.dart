import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_magento_core/flutter_magento_core.dart';

import '../queue/operation_queue.dart';
import '../queue/operations.dart';
import 'sync_event.dart';
import 'sync_result.dart';

/// Background sync coordinator for offline operations.
class MagentoSyncEngine {
  final OperationQueue queue;
  final CartRepository cartRepository;
  final Connectivity _connectivity;

  final _eventController = StreamController<SyncEvent>.broadcast();
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  bool _isSyncing = false;
  bool _isOnline = true;

  MagentoSyncEngine({
    required this.queue,
    required this.cartRepository,
    Connectivity? connectivity,
  }) : _connectivity = connectivity ?? Connectivity();

  /// Stream of sync events.
  Stream<SyncEvent> get events => _eventController.stream;

  /// Whether a sync is currently in progress.
  bool get isSyncing => _isSyncing;

  /// Whether the device is currently online.
  bool get isOnline => _isOnline;

  /// Starts listening to connectivity changes and auto-syncing.
  void start() {
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_onConnectivityChanged);
    // Check initial state
    _connectivity.checkConnectivity().then(_onConnectivityChanged);
  }

  /// Stops listening to connectivity changes.
  void stop() {
    _connectivitySubscription?.cancel();
    _connectivitySubscription = null;
  }

  void _onConnectivityChanged(List<ConnectivityResult> results) {
    final wasOnline = _isOnline;
    _isOnline =
        results.isNotEmpty && !results.contains(ConnectivityResult.none);

    if (_isOnline != wasOnline) {
      _eventController.add(SyncEvent.connectivityChanged(_isOnline));
    }

    // Auto-sync when coming back online
    if (_isOnline && !wasOnline) {
      sync();
    }
  }

  /// Executes all pending operations.
  Future<SyncResult> sync() async {
    if (_isSyncing) {
      return SyncResult.empty();
    }

    if (!_isOnline) {
      return SyncResult.empty();
    }

    _isSyncing = true;
    final startedAt = DateTime.now();
    _eventController.add(const SyncStarted());

    final operations = await queue.getPending();
    if (operations.isEmpty) {
      _isSyncing = false;
      final result = SyncResult(
        completed: 0,
        failed: 0,
        startedAt: startedAt,
        completedAt: DateTime.now(),
      );
      _eventController.add(const SyncCompleted(0, 0));
      return result;
    }

    int completed = 0;
    int failed = 0;
    final errors = <String>[];

    for (int i = 0; i < operations.length; i++) {
      final op = operations[i];
      _eventController.add(SyncProgress(i + 1, operations.length));

      try {
        await queue.markInProgress(op.id);
        await _executeOperation(op);
        await queue.markCompleted(op.id);
        completed++;
      } catch (e) {
        final errorMessage = e.toString();
        await queue.markFailed(op.id, errorMessage);
        errors.add(errorMessage);
        failed++;
      }
    }

    _isSyncing = false;
    _eventController.add(SyncCompleted(completed, failed));

    return SyncResult(
      completed: completed,
      failed: failed,
      errors: errors,
      startedAt: startedAt,
      completedAt: DateTime.now(),
    );
  }

  Future<void> _executeOperation(CartOperation operation) async {
    switch (operation) {
      case AddSimpleProductOperation op:
        await cartRepository.addSimpleProduct(
          sku: op.sku,
          quantity: op.quantity,
        );
      case AddConfigurableProductOperation op:
        await cartRepository.addConfigurableProduct(
          parentSku: op.parentSku,
          variantSku: op.variantSku,
          quantity: op.quantity,
          selectedOptions: op.selectedOptions,
        );
      case UpdateQuantityOperation op:
        await cartRepository.updateItemQuantity(
          itemId: op.itemId,
          quantity: op.quantity,
        );
      case RemoveItemOperation op:
        await cartRepository.removeItem(op.itemId);
      case ApplyCouponOperation op:
        await cartRepository.applyCoupon(op.code);
      case RemoveCouponOperation _:
        await cartRepository.removeCoupon();
    }
  }

  /// Retries all failed operations.
  Future<void> retryFailed() async {
    await queue.retryAll();
    if (_isOnline) {
      await sync();
    }
  }

  /// Clears all pending operations.
  Future<void> clearQueue() async {
    await queue.clear();
  }

  /// Disposes resources.
  Future<void> dispose() async {
    stop();
    await _eventController.close();
  }
}
