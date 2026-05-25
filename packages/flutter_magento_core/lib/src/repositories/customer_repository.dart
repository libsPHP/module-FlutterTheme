import '../models/customer.dart';
import '../models/address.dart';

/// Repository interface for customer profile operations.
abstract interface class CustomerRepository {
  /// Gets the current customer's profile.
  ///
  /// Throws [MagentoAuthException] if not authenticated.
  Future<Customer> getCustomer();

  /// Updates the customer's profile.
  ///
  /// Returns the updated [Customer].
  Future<Customer> updateCustomer(CustomerUpdate update);

  /// Gets all saved addresses for the customer.
  Future<List<CustomerAddress>> getAddresses();

  /// Adds a new address to the customer's address book.
  ///
  /// Returns the created [CustomerAddress] with assigned ID.
  Future<CustomerAddress> addAddress(CustomerAddress address);

  /// Updates an existing address.
  ///
  /// Returns the updated [CustomerAddress].
  /// Throws [MagentoNotFoundException] if address doesn't exist.
  Future<CustomerAddress> updateAddress(CustomerAddress address);

  /// Deletes an address from the address book.
  ///
  /// Throws [MagentoNotFoundException] if address doesn't exist.
  Future<void> deleteAddress(String addressId);

  /// Sets an address as the default shipping address.
  Future<void> setDefaultShippingAddress(String addressId);

  /// Sets an address as the default billing address.
  Future<void> setDefaultBillingAddress(String addressId);

  /// Changes the customer's password.
  ///
  /// Requires the current password for verification.
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  });
}

/// Data for updating customer profile.
class CustomerUpdate {
  final String? firstName;
  final String? lastName;
  final String? email;
  final DateTime? dateOfBirth;
  final String? gender;
  final String? taxVat;
  final Map<String, dynamic>? customAttributes;

  const CustomerUpdate({
    this.firstName,
    this.lastName,
    this.email,
    this.dateOfBirth,
    this.gender,
    this.taxVat,
    this.customAttributes,
  });
}
