import 'dart:ui';
import 'package:flutter/material.dart';

/// Manager for handling localization functionality
class LocalizationManager {
  static const Map<String, String> _languageNames = {
    'en': 'English',
    'ru': 'Русский',
    'es': 'Español',
    'fr': 'Français',
    'de': 'Deutsch',
    'it': 'Italiano',
    'pt': 'Português',
    'zh': '中文',
    'ja': '日本語',
    'ko': '한국어',
    'ar': 'العربية',
    'hi': 'हिन्दी',
    'th': 'ไทย',
    'vi': 'Tiếng Việt',
    'tr': 'Türkçe',
    'pl': 'Polski',
    'nl': 'Nederlands',
    'sv': 'Svenska',
    'da': 'Dansk',
    'no': 'Norsk',
    'fi': 'Suomi',
    'cs': 'Čeština',
    'sk': 'Slovenčina',
    'hu': 'Magyar',
    'ro': 'Română',
    'bg': 'Български',
    'hr': 'Hrvatski',
    'sl': 'Slovenščina',
    'et': 'Eesti',
    'lv': 'Latviešu',
    'lt': 'Lietuvių',
    'uk': 'Українська',
    'be': 'Беларуская',
    'ka': 'ქართული',
    'am': 'አማርኛ',
    'he': 'עברית',
    'fa': 'فارسی',
    'ur': 'اردو',
    'bn': 'বাংলা',
    'ta': 'தமிழ்',
    'te': 'తెలుగు',
    'ml': 'മലയാളം',
    'kn': 'ಕನ್ನಡ',
    'gu': 'ગુજરાતી',
    'mr': 'मराठी',
    'pa': 'ਪੰਜਾਬੀ',
    'or': 'ଓଡ଼ିଆ',
    'as': 'অসমীয়া',
    'ne': 'नेपाली',
    'si': 'සිංහල',
    'my': 'မြန်မာ',
    'km': 'ខ្មែរ',
    'lo': 'ລາວ',
    'az': 'Azərbaycan',
    'kk': 'Қазақ',
    'ky': 'Кыргыз',
    'uz': 'Oʻzbek',
    'tg': 'Тоҷикӣ',
    'mn': 'Монгол',
  };

  static const Map<String, Locale> _supportedLocales = {
    'en': Locale('en', 'US'),
    'ru': Locale('ru', 'RU'),
    'es': Locale('es', 'ES'),
    'fr': Locale('fr', 'FR'),
    'de': Locale('de', 'DE'),
    'it': Locale('it', 'IT'),
    'pt': Locale('pt', 'PT'),
    'zh': Locale('zh', 'CN'),
    'ja': Locale('ja', 'JP'),
    'ko': Locale('ko', 'KR'),
    'ar': Locale('ar', 'SA'),
    'hi': Locale('hi', 'IN'),
    'th': Locale('th', 'TH'),
    'vi': Locale('vi', 'VN'),
    'tr': Locale('tr', 'TR'),
    'pl': Locale('pl', 'PL'),
    'nl': Locale('nl', 'NL'),
    'sv': Locale('sv', 'SE'),
    'da': Locale('da', 'DK'),
    'no': Locale('no', 'NO'),
    'fi': Locale('fi', 'FI'),
    'cs': Locale('cs', 'CZ'),
    'sk': Locale('sk', 'SK'),
    'hu': Locale('hu', 'HU'),
    'ro': Locale('ro', 'RO'),
    'bg': Locale('bg', 'BG'),
    'hr': Locale('hr', 'HR'),
    'sl': Locale('sl', 'SI'),
    'et': Locale('et', 'EE'),
    'lv': Locale('lv', 'LV'),
    'lt': Locale('lt', 'LT'),
    'uk': Locale('uk', 'UA'),
    'be': Locale('be', 'BY'),
    'ka': Locale('ka', 'GE'),
    'am': Locale('am', 'ET'),
    'he': Locale('he', 'IL'),
    'fa': Locale('fa', 'IR'),
    'ur': Locale('ur', 'PK'),
    'bn': Locale('bn', 'BD'),
    'ta': Locale('ta', 'IN'),
    'te': Locale('te', 'IN'),
    'ml': Locale('ml', 'IN'),
    'kn': Locale('kn', 'IN'),
    'gu': Locale('gu', 'IN'),
    'mr': Locale('mr', 'IN'),
    'pa': Locale('pa', 'IN'),
    'or': Locale('or', 'IN'),
    'as': Locale('as', 'IN'),
    'ne': Locale('ne', 'NP'),
    'si': Locale('si', 'LK'),
    'my': Locale('my', 'MM'),
    'km': Locale('km', 'KH'),
    'lo': Locale('lo', 'LA'),
    'az': Locale('az', 'AZ'),
    'kk': Locale('kk', 'KZ'),
    'ky': Locale('ky', 'KG'),
    'uz': Locale('uz', 'UZ'),
    'tg': Locale('tg', 'TJ'),
    'mn': Locale('mn', 'MN'),
  };

  /// Get locale from language code
  static Locale getLocaleFromCode(String languageCode) {
    return _supportedLocales[languageCode] ?? const Locale('en', 'US');
  }

  /// Get language name from code
  static String getLanguageName(String languageCode, BuildContext? context) {
    return _languageNames[languageCode] ?? 'Unknown';
  }

  /// Get all supported language codes
  static List<String> getSupportedLanguageCodes() {
    return _supportedLocales.keys.toList();
  }

  /// Get all supported locales
  static List<Locale> getSupportedLocales() {
    return _supportedLocales.values.toList();
  }
  
  /// Get supported locales (alias for backward compatibility)
  static List<Locale> get supportedLocales => getSupportedLocales();

  /// Check if language code is supported
  static bool isLanguageSupported(String languageCode) {
    return _supportedLocales.containsKey(languageCode);
  }

  /// Get system locale language code
  static String getSystemLanguageCode() {
    final systemLocale = PlatformDispatcher.instance.locale;
    final languageCode = systemLocale.languageCode;
    
    if (isLanguageSupported(languageCode)) {
      return languageCode;
    }
    
    return 'en'; // fallback to English
  }

  /// Get language direction (RTL or LTR)
  static TextDirection getTextDirection(String languageCode) {
    const rtlLanguages = {'ar', 'he', 'fa', 'ur'};
    return rtlLanguages.contains(languageCode) 
        ? TextDirection.rtl 
        : TextDirection.ltr;
  }

  /// Format locale for API calls
  static String formatLocaleForApi(Locale locale) {
    return '${locale.languageCode}_${locale.countryCode}';
  }

  /// Parse locale from API format
  static Locale parseLocaleFromApi(String localeString) {
    final parts = localeString.split('_');
    if (parts.length >= 2) {
      return Locale(parts[0], parts[1]);
    }
    return Locale(parts[0]);
  }

  /// Get available languages for dropdown
  static Map<String, String> getAvailableLanguages() {
    return Map.fromEntries(
      _supportedLocales.keys.map((code) => 
        MapEntry(code, _languageNames[code] ?? code)
      )
    );
  }

  /// Get currency symbol for locale
  static String getCurrencySymbol(String languageCode) {
    const currencyMap = {
      'en': '\$',
      'ru': '₽',
      'es': '€',
      'fr': '€',
      'de': '€',
      'it': '€',
      'pt': '€',
      'zh': '¥',
      'ja': '¥',
      'ko': '₩',
      'ar': 'ر.س',
      'hi': '₹',
      'th': '฿',
      'vi': '₫',
      'tr': '₺',
      'pl': 'zł',
      'nl': '€',
      'sv': 'kr',
      'da': 'kr',
      'no': 'kr',
      'fi': '€',
      'cs': 'Kč',
      'sk': '€',
      'hu': 'Ft',
      'ro': 'lei',
      'bg': 'лв',
      'hr': 'kn',
      'sl': '€',
      'et': '€',
      'lv': '€',
      'lt': '€',
      'uk': '₴',
      'be': 'Br',
      'ka': '₾',
      'he': '₪',
      'fa': '﷼',
      'ur': '₨',
      'bn': '৳',
    };
    
    return currencyMap[languageCode] ?? '\$';
  }

  /// Get date format pattern for locale
  static String getDateFormat(String languageCode) {
    const dateFormats = {
      'en': 'MM/dd/yyyy',
      'ru': 'dd.MM.yyyy',
      'es': 'dd/MM/yyyy',
      'fr': 'dd/MM/yyyy',
      'de': 'dd.MM.yyyy',
      'it': 'dd/MM/yyyy',
      'pt': 'dd/MM/yyyy',
      'zh': 'yyyy/MM/dd',
      'ja': 'yyyy/MM/dd',
      'ko': 'yyyy/MM/dd',
      'ar': 'dd/MM/yyyy',
      'hi': 'dd/MM/yyyy',
      'th': 'dd/MM/yyyy',
      'vi': 'dd/MM/yyyy',
      'tr': 'dd.MM.yyyy',
      'pl': 'dd.MM.yyyy',
      'nl': 'dd-MM-yyyy',
      'sv': 'yyyy-MM-dd',
      'da': 'dd-MM-yyyy',
      'no': 'dd.MM.yyyy',
      'fi': 'dd.MM.yyyy',
      'cs': 'dd.MM.yyyy',
      'sk': 'dd.MM.yyyy',
      'hu': 'yyyy.MM.dd',
      'ro': 'dd.MM.yyyy',
      'bg': 'dd.MM.yyyy',
      'hr': 'dd.MM.yyyy',
      'sl': 'dd.MM.yyyy',
      'et': 'dd.MM.yyyy',
      'lv': 'dd.MM.yyyy',
      'lt': 'yyyy-MM-dd',
      'uk': 'dd.MM.yyyy',
      'be': 'dd.MM.yyyy',
      'ka': 'dd.MM.yyyy',
      'he': 'dd/MM/yyyy',
      'fa': 'yyyy/MM/dd',
      'ur': 'dd/MM/yyyy',
      'bn': 'dd/MM/yyyy',
    };
    
    return dateFormats[languageCode] ?? 'MM/dd/yyyy';
  }

  /// Get number format for locale
  static String formatNumber(double number, String languageCode) {
    // Simple number formatting based on locale
    if (languageCode == 'ru' || languageCode == 'de' || languageCode == 'fr') {
      return number.toStringAsFixed(2).replaceAll('.', ',');
    }
    
    return number.toStringAsFixed(2);
  }

  /// Validate language code
  static bool validateLanguageCode(String? languageCode) {
    if (languageCode == null || languageCode.isEmpty) {
      return false;
    }
    
    return _supportedLocales.containsKey(languageCode);
  }

  /// Get language description (extended info)
  static String getLanguageDescription(String languageCode) {
    final name = _languageNames[languageCode] ?? 'Unknown';
    final locale = _supportedLocales[languageCode];
    if (locale != null) {
      return '$name (${locale.languageCode}-${locale.countryCode})';
    }
    return name;
  }

  /// Get language icon (flag emoji or similar)
  static String getLanguageIcon(String languageCode) {
    const flagEmojis = {
      'en': '🇺🇸', 'ru': '🇷🇺', 'es': '🇪🇸', 'fr': '🇫🇷', 'de': '🇩🇪',
      'it': '🇮🇹', 'pt': '🇵🇹', 'zh': '🇨🇳', 'ja': '🇯🇵', 'ko': '🇰🇷',
      'ar': '🇸🇦', 'hi': '🇮🇳', 'th': '🇹🇭', 'vi': '🇻🇳', 'tr': '🇹🇷',
      'pl': '🇵🇱', 'nl': '🇳🇱', 'sv': '🇸🇪', 'da': '🇩🇰', 'no': '🇳🇴',
      'fi': '🇫🇮', 'cs': '🇨🇿', 'sk': '🇸🇰', 'hu': '🇭🇺', 'ro': '🇷🇴',
      'bg': '🇧🇬', 'hr': '🇭🇷', 'sl': '🇸🇮', 'et': '🇪🇪', 'lv': '🇱🇻',
      'lt': '🇱🇹', 'uk': '🇺🇦', 'be': '🇧🇾', 'ka': '🇬🇪', 'he': '🇮🇱',
      'fa': '🇮🇷', 'ur': '🇵🇰', 'bn': '🇧🇩', 'ta': '🇮🇳', 'te': '🇮🇳',
      'ml': '🇮🇳', 'kn': '🇮🇳', 'gu': '🇮🇳', 'mr': '🇮🇳', 'pa': '🇮🇳',
      'or': '🇮🇳', 'as': '🇮🇳', 'ne': '🇳🇵', 'si': '🇱🇰', 'my': '🇲🇲',
      'km': '🇰🇭', 'lo': '🇱🇦', 'az': '🇦🇿', 'kk': '🇰🇿', 'ky': '🇰🇬',
      'uz': '🇺🇿', 'tg': '🇹🇯', 'mn': '🇲🇳',
    };
    return flagEmojis[languageCode] ?? '🌐';
  }

  /// Get theme color for language
  static int getLanguageThemeColor(String languageCode) {
    const themeColors = {
      'en': 0xFF2196F3, 'ru': 0xFFFF5722, 'es': 0xFFFF9800, 'fr': 0xFF3F51B5,
      'de': 0xFF607D8B, 'it': 0xFF4CAF50, 'pt': 0xFF9C27B0, 'zh': 0xFFF44336,
      'ja': 0xFFE91E63, 'ko': 0xFF673AB7, 'ar': 0xFF795548, 'hi': 0xFFFF5722,
      'th': 0xFFFFEB3B, 'vi': 0xFF8BC34A, 'tr': 0xFF00BCD4, 'pl': 0xFFCDDC39,
    };
    return themeColors[languageCode] ?? 0xFF9E9E9E;
  }

  /// Check if language is Harkonnen style (fictional - for theme purposes)
  static bool isHarkonnenLanguage(String languageCode) {
    const harkonnenLanguages = {'de', 'ru', 'pl', 'cs', 'hu'};
    return harkonnenLanguages.contains(languageCode);
  }

  /// Check if language is Atreides style (fictional - for theme purposes)
  static bool isAtreidesLanguage(String languageCode) {
    const atreidesLanguages = {'en', 'fr', 'es', 'it', 'pt'};
    return atreidesLanguages.contains(languageCode);
  }

  /// Get text style for language
  static Map<String, dynamic> getLanguageTextStyle(String languageCode) {
    return {
      'fontFamily': getTextDirection(languageCode) == TextDirection.rtl 
          ? 'Arabic' : 'Default',
      'fontSize': 14.0,
      'color': getLanguageThemeColor(languageCode),
    };
  }
}
