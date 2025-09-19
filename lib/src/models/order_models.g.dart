// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderListResponse _$OrderListResponseFromJson(Map<String, dynamic> json) =>
    OrderListResponse(
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => Order.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalCount: (json['totalCount'] as num?)?.toInt(),
      currentPage: (json['currentPage'] as num?)?.toInt(),
      pageSize: (json['pageSize'] as num?)?.toInt(),
    );

Map<String, dynamic> _$OrderListResponseToJson(OrderListResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('totalCount', instance.totalCount);
  writeNotNull('currentPage', instance.currentPage);
  writeNotNull('pageSize', instance.pageSize);
  return val;
}

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['id'] as String?,
      incrementId: json['incrementId'] as String?,
      status: json['status'] as String?,
      state: json['state'] as String?,
      customerId: (json['customerId'] as num?)?.toInt(),
      customerEmail: json['customerEmail'] as String?,
      customerFirstName: json['customerFirstName'] as String?,
      customerLastName: json['customerLastName'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => OrderItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      totals: json['totals'] == null
          ? null
          : OrderTotals.fromJson(json['totals'] as Map<String, dynamic>),
      currencyCode: json['currencyCode'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$OrderToJson(Order instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('incrementId', instance.incrementId);
  writeNotNull('status', instance.status);
  writeNotNull('state', instance.state);
  writeNotNull('customerId', instance.customerId);
  writeNotNull('customerEmail', instance.customerEmail);
  writeNotNull('customerFirstName', instance.customerFirstName);
  writeNotNull('customerLastName', instance.customerLastName);
  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('totals', instance.totals?.toJson());
  writeNotNull('currencyCode', instance.currencyCode);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('updatedAt', instance.updatedAt?.toIso8601String());
  return val;
}

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
      itemId: (json['itemId'] as num?)?.toInt(),
      sku: json['sku'] as String?,
      name: json['name'] as String?,
      qty: (json['qty'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toDouble(),
      rowTotal: (json['rowTotal'] as num?)?.toDouble(),
      productType: json['productType'] as String?,
    );

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('itemId', instance.itemId);
  writeNotNull('sku', instance.sku);
  writeNotNull('name', instance.name);
  writeNotNull('qty', instance.qty);
  writeNotNull('price', instance.price);
  writeNotNull('rowTotal', instance.rowTotal);
  writeNotNull('productType', instance.productType);
  return val;
}

OrderTotals _$OrderTotalsFromJson(Map<String, dynamic> json) => OrderTotals(
      grandTotal: (json['grandTotal'] as num?)?.toDouble(),
      subtotal: (json['subtotal'] as num?)?.toDouble(),
      taxAmount: (json['taxAmount'] as num?)?.toDouble(),
      shippingAmount: (json['shippingAmount'] as num?)?.toDouble(),
      discountAmount: (json['discountAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$OrderTotalsToJson(OrderTotals instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('grandTotal', instance.grandTotal);
  writeNotNull('subtotal', instance.subtotal);
  writeNotNull('taxAmount', instance.taxAmount);
  writeNotNull('shippingAmount', instance.shippingAmount);
  writeNotNull('discountAmount', instance.discountAmount);
  return val;
}

OrderComment _$OrderCommentFromJson(Map<String, dynamic> json) => OrderComment(
      id: json['id'] as String?,
      comment: json['comment'] as String?,
      isVisibleOnFront: json['isVisibleOnFront'] as bool?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$OrderCommentToJson(OrderComment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('comment', instance.comment);
  writeNotNull('isVisibleOnFront', instance.isVisibleOnFront);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  return val;
}

OrderHistory _$OrderHistoryFromJson(Map<String, dynamic> json) => OrderHistory(
      id: json['id'] as String?,
      status: json['status'] as String?,
      comment: json['comment'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$OrderHistoryToJson(OrderHistory instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('status', instance.status);
  writeNotNull('comment', instance.comment);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  return val;
}

Invoice _$InvoiceFromJson(Map<String, dynamic> json) => Invoice(
      id: json['id'] as String?,
      incrementId: json['incrementId'] as String?,
      orderId: json['orderId'] as String?,
      status: json['status'] as String?,
      grandTotal: (json['grandTotal'] as num?)?.toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$InvoiceToJson(Invoice instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('incrementId', instance.incrementId);
  writeNotNull('orderId', instance.orderId);
  writeNotNull('status', instance.status);
  writeNotNull('grandTotal', instance.grandTotal);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  return val;
}

Shipment _$ShipmentFromJson(Map<String, dynamic> json) => Shipment(
      id: json['id'] as String?,
      incrementId: json['incrementId'] as String?,
      orderId: json['orderId'] as String?,
      status: json['status'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ShipmentItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      tracks: (json['tracks'] as List<dynamic>?)
          ?.map((e) => ShipmentTracking.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ShipmentToJson(Shipment instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('incrementId', instance.incrementId);
  writeNotNull('orderId', instance.orderId);
  writeNotNull('status', instance.status);
  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('tracks', instance.tracks?.map((e) => e.toJson()).toList());
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  return val;
}

ShipmentItem _$ShipmentItemFromJson(Map<String, dynamic> json) => ShipmentItem(
      itemId: (json['itemId'] as num?)?.toInt(),
      sku: json['sku'] as String?,
      name: json['name'] as String?,
      qty: (json['qty'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ShipmentItemToJson(ShipmentItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('itemId', instance.itemId);
  writeNotNull('sku', instance.sku);
  writeNotNull('name', instance.name);
  writeNotNull('qty', instance.qty);
  return val;
}

ShipmentTracking _$ShipmentTrackingFromJson(Map<String, dynamic> json) =>
    ShipmentTracking(
      id: json['id'] as String?,
      trackNumber: json['trackNumber'] as String?,
      title: json['title'] as String?,
      carrierCode: json['carrierCode'] as String?,
    );

Map<String, dynamic> _$ShipmentTrackingToJson(ShipmentTracking instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('trackNumber', instance.trackNumber);
  writeNotNull('title', instance.title);
  writeNotNull('carrierCode', instance.carrierCode);
  return val;
}

CreditMemo _$CreditMemoFromJson(Map<String, dynamic> json) => CreditMemo(
      id: json['id'] as String?,
      incrementId: json['incrementId'] as String?,
      orderId: json['orderId'] as String?,
      status: json['status'] as String?,
      grandTotal: (json['grandTotal'] as num?)?.toDouble(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$CreditMemoToJson(CreditMemo instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('incrementId', instance.incrementId);
  writeNotNull('orderId', instance.orderId);
  writeNotNull('status', instance.status);
  writeNotNull('grandTotal', instance.grandTotal);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  return val;
}

Return _$ReturnFromJson(Map<String, dynamic> json) => Return(
      id: json['id'] as String?,
      orderId: json['orderId'] as String?,
      status: json['status'] as String?,
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => ReturnItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      comment: json['comment'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$ReturnToJson(Return instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  writeNotNull('orderId', instance.orderId);
  writeNotNull('status', instance.status);
  writeNotNull('items', instance.items?.map((e) => e.toJson()).toList());
  writeNotNull('comment', instance.comment);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  return val;
}

ReturnItem _$ReturnItemFromJson(Map<String, dynamic> json) => ReturnItem(
      itemId: (json['itemId'] as num?)?.toInt(),
      sku: json['sku'] as String?,
      name: json['name'] as String?,
      qty: (json['qty'] as num?)?.toInt(),
      reason: json['reason'] as String?,
    );

Map<String, dynamic> _$ReturnItemToJson(ReturnItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('itemId', instance.itemId);
  writeNotNull('sku', instance.sku);
  writeNotNull('name', instance.name);
  writeNotNull('qty', instance.qty);
  writeNotNull('reason', instance.reason);
  return val;
}
