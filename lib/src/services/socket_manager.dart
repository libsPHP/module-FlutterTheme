import 'dart:async';
import 'dart:convert';
import 'package:socket_io_client/socket_io_client.dart' as io;
import '../exceptions/magento_exception.dart';

/// Socket.IO менеджер для Magento с улучшенной обработкой подключений
class MagentoSocketManager {
  io.Socket? _socket;
  final String _serverUrl;
  final String? _accessToken;
  final StreamController<Map<String, dynamic>> _eventController =
      StreamController<Map<String, dynamic>>.broadcast();

  MagentoSocketManager({required String serverUrl, String? accessToken})
    : _serverUrl = serverUrl,
      _accessToken = accessToken;

  /// Поток событий от сервера
  Stream<Map<String, dynamic>> get eventStream => _eventController.stream;

  /// Подключение к серверу
  Future<void> connect() async {
    try {
      _socket = io.io(
        _serverUrl,
        io.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .setExtraHeaders(
              _accessToken != null
                  ? {'Authorization': 'Bearer $_accessToken'}
                  : {},
            )
            .build(),
      );

      _socket!.onConnect((_) {
        print('Connected to Magento server');
      });

      _socket!.onDisconnect((_) {
        print('Disconnected from Magento server');
      });

      _socket!.onError((error) {
        print('Socket error: $error');
        _eventController.addError(MagentoException('Socket error: $error'));
      });

      // Слушаем различные события
      _setupEventListeners();

      await _socket!.connect();
    } catch (e) {
      throw MagentoException('Failed to connect to socket: $e');
    }
  }

  /// Настройка слушателей событий
  void _setupEventListeners() {
    // Обновления заказов
    _socket!.on('order_updated', (data) {
      _eventController.add({
        'type': 'order_updated',
        'data': data,
        'timestamp': DateTime.now().toIso8601String(),
      });
    });

    // Обновления корзины
    _socket!.on('cart_updated', (data) {
      _eventController.add({
        'type': 'cart_updated',
        'data': data,
        'timestamp': DateTime.now().toIso8601String(),
      });
    });

    // Обновления продуктов
    _socket!.on('product_updated', (data) {
      _eventController.add({
        'type': 'product_updated',
        'data': data,
        'timestamp': DateTime.now().toIso8601String(),
      });
    });

    // Обновления инвентаря
    _socket!.on('inventory_updated', (data) {
      _eventController.add({
        'type': 'inventory_updated',
        'data': data,
        'timestamp': DateTime.now().toIso8601String(),
      });
    });

    // Уведомления
    _socket!.on('notification', (data) {
      _eventController.add({
        'type': 'notification',
        'data': data,
        'timestamp': DateTime.now().toIso8601String(),
      });
    });

    // Системные события
    _socket!.on('system_event', (data) {
      _eventController.add({
        'type': 'system_event',
        'data': data,
        'timestamp': DateTime.now().toIso8601String(),
      });
    });
  }

  /// Отключение от сервера
  void disconnect() {
    _socket?.disconnect();
    _socket = null;
  }

  /// Отправка события
  void emit(String event, dynamic data) {
    _socket?.emit(event, data);
  }

  /// Подписка на событие
  void on(String event, Function(dynamic) callback) {
    _socket?.on(event, callback);
  }

  /// Отписка от события
  void off(String event) {
    _socket?.off(event);
  }

  /// Проверка подключения
  bool get isConnected => _socket?.connected ?? false;

  /// Подписка на обновления заказа
  void subscribeToOrder(String orderId) {
    emit('subscribe_order', {'order_id': orderId});
  }

  /// Отписка от обновлений заказа
  void unsubscribeFromOrder(String orderId) {
    emit('unsubscribe_order', {'order_id': orderId});
  }

  /// Подписка на обновления корзины
  void subscribeToCart(String cartId) {
    emit('subscribe_cart', {'cart_id': cartId});
  }

  /// Отписка от обновлений корзины
  void unsubscribeFromCart(String cartId) {
    emit('unsubscribe_cart', {'cart_id': cartId});
  }

  /// Подписка на обновления продукта
  void subscribeToProduct(String productId) {
    emit('subscribe_product', {'product_id': productId});
  }

  /// Отписка от обновлений продукта
  void unsubscribeFromProduct(String productId) {
    emit('unsubscribe_product', {'product_id': productId});
  }

  /// Отправка пользовательского события
  void sendCustomEvent(String eventType, Map<String, dynamic> data) {
    emit('custom_event', {
      'type': eventType,
      'data': data,
      'timestamp': DateTime.now().toIso8601String(),
    });
  }

  /// Закрытие менеджера
  void dispose() {
    disconnect();
    _eventController.close();
  }
}
