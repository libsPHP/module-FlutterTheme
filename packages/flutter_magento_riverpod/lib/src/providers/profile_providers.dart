import 'package:flutter_magento_core/flutter_magento_core.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core_providers.dart';

/// Current customer provider.
final customerProvider = FutureProvider.autoDispose<Customer>((ref) async {
  final customerRepo = ref.watch(customerRepositoryProvider);
  return customerRepo.getCustomer();
});

/// Customer addresses provider.
final addressesProvider = FutureProvider.autoDispose<List<CustomerAddress>>((ref) async {
  final customerRepo = ref.watch(customerRepositoryProvider);
  return customerRepo.getAddresses();
});
