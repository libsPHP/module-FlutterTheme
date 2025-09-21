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

Map<String, dynamic> _$OrderListResponseToJson(OrderListResponse instance) =>
    <String, dynamic>{
      'items': ?instance.items?.map((e) => e.toJson()).toList(),
      'totalCount': ?instance.totalCount,
      'currentPage': ?instance.currentPage,
      'pageSize': ?instance.pageSize,
    };

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

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
  'id': ?instance.id,
  'incrementId': ?instance.incrementId,
  'status': ?instance.status,
  'state': ?instance.state,
  'customerId': ?instance.customerId,
  'customerEmail': ?instance.customerEmail,
  'customerFirstName': ?instance.customerFirstName,
  'customerLastName': ?instance.customerLastName,
  'items': ?instance.items?.map((e) => e.toJson()).toList(),
  'totals': ?instance.totals?.toJson(),
  'currencyCode': ?instance.currencyCode,
  'createdAt': ?instance.createdAt?.toIso8601String(),
  'updatedAt': ?instance.updatedAt?.toIso8601String(),
};

OrderItem _$OrderItemFromJson(Map<String, dynamic> json) => OrderItem(
  itemId: (json['itemId'] as num?)?.toInt(),
  sku: json['sku'] as String?,
  name: json['name'] as String?,
  qty: (json['qty'] as num?)?.toInt(),
  price: (json['price'] as num?)?.toDouble(),
  rowTotal: (json['rowTotal'] as num?)?.toDouble(),
  productType: json['productType'] as String?,
);

Map<String, dynamic> _$OrderItemToJson(OrderItem instance) => <String, dynamic>{
  'itemId': ?instance.itemId,
  'sku': ?instance.sku,
  'name': ?instance.name,
  'qty': ?instance.qty,
  'price': ?instance.price,
  'rowTotal': ?instance.rowTotal,
  'productType': ?instance.productType,
};

OrderTotals _$OrderTotalsFromJson(Map<String, dynamic> json) => OrderTotals(
  grandTotal: (json['grandTotal'] as num?)?.toDouble(),
  subtotal: (json['subtotal'] as num?)?.toDouble(),
  taxAmount: (json['taxAmount'] as num?)?.toDouble(),
  shippingAmount: (json['shippingAmount'] as num?)?.toDouble(),
  discountAmount: (json['discountAmount'] as num?)?.toDouble(),
);

Map<String, dynamic> _$OrderTotalsToJson(OrderTotals instance) =>
    <String, dynamic>{
      'grandTotal': ?instance.grandTotal,
      'subtotal': ?instance.subtotal,
      'taxAmount': ?instance.taxAmount,
      'shippingAmount': ?instance.shippingAmount,
      'discountAmount': ?instance.discountAmount,
    };

OrderComment _$OrderCommentFromJson(Map<String, dynamic> json) => OrderComment(
  id: json['id'] as String?,
  comment: json['comment'] as String?,
  isVisibleOnFront: json['isVisibleOnFront'] as bool?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$OrderCommentToJson(OrderComment instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'comment': ?instance.comment,
      'isVisibleOnFront': ?instance.isVisibleOnFront,
      'createdAt': ?instance.createdAt?.toIso8601String(),
    };

OrderHistory _$OrderHistoryFromJson(Map<String, dynamic> json) => OrderHistory(
  id: json['id'] as String?,
  status: json['status'] as String?,
  comment: json['comment'] as String?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$OrderHistoryToJson(OrderHistory instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'status': ?instance.status,
      'comment': ?instance.comment,
      'createdAt': ?instance.createdAt?.toIso8601String(),
    };

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

Map<String, dynamic> _$InvoiceToJson(Invoice instance) => <String, dynamic>{
  'id': ?instance.id,
  'incrementId': ?instance.incrementId,
  'orderId': ?instance.orderId,
  'status': ?instance.status,
  'grandTotal': ?instance.grandTotal,
  'createdAt': ?instance.createdAt?.toIso8601String(),
};

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

Map<String, dynamic> _$ShipmentToJson(Shipment instance) => <String, dynamic>{
  'id': ?instance.id,
  'incrementId': ?instance.incrementId,
  'orderId': ?instance.orderId,
  'status': ?instance.status,
  'items': ?instance.items?.map((e) => e.toJson()).toList(),
  'tracks': ?instance.tracks?.map((e) => e.toJson()).toList(),
  'createdAt': ?instance.createdAt?.toIso8601String(),
};

ShipmentItem _$ShipmentItemFromJson(Map<String, dynamic> json) => ShipmentItem(
  itemId: (json['itemId'] as num?)?.toInt(),
  sku: json['sku'] as String?,
  name: json['name'] as String?,
  qty: (json['qty'] as num?)?.toInt(),
);

Map<String, dynamic> _$ShipmentItemToJson(ShipmentItem instance) =>
    <String, dynamic>{
      'itemId': ?instance.itemId,
      'sku': ?instance.sku,
      'name': ?instance.name,
      'qty': ?instance.qty,
    };

ShipmentTracking _$ShipmentTrackingFromJson(Map<String, dynamic> json) =>
    ShipmentTracking(
      id: json['id'] as String?,
      trackNumber: json['trackNumber'] as String?,
      title: json['title'] as String?,
      carrierCode: json['carrierCode'] as String?,
    );

Map<String, dynamic> _$ShipmentTrackingToJson(ShipmentTracking instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'trackNumber': ?instance.trackNumber,
      'title': ?instance.title,
      'carrierCode': ?instance.carrierCode,
    };

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

Map<String, dynamic> _$CreditMemoToJson(CreditMemo instance) =>
    <String, dynamic>{
      'id': ?instance.id,
      'incrementId': ?instance.incrementId,
      'orderId': ?instance.orderId,
      'status': ?instance.status,
      'grandTotal': ?instance.grandTotal,
      'createdAt': ?instance.createdAt?.toIso8601String(),
    };

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

Map<String, dynamic> _$ReturnToJson(Return instance) => <String, dynamic>{
  'id': ?instance.id,
  'orderId': ?instance.orderId,
  'status': ?instance.status,
  'items': ?instance.items?.map((e) => e.toJson()).toList(),
  'comment': ?instance.comment,
  'createdAt': ?instance.createdAt?.toIso8601String(),
};

ReturnItem _$ReturnItemFromJson(Map<String, dynamic> json) => ReturnItem(
  itemId: (json['itemId'] as num?)?.toInt(),
  sku: json['sku'] as String?,
  name: json['name'] as String?,
  qty: (json['qty'] as num?)?.toInt(),
  reason: json['reason'] as String?,
);

Map<String, dynamic> _$ReturnItemToJson(ReturnItem instance) =>
    <String, dynamic>{
      'itemId': ?instance.itemId,
      'sku': ?instance.sku,
      'name': ?instance.name,
      'qty': ?instance.qty,
      'reason': ?instance.reason,
    };
