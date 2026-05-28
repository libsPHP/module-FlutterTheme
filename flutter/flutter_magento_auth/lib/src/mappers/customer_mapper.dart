import 'package:flutter_magento_core/flutter_magento_core.dart';

class CustomerMapper {
  Customer mapCustomer(Map<String, dynamic> json) {
    return Customer(
      id: int.tryParse(json['id']?.toString() ?? '') ?? 0,
      email: json['email'] as String? ?? '',
      firstName: json['firstname'] as String? ?? '',
      lastName: json['lastname'] as String? ?? '',
      dateOfBirth: _parseDate(json['date_of_birth'] as String?),
      gender: json['gender'] as int?,
      taxVat: json['taxvat'] as String?,
      groupId: json['group_id'] as int? ?? 1,
      storeId: json['store_id'] as int? ?? 1,
      websiteId: json['website_id'] as int? ?? 1,
      createdAt: _parseDateTime(json['created_at'] as String?) ?? DateTime.now(),
      defaultShippingAddressId: _parseAddressId(json['default_shipping']),
      defaultBillingAddressId: _parseAddressId(json['default_billing']),
    );
  }

  CustomerSession mapSession(String token, Customer customer) {
    return CustomerSession(
      token: token,
      customer: customer,
    );
  }

  DateTime? _parseDate(String? dateStr) {
    if (dateStr == null || dateStr.isEmpty) return null;
    try {
      return DateTime.parse(dateStr);
    } catch (_) {
      return null;
    }
  }

  DateTime? _parseDateTime(String? dateTimeStr) {
    if (dateTimeStr == null || dateTimeStr.isEmpty) return null;
    try {
      return DateTime.parse(dateTimeStr);
    } catch (_) {
      return null;
    }
  }

  int? _parseAddressId(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    if (value is String) return int.tryParse(value);
    return null;
  }
}
