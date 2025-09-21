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
      if (instance.items?.map((e) => e.toJson()).toList() case final value?)
        'items': value,
      if (instance.totalCount case final value?) 'totalCount': value,
      if (instance.currentPage case final value?) 'currentPage': value,
      if (instance.pageSize case final value?) 'pageSize': value,
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
  if (instance.id case final value?) 'id': value,
  if (instance.incrementId case final value?) 'incrementId': value,
  if (instance.status case final value?) 'status': value,
  if (instance.state case final value?) 'state': value,
  if (instance.customerId case final value?) 'customerId': value,
  if (instance.customerEmail case final value?) 'customerEmail': value,
  if (instance.customerFirstName case final value?) 'customerFirstName': value,
  if (instance.customerLastName case final value?) 'customerLastName': value,
  if (instance.items?.map((e) => e.toJson()).toList() case final value?)
    'items': value,
  if (instance.totals?.toJson() case final value?) 'totals': value,
  if (instance.currencyCode case final value?) 'currencyCode': value,
  if (instance.createdAt?.toIso8601String() case final value?)
    'createdAt': value,
  if (instance.updatedAt?.toIso8601String() case final value?)
    'updatedAt': value,
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
  if (instance.itemId case final value?) 'itemId': value,
  if (instance.sku case final value?) 'sku': value,
  if (instance.name case final value?) 'name': value,
  if (instance.qty case final value?) 'qty': value,
  if (instance.price case final value?) 'price': value,
  if (instance.rowTotal case final value?) 'rowTotal': value,
  if (instance.productType case final value?) 'productType': value,
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
      if (instance.grandTotal case final value?) 'grandTotal': value,
      if (instance.subtotal case final value?) 'subtotal': value,
      if (instance.taxAmount case final value?) 'taxAmount': value,
      if (instance.shippingAmount case final value?) 'shippingAmount': value,
      if (instance.discountAmount case final value?) 'discountAmount': value,
    };

OrderComment _$OrderCommentFromJson(Map<String, dynamic> json) => OrderComment(
  id: json['id'] as String?,
  comment: json['comment'] as String?,
  isVisibleOnFront: json['isVisibleOnFront'] as bool?,
  createdAt: json['createdAt'] == null
      ? null
      : DateTime.parse(json['createdAt'] as String),
);

Map<String, dynamic> _$OrderCommentToJson(
  OrderComment instance,
) => <String, dynamic>{
  if (instance.id case final value?) 'id': value,
  if (instance.comment case final value?) 'comment': value,
  if (instance.isVisibleOnFront case final value?) 'isVisibleOnFront': value,
  if (instance.createdAt?.toIso8601String() case final value?)
    'createdAt': value,
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
      if (instance.id case final value?) 'id': value,
      if (instance.status case final value?) 'status': value,
      if (instance.comment case final value?) 'comment': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'createdAt': value,
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
  if (instance.id case final value?) 'id': value,
  if (instance.incrementId case final value?) 'incrementId': value,
  if (instance.orderId case final value?) 'orderId': value,
  if (instance.status case final value?) 'status': value,
  if (instance.grandTotal case final value?) 'grandTotal': value,
  if (instance.createdAt?.toIso8601String() case final value?)
    'createdAt': value,
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
  if (instance.id case final value?) 'id': value,
  if (instance.incrementId case final value?) 'incrementId': value,
  if (instance.orderId case final value?) 'orderId': value,
  if (instance.status case final value?) 'status': value,
  if (instance.items?.map((e) => e.toJson()).toList() case final value?)
    'items': value,
  if (instance.tracks?.map((e) => e.toJson()).toList() case final value?)
    'tracks': value,
  if (instance.createdAt?.toIso8601String() case final value?)
    'createdAt': value,
};

ShipmentItem _$ShipmentItemFromJson(Map<String, dynamic> json) => ShipmentItem(
  itemId: (json['itemId'] as num?)?.toInt(),
  sku: json['sku'] as String?,
  name: json['name'] as String?,
  qty: (json['qty'] as num?)?.toInt(),
);

Map<String, dynamic> _$ShipmentItemToJson(ShipmentItem instance) =>
    <String, dynamic>{
      if (instance.itemId case final value?) 'itemId': value,
      if (instance.sku case final value?) 'sku': value,
      if (instance.name case final value?) 'name': value,
      if (instance.qty case final value?) 'qty': value,
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
      if (instance.id case final value?) 'id': value,
      if (instance.trackNumber case final value?) 'trackNumber': value,
      if (instance.title case final value?) 'title': value,
      if (instance.carrierCode case final value?) 'carrierCode': value,
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
      if (instance.id case final value?) 'id': value,
      if (instance.incrementId case final value?) 'incrementId': value,
      if (instance.orderId case final value?) 'orderId': value,
      if (instance.status case final value?) 'status': value,
      if (instance.grandTotal case final value?) 'grandTotal': value,
      if (instance.createdAt?.toIso8601String() case final value?)
        'createdAt': value,
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
  if (instance.id case final value?) 'id': value,
  if (instance.orderId case final value?) 'orderId': value,
  if (instance.status case final value?) 'status': value,
  if (instance.items?.map((e) => e.toJson()).toList() case final value?)
    'items': value,
  if (instance.comment case final value?) 'comment': value,
  if (instance.createdAt?.toIso8601String() case final value?)
    'createdAt': value,
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
      if (instance.itemId case final value?) 'itemId': value,
      if (instance.sku case final value?) 'sku': value,
      if (instance.name case final value?) 'name': value,
      if (instance.qty case final value?) 'qty': value,
      if (instance.reason case final value?) 'reason': value,
    };
