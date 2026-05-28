import 'dart:ui';

import 'package:flutter_magento_core/flutter_magento_core.dart';

/// Resolves locale information from [MagentoStoreContext].
class StoreLocaleResolver {
  /// Resolves a [Locale] from the store context.
  static Locale resolveLocale(MagentoStoreContext context) {
    final parts = context.locale.split('_');
    final languageCode = parts.first;
    final countryCode = parts.length > 1 ? parts[1] : null;

    return countryCode != null
        ? Locale(languageCode, countryCode)
        : Locale(languageCode);
  }

  /// Returns true if the store's locale uses RTL text direction.
  static bool isRtl(MagentoStoreContext context) {
    final languageCode = context.languageCode;
    return _rtlLanguages.contains(languageCode);
  }

  /// Returns the text direction for the store's locale.
  static TextDirection textDirection(MagentoStoreContext context) {
    return isRtl(context) ? TextDirection.rtl : TextDirection.ltr;
  }

  /// Returns the script code for the locale if known.
  static String? scriptCode(MagentoStoreContext context) {
    final languageCode = context.languageCode;
    return _scriptCodes[languageCode];
  }

  /// Common RTL language codes.
  static const _rtlLanguages = {
    'ar', // Arabic
    'he', // Hebrew
    'fa', // Farsi/Persian
    'ur', // Urdu
    'ps', // Pashto
    'sd', // Sindhi
    'yi', // Yiddish
  };

  /// Common script codes for languages.
  static const _scriptCodes = <String, String>{
    'zh': 'Hans', // Chinese Simplified
    'ja': 'Jpan', // Japanese
    'ko': 'Kore', // Korean
  };

  /// Returns the fallback locale for unsupported locales.
  static Locale fallbackLocale(List<Locale> supportedLocales, Locale preferred) {
    // Try exact match
    for (final supported in supportedLocales) {
      if (supported.languageCode == preferred.languageCode &&
          supported.countryCode == preferred.countryCode) {
        return supported;
      }
    }

    // Try language-only match
    for (final supported in supportedLocales) {
      if (supported.languageCode == preferred.languageCode) {
        return supported;
      }
    }

    // Return first supported locale
    return supportedLocales.first;
  }
}
