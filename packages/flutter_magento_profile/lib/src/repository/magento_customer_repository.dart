import 'package:flutter_magento_core/flutter_magento_core.dart';

import '../mappers/customer_mapper.dart';
import '../queries/customer_queries.dart';

class MagentoCustomerRepository implements CustomerRepository {
  final MagentoTransport transport;
  final CustomerMapper _mapper;

  MagentoCustomerRepository({required this.transport}) : _mapper = CustomerMapper();

  @override
  Future<Customer> getCustomer() async {
    final response = await transport.graphql(
      CustomerQueries.getCustomer,
      decoder: (json) {
        final customerData = json['customer'] as Map<String, dynamic>?;
        if (customerData == null) {
          throw MagentoAuthException('Not authenticated');
        }
        return _mapper.mapCustomer(customerData);
      },
    );

    return response.data;
  }

  @override
  Future<Customer> updateCustomer(CustomerUpdate update) async {
    final input = <String, dynamic>{};

    if (update.firstName != null) input['firstname'] = update.firstName;
    if (update.lastName != null) input['lastname'] = update.lastName;
    if (update.email != null) input['email'] = update.email;
    if (update.dateOfBirth != null) {
      input['date_of_birth'] = update.dateOfBirth!.toIso8601String().split('T').first;
    }
    if (update.gender != null) input['gender'] = update.gender;
    if (update.taxVat != null) input['taxvat'] = update.taxVat;

    final response = await transport.graphql(
      CustomerQueries.updateCustomer,
      variables: {'input': input},
      decoder: (json) {
        final data = json['updateCustomerV2'] as Map<String, dynamic>?;
        final customerData = data?['customer'] as Map<String, dynamic>?;
        if (customerData == null) {
          throw MagentoServerException('Failed to update customer');
        }
        return _mapper.mapCustomer(customerData);
      },
    );

    return response.data;
  }

  @override
  Future<List<CustomerAddress>> getAddresses() async {
    final response = await transport.graphql(
      CustomerQueries.getAddresses,
      decoder: (json) {
        final customerData = json['customer'] as Map<String, dynamic>?;
        final addresses = customerData?['addresses'] as List<dynamic>? ?? [];
        return _mapper.mapAddresses(addresses);
      },
    );

    return response.data;
  }

  @override
  Future<CustomerAddress> addAddress(CustomerAddress address) async {
    final input = _mapper.addressToInput(address);

    final response = await transport.graphql(
      CustomerQueries.createAddress,
      variables: {'input': input},
      decoder: (json) {
        final addressData = json['createCustomerAddress'] as Map<String, dynamic>?;
        if (addressData == null) {
          throw MagentoServerException('Failed to create address');
        }
        return _mapper.mapAddress(addressData);
      },
    );

    return response.data;
  }

  @override
  Future<CustomerAddress> updateAddress(CustomerAddress address) async {
    final addressId = int.tryParse(address.id);
    if (addressId == null) {
      throw MagentoValidationException('Invalid address ID');
    }

    final input = _mapper.addressToInput(address);

    final response = await transport.graphql(
      CustomerQueries.updateAddress,
      variables: {
        'id': addressId,
        'input': input,
      },
      decoder: (json) {
        final addressData = json['updateCustomerAddress'] as Map<String, dynamic>?;
        if (addressData == null) {
          throw MagentoServerException('Failed to update address');
        }
        return _mapper.mapAddress(addressData);
      },
    );

    return response.data;
  }

  @override
  Future<void> deleteAddress(String addressId) async {
    final id = int.tryParse(addressId);
    if (id == null) {
      throw MagentoValidationException('Invalid address ID');
    }

    await transport.graphql(
      CustomerQueries.deleteAddress,
      variables: {'id': id},
      decoder: (json) => json['deleteCustomerAddress'] as bool? ?? false,
    );
  }

  @override
  Future<void> setDefaultShippingAddress(String addressId) async {
    final addresses = await getAddresses();
    final address = addresses.firstWhere(
      (a) => a.id == addressId,
      orElse: () => throw MagentoNotFoundException('Address not found: $addressId'),
    );

    await updateAddress(CustomerAddress(
      id: address.id,
      firstName: address.firstName,
      lastName: address.lastName,
      street: address.street,
      city: address.city,
      regionCode: address.regionCode,
      regionId: address.regionId,
      regionName: address.regionName,
      postcode: address.postcode,
      countryCode: address.countryCode,
      telephone: address.telephone,
      company: address.company,
      isDefaultShipping: true,
      isDefaultBilling: address.isDefaultBilling,
    ));
  }

  @override
  Future<void> setDefaultBillingAddress(String addressId) async {
    final addresses = await getAddresses();
    final address = addresses.firstWhere(
      (a) => a.id == addressId,
      orElse: () => throw MagentoNotFoundException('Address not found: $addressId'),
    );

    await updateAddress(CustomerAddress(
      id: address.id,
      firstName: address.firstName,
      lastName: address.lastName,
      street: address.street,
      city: address.city,
      regionCode: address.regionCode,
      regionId: address.regionId,
      regionName: address.regionName,
      postcode: address.postcode,
      countryCode: address.countryCode,
      telephone: address.telephone,
      company: address.company,
      isDefaultShipping: address.isDefaultShipping,
      isDefaultBilling: true,
    ));
  }

  @override
  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    await transport.graphql(
      CustomerQueries.changePassword,
      variables: {
        'currentPassword': currentPassword,
        'newPassword': newPassword,
      },
      decoder: (json) => json['changeCustomerPassword'],
    );
  }
}
