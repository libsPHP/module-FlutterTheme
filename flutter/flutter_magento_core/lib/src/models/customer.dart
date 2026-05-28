import 'magento_entity.dart';

/// Represents a Magento customer.
class Customer extends MagentoEntity {
  /// Customer ID.
  final int id;

  /// Customer email address.
  final String email;

  /// Customer first name.
  final String firstName;

  /// Customer last name.
  final String lastName;

  /// Date of birth (optional).
  final DateTime? dateOfBirth;

  /// Gender (optional, typically 1=Male, 2=Female).
  final int? gender;

  /// Tax/VAT number (optional).
  final String? taxVat;

  /// Customer group ID.
  final int groupId;

  /// Store ID.
  final int storeId;

  /// Website ID.
  final int websiteId;

  /// Account creation date.
  final DateTime createdAt;

  /// Default shipping address ID.
  final int? defaultShippingAddressId;

  /// Default billing address ID.
  final int? defaultBillingAddressId;

  const Customer({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    this.dateOfBirth,
    this.gender,
    this.taxVat,
    required this.groupId,
    required this.storeId,
    required this.websiteId,
    required this.createdAt,
    this.defaultShippingAddressId,
    this.defaultBillingAddressId,
    super.customAttributes,
  });

  /// Full name combining first and last name.
  String get fullName => '$firstName $lastName';
}
