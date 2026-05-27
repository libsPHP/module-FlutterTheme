# flutter_magento_profile

[![pub package](https://img.shields.io/pub/v/flutter_magento_profile.svg)](https://pub.dev/packages/flutter_magento_profile)

Customer profile module for Flutter Magento SDK - profile and address management.

## Features

- Customer profile CRUD
- Address book management
- Default billing/shipping addresses
- Profile updates (name, email, password)

## Installation

```yaml
dependencies:
  flutter_magento_profile: ^1.0.0
```

## Usage

### Setup

```dart
import 'package:flutter_magento_profile/flutter_magento_profile.dart';

final customerRepository = MagentoCustomerRepository(
  transport: myGraphQLTransport,
);
```

### Get Customer Profile

```dart
final customer = await customerRepository.getCustomer();
print('${customer.firstName} ${customer.lastName}');
print('Email: ${customer.email}');
```

### Update Profile

```dart
final updated = await customerRepository.updateCustomer(
  CustomerUpdate(
    firstName: 'John',
    lastName: 'Smith',
  ),
);
```

### Change Password

```dart
await customerRepository.changePassword(
  currentPassword: 'oldPassword',
  newPassword: 'newPassword123',
);
```

### Address Management

```dart
// Get all addresses
final addresses = await customerRepository.getAddresses();

// Add new address
final newAddress = await customerRepository.createAddress(
  Address(
    firstName: 'John',
    lastName: 'Doe',
    street: ['123 Main St', 'Apt 4'],
    city: 'New York',
    region: 'NY',
    postcode: '10001',
    countryCode: 'US',
    telephone: '+1234567890',
  ),
);

// Update address
await customerRepository.updateAddress(
  addressId: address.id,
  address: address.copyWith(city: 'Brooklyn'),
);

// Delete address
await customerRepository.deleteAddress(addressId);
```

### Set Default Address

```dart
// Set default billing address
await customerRepository.setDefaultBillingAddress(addressId);

// Set default shipping address
await customerRepository.setDefaultShippingAddress(addressId);
```

## Models

```dart
class Customer {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final List<CustomerAddress> addresses;
  final CustomerAddress? defaultBilling;
  final CustomerAddress? defaultShipping;
}

class CustomerAddress {
  final int id;
  final String firstName;
  final String lastName;
  final List<String> street;
  final String city;
  final String? region;
  final String postcode;
  final String countryCode;
  final String? telephone;
  final bool isDefaultBilling;
  final bool isDefaultShipping;
}
```

## API Reference

| Class | Description |
|-------|-------------|
| `MagentoCustomerRepository` | Main profile repository |
| `CustomerMapper` | Maps customer data |
| `CustomerQueries` | GraphQL queries |

## Related Packages

- [flutter_magento_core](https://pub.dev/packages/flutter_magento_core) - Core types
- [flutter_magento_auth](https://pub.dev/packages/flutter_magento_auth) - Authentication
- [flutter_magento_riverpod](https://pub.dev/packages/flutter_magento_riverpod) - Profile state management
