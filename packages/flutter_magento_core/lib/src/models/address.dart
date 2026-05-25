/// Base address model.
class Address {
  /// First name.
  final String firstName;

  /// Last name.
  final String lastName;

  /// Street address lines.
  final List<String> street;

  /// City.
  final String city;

  /// Region/state code.
  final String? regionCode;

  /// Region/state ID.
  final int? regionId;

  /// Region/state name.
  final String? regionName;

  /// Postal/ZIP code.
  final String postcode;

  /// Country code (ISO 2-letter).
  final String countryCode;

  /// Phone number.
  final String? telephone;

  /// Company name.
  final String? company;

  const Address({
    required this.firstName,
    required this.lastName,
    required this.street,
    required this.city,
    this.regionCode,
    this.regionId,
    this.regionName,
    required this.postcode,
    required this.countryCode,
    this.telephone,
    this.company,
  });

  /// Full name.
  String get fullName => '$firstName $lastName';

  /// Formatted address string.
  String get formatted {
    final parts = <String>[];
    if (company != null) parts.add(company!);
    parts.add(fullName);
    parts.addAll(street);
    parts.add('$city, ${regionName ?? regionCode ?? ''} $postcode');
    parts.add(countryCode);
    return parts.join('\n');
  }
}

/// Shipping address with additional fields.
class ShippingAddress extends Address {
  /// Save to address book.
  final bool saveInAddressBook;

  const ShippingAddress({
    required super.firstName,
    required super.lastName,
    required super.street,
    required super.city,
    super.regionCode,
    super.regionId,
    super.regionName,
    required super.postcode,
    required super.countryCode,
    super.telephone,
    super.company,
    this.saveInAddressBook = false,
  });
}

/// Billing address with additional fields.
class BillingAddress extends Address {
  /// Save to address book.
  final bool saveInAddressBook;

  /// Use shipping address as billing.
  final bool sameAsShipping;

  const BillingAddress({
    required super.firstName,
    required super.lastName,
    required super.street,
    required super.city,
    super.regionCode,
    super.regionId,
    super.regionName,
    required super.postcode,
    required super.countryCode,
    super.telephone,
    super.company,
    this.saveInAddressBook = false,
    this.sameAsShipping = false,
  });
}

/// Customer address from address book.
class CustomerAddress extends Address {
  /// Address ID.
  final String id;

  /// Whether this is the default shipping address.
  final bool isDefaultShipping;

  /// Whether this is the default billing address.
  final bool isDefaultBilling;

  const CustomerAddress({
    required this.id,
    required super.firstName,
    required super.lastName,
    required super.street,
    required super.city,
    super.regionCode,
    super.regionId,
    super.regionName,
    required super.postcode,
    required super.countryCode,
    super.telephone,
    super.company,
    this.isDefaultShipping = false,
    this.isDefaultBilling = false,
  });
}
