/// Magento customer profile implementation.
///
/// Provides customer profile and address management operations.
library;

// Re-export core types
export 'package:flutter_magento_core/flutter_magento_core.dart'
    show
        CustomerRepository,
        CustomerUpdate,
        Customer,
        CustomerAddress,
        Address;

// Repository
export 'src/repository/magento_customer_repository.dart';

// Mapper (for extension)
export 'src/mappers/customer_mapper.dart';

// Queries (for extension)
export 'src/queries/customer_queries.dart';
