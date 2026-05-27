/// Flutter Magento SDK - Complete e-commerce solution
///
/// This umbrella package re-exports all Magento SDK packages:
/// - Core types and interfaces
/// - Authentication
/// - Catalog (products, categories)
/// - Shopping cart
/// - Customer profile
/// - Localization
/// - UI widgets
/// - Riverpod state management
library;

// Core
export 'package:flutter_magento_core/flutter_magento_core.dart';

// Feature packages
export 'package:flutter_magento_auth/flutter_magento_auth.dart'
    hide CustomerMapper;
export 'package:flutter_magento_catalog/flutter_magento_catalog.dart';
export 'package:flutter_magento_cart/flutter_magento_cart.dart';
export 'package:flutter_magento_profile/flutter_magento_profile.dart';

// Utilities
export 'package:flutter_magento_localizations/flutter_magento_localizations.dart';
export 'package:flutter_magento_ui/flutter_magento_ui.dart';

// State management
export 'package:flutter_magento_riverpod/flutter_magento_riverpod.dart';
