/// Represents a cart operation that can be queued for offline execution.
sealed class CartOperation {
  /// Unique identifier for this operation.
  final String id;

  /// When this operation was created.
  final DateTime createdAt;

  /// Current status of the operation.
  final OperationStatus status;

  /// Error message if the operation failed.
  final String? errorMessage;

  const CartOperation({
    required this.id,
    required this.createdAt,
    this.status = OperationStatus.pending,
    this.errorMessage,
  });

  /// Creates an add simple product operation.
  factory CartOperation.addSimple({
    required String sku,
    required int quantity,
    String? id,
  }) {
    return AddSimpleProductOperation(
      id: id ?? _generateId(),
      createdAt: DateTime.now(),
      sku: sku,
      quantity: quantity,
    );
  }

  /// Creates an add configurable product operation.
  factory CartOperation.addConfigurable({
    required String parentSku,
    required String variantSku,
    required int quantity,
    Map<String, String>? selectedOptions,
    String? id,
  }) {
    return AddConfigurableProductOperation(
      id: id ?? _generateId(),
      createdAt: DateTime.now(),
      parentSku: parentSku,
      variantSku: variantSku,
      quantity: quantity,
      selectedOptions: selectedOptions,
    );
  }

  /// Creates an update quantity operation.
  factory CartOperation.updateQuantity({
    required String itemId,
    required int quantity,
    String? id,
  }) {
    return UpdateQuantityOperation(
      id: id ?? _generateId(),
      createdAt: DateTime.now(),
      itemId: itemId,
      quantity: quantity,
    );
  }

  /// Creates a remove item operation.
  factory CartOperation.removeItem({
    required String itemId,
    String? id,
  }) {
    return RemoveItemOperation(
      id: id ?? _generateId(),
      createdAt: DateTime.now(),
      itemId: itemId,
    );
  }

  /// Creates an apply coupon operation.
  factory CartOperation.applyCoupon({
    required String code,
    String? id,
  }) {
    return ApplyCouponOperation(
      id: id ?? _generateId(),
      createdAt: DateTime.now(),
      code: code,
    );
  }

  /// Creates a remove coupon operation.
  factory CartOperation.removeCoupon({String? id}) {
    return RemoveCouponOperation(
      id: id ?? _generateId(),
      createdAt: DateTime.now(),
    );
  }

  /// Converts to JSON for storage.
  Map<String, dynamic> toJson();

  /// Creates from JSON.
  static CartOperation fromJson(Map<String, dynamic> json) {
    final type = json['type'] as String;
    return switch (type) {
      'addSimple' => AddSimpleProductOperation._fromJson(json),
      'addConfigurable' => AddConfigurableProductOperation._fromJson(json),
      'updateQuantity' => UpdateQuantityOperation._fromJson(json),
      'removeItem' => RemoveItemOperation._fromJson(json),
      'applyCoupon' => ApplyCouponOperation._fromJson(json),
      'removeCoupon' => RemoveCouponOperation._fromJson(json),
      _ => throw ArgumentError('Unknown operation type: $type'),
    };
  }

  /// Creates a copy with updated status.
  CartOperation copyWith({
    OperationStatus? status,
    String? errorMessage,
  });

  static String _generateId() =>
      DateTime.now().microsecondsSinceEpoch.toString();
}

/// Add simple product to cart operation.
final class AddSimpleProductOperation extends CartOperation {
  final String sku;
  final int quantity;

  const AddSimpleProductOperation({
    required super.id,
    required super.createdAt,
    super.status,
    super.errorMessage,
    required this.sku,
    required this.quantity,
  });

  @override
  Map<String, dynamic> toJson() => {
        'type': 'addSimple',
        'id': id,
        'createdAt': createdAt.toIso8601String(),
        'status': status.name,
        'errorMessage': errorMessage,
        'sku': sku,
        'quantity': quantity,
      };

  static AddSimpleProductOperation _fromJson(Map<String, dynamic> json) {
    return AddSimpleProductOperation(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: OperationStatus.values.byName(json['status'] as String),
      errorMessage: json['errorMessage'] as String?,
      sku: json['sku'] as String,
      quantity: json['quantity'] as int,
    );
  }

  @override
  AddSimpleProductOperation copyWith({
    OperationStatus? status,
    String? errorMessage,
  }) {
    return AddSimpleProductOperation(
      id: id,
      createdAt: createdAt,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      sku: sku,
      quantity: quantity,
    );
  }
}

/// Add configurable product to cart operation.
final class AddConfigurableProductOperation extends CartOperation {
  final String parentSku;
  final String variantSku;
  final int quantity;
  final Map<String, String>? selectedOptions;

  const AddConfigurableProductOperation({
    required super.id,
    required super.createdAt,
    super.status,
    super.errorMessage,
    required this.parentSku,
    required this.variantSku,
    required this.quantity,
    this.selectedOptions,
  });

  @override
  Map<String, dynamic> toJson() => {
        'type': 'addConfigurable',
        'id': id,
        'createdAt': createdAt.toIso8601String(),
        'status': status.name,
        'errorMessage': errorMessage,
        'parentSku': parentSku,
        'variantSku': variantSku,
        'quantity': quantity,
        'selectedOptions': selectedOptions,
      };

  static AddConfigurableProductOperation _fromJson(Map<String, dynamic> json) {
    return AddConfigurableProductOperation(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: OperationStatus.values.byName(json['status'] as String),
      errorMessage: json['errorMessage'] as String?,
      parentSku: json['parentSku'] as String,
      variantSku: json['variantSku'] as String,
      quantity: json['quantity'] as int,
      selectedOptions: json['selectedOptions'] != null
          ? Map<String, String>.from(json['selectedOptions'] as Map)
          : null,
    );
  }

  @override
  AddConfigurableProductOperation copyWith({
    OperationStatus? status,
    String? errorMessage,
  }) {
    return AddConfigurableProductOperation(
      id: id,
      createdAt: createdAt,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      parentSku: parentSku,
      variantSku: variantSku,
      quantity: quantity,
      selectedOptions: selectedOptions,
    );
  }
}

/// Update cart item quantity operation.
final class UpdateQuantityOperation extends CartOperation {
  final String itemId;
  final int quantity;

  const UpdateQuantityOperation({
    required super.id,
    required super.createdAt,
    super.status,
    super.errorMessage,
    required this.itemId,
    required this.quantity,
  });

  @override
  Map<String, dynamic> toJson() => {
        'type': 'updateQuantity',
        'id': id,
        'createdAt': createdAt.toIso8601String(),
        'status': status.name,
        'errorMessage': errorMessage,
        'itemId': itemId,
        'quantity': quantity,
      };

  static UpdateQuantityOperation _fromJson(Map<String, dynamic> json) {
    return UpdateQuantityOperation(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: OperationStatus.values.byName(json['status'] as String),
      errorMessage: json['errorMessage'] as String?,
      itemId: json['itemId'] as String,
      quantity: json['quantity'] as int,
    );
  }

  @override
  UpdateQuantityOperation copyWith({
    OperationStatus? status,
    String? errorMessage,
  }) {
    return UpdateQuantityOperation(
      id: id,
      createdAt: createdAt,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      itemId: itemId,
      quantity: quantity,
    );
  }
}

/// Remove cart item operation.
final class RemoveItemOperation extends CartOperation {
  final String itemId;

  const RemoveItemOperation({
    required super.id,
    required super.createdAt,
    super.status,
    super.errorMessage,
    required this.itemId,
  });

  @override
  Map<String, dynamic> toJson() => {
        'type': 'removeItem',
        'id': id,
        'createdAt': createdAt.toIso8601String(),
        'status': status.name,
        'errorMessage': errorMessage,
        'itemId': itemId,
      };

  static RemoveItemOperation _fromJson(Map<String, dynamic> json) {
    return RemoveItemOperation(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: OperationStatus.values.byName(json['status'] as String),
      errorMessage: json['errorMessage'] as String?,
      itemId: json['itemId'] as String,
    );
  }

  @override
  RemoveItemOperation copyWith({
    OperationStatus? status,
    String? errorMessage,
  }) {
    return RemoveItemOperation(
      id: id,
      createdAt: createdAt,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      itemId: itemId,
    );
  }
}

/// Apply coupon operation.
final class ApplyCouponOperation extends CartOperation {
  final String code;

  const ApplyCouponOperation({
    required super.id,
    required super.createdAt,
    super.status,
    super.errorMessage,
    required this.code,
  });

  @override
  Map<String, dynamic> toJson() => {
        'type': 'applyCoupon',
        'id': id,
        'createdAt': createdAt.toIso8601String(),
        'status': status.name,
        'errorMessage': errorMessage,
        'code': code,
      };

  static ApplyCouponOperation _fromJson(Map<String, dynamic> json) {
    return ApplyCouponOperation(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: OperationStatus.values.byName(json['status'] as String),
      errorMessage: json['errorMessage'] as String?,
      code: json['code'] as String,
    );
  }

  @override
  ApplyCouponOperation copyWith({
    OperationStatus? status,
    String? errorMessage,
  }) {
    return ApplyCouponOperation(
      id: id,
      createdAt: createdAt,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      code: code,
    );
  }
}

/// Remove coupon operation.
final class RemoveCouponOperation extends CartOperation {
  const RemoveCouponOperation({
    required super.id,
    required super.createdAt,
    super.status,
    super.errorMessage,
  });

  @override
  Map<String, dynamic> toJson() => {
        'type': 'removeCoupon',
        'id': id,
        'createdAt': createdAt.toIso8601String(),
        'status': status.name,
        'errorMessage': errorMessage,
      };

  static RemoveCouponOperation _fromJson(Map<String, dynamic> json) {
    return RemoveCouponOperation(
      id: json['id'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: OperationStatus.values.byName(json['status'] as String),
      errorMessage: json['errorMessage'] as String?,
    );
  }

  @override
  RemoveCouponOperation copyWith({
    OperationStatus? status,
    String? errorMessage,
  }) {
    return RemoveCouponOperation(
      id: id,
      createdAt: createdAt,
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

/// Status of an operation in the queue.
enum OperationStatus {
  /// Operation is waiting to be executed.
  pending,

  /// Operation is currently being executed.
  inProgress,

  /// Operation completed successfully.
  completed,

  /// Operation failed.
  failed,
}
