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

  CustomerAddress mapAddress(Map<String, dynamic> json) {
    final regionJson = json['region'] as Map<String, dynamic>?;
    final streetList = json['street'] as List<dynamic>?;

    return CustomerAddress(
      id: json['id']?.toString() ?? '',
      firstName: json['firstname'] as String? ?? '',
      lastName: json['lastname'] as String? ?? '',
      street: streetList?.map((s) => s.toString()).toList() ?? [],
      city: json['city'] as String? ?? '',
      regionCode: regionJson?['region_code'] as String?,
      regionId: regionJson?['region_id'] as int?,
      regionName: regionJson?['region'] as String?,
      postcode: json['postcode'] as String? ?? '',
      countryCode: json['country_code'] as String? ?? '',
      telephone: json['telephone'] as String?,
      company: json['company'] as String?,
      isDefaultShipping: json['default_shipping'] as bool? ?? false,
      isDefaultBilling: json['default_billing'] as bool? ?? false,
    );
  }

  List<CustomerAddress> mapAddresses(List<dynamic> addresses) {
    return addresses
        .map((addr) => mapAddress(addr as Map<String, dynamic>))
        .toList();
  }

  Map<String, dynamic> addressToInput(CustomerAddress address) {
    final input = <String, dynamic>{
      'firstname': address.firstName,
      'lastname': address.lastName,
      'street': address.street,
      'city': address.city,
      'postcode': address.postcode,
      'country_code': address.countryCode,
      'default_shipping': address.isDefaultShipping,
      'default_billing': address.isDefaultBilling,
    };

    if (address.telephone != null) {
      input['telephone'] = address.telephone;
    }

    if (address.company != null) {
      input['company'] = address.company;
    }

    if (address.regionId != null || address.regionCode != null) {
      input['region'] = <String, dynamic>{};
      if (address.regionId != null) {
        (input['region'] as Map<String, dynamic>)['region_id'] = address.regionId;
      }
      if (address.regionCode != null) {
        (input['region'] as Map<String, dynamic>)['region_code'] = address.regionCode;
      }
    }

    return input;
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
