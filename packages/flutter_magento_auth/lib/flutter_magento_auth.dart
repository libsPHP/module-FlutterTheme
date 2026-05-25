/// Magento authentication implementation.
///
/// Provides login, registration, and secure token storage.
library;

// Re-export core types
export 'package:flutter_magento_core/flutter_magento_core.dart'
    show
        AuthRepository,
        MagentoAuthStorage,
        MemoryMagentoAuthStorage,
        Customer,
        CustomerSession;

// Repository
export 'src/repository/magento_auth_repository.dart';

// Storage implementations
export 'src/storage/secure_magento_auth_storage.dart';
export 'src/storage/shared_prefs_auth_storage.dart';

// Mapper (for extension)
export 'src/mappers/customer_mapper.dart';

// Queries (for extension)
export 'src/queries/auth_queries.dart';
