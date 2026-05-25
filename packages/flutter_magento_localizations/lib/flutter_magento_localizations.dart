/// Magento localization and formatting utilities.
///
/// Provides locale-aware formatting for currency, dates, numbers,
/// and UI strings for magento_ui widgets.
library;

// Re-export core types
export 'package:flutter_magento_core/flutter_magento_core.dart'
    show MagentoStoreContext, Money;

// Formatters
export 'src/formatters/magento_formatters.dart';

// Locale utilities
export 'src/locale/store_locale_resolver.dart';

// Localizations
export 'src/l10n/magento_localizations.dart';
