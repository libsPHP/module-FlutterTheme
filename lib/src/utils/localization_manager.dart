import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Менеджер локализации для Flutter Magento с поддержкой языков Харконненов и Атрейдесов
class LocalizationManager {
  static const String _harkonnenLocale = 'harkonnen';
  static const String _atreidesLocale = 'atreides';
  static const String _russianLocale = 'ru';
  static const String _englishLocale = 'en';

  /// Доступные локали
  static const List<Locale> supportedLocales = [
    Locale(_englishLocale), // Английский (стандартный)
    Locale(_russianLocale), // Русский
    Locale(_harkonnenLocale), // Харконнский
    Locale(_atreidesLocale), // Атрейдский
  ];

  /// Получить локализацию по коду языка
  static Locale getLocaleFromCode(String languageCode) {
    switch (languageCode.toLowerCase()) {
      case _harkonnenLocale:
        return const Locale(_harkonnenLocale);
      case _atreidesLocale:
        return const Locale(_atreidesLocale);
      case _russianLocale:
        return const Locale(_russianLocale);
      case _englishLocale:
      default:
        return const Locale(_englishLocale);
    }
  }

  /// Получить название языка для отображения
  static String getLanguageName(String languageCode, BuildContext context) {
    switch (languageCode.toLowerCase()) {
      case _harkonnenLocale:
        return 'Харконнский';
      case _atreidesLocale:
        return 'Атрейдский';
      case _russianLocale:
        return 'Русский';
      case _englishLocale:
      default:
        return 'English';
    }
  }

  /// Получить описание языка
  static String getLanguageDescription(String languageCode) {
    switch (languageCode.toLowerCase()) {
      case _harkonnenLocale:
        return 'Язык Харконненов - властный и угрожающий';
      case _atreidesLocale:
        return 'Язык Атрейдесов - благородный и мудрый';
      case _russianLocale:
        return 'Русский язык';
      case _englishLocale:
      default:
        return 'English language';
    }
  }

  /// Получить иконку для языка
  static IconData getLanguageIcon(String languageCode) {
    switch (languageCode.toLowerCase()) {
      case _harkonnenLocale:
        return Icons.dark_mode; // Темная иконка для Харконненов
      case _atreidesLocale:
        return Icons.light_mode; // Светлая иконка для Атрейдесов
      case _russianLocale:
        return Icons.language; // Стандартная иконка для русского
      case _englishLocale:
      default:
        return Icons.language; // Стандартная иконка для английского
    }
  }

  /// Получить цвет темы для языка
  static Color getLanguageThemeColor(String languageCode) {
    switch (languageCode.toLowerCase()) {
      case _harkonnenLocale:
        return Colors.red[900]!; // Темно-красный для Харконненов
      case _atreidesLocale:
        return Colors.blue[700]!; // Синий для Атрейдесов
      case _russianLocale:
        return Colors.orange[700]!; // Оранжевый для русского
      case _englishLocale:
      default:
        return Colors.green[700]!; // Зеленый для английского
    }
  }

  /// Проверить, является ли язык Харконнским
  static bool isHarkonnenLanguage(String languageCode) {
    return languageCode.toLowerCase() == _harkonnenLocale;
  }

  /// Проверить, является ли язык Атрейдским
  static bool isAtreidesLanguage(String languageCode) {
    return languageCode.toLowerCase() == _atreidesLocale;
  }

  /// Получить приветственное сообщение в зависимости от языка
  static String getWelcomeMessage(String languageCode, AppLocalizations localizations) {
    if (isHarkonnenLanguage(languageCode)) {
      return '${localizations.welcome} - Добро пожаловать в мир Харконненов!';
    } else if (isAtreidesLanguage(languageCode)) {
      return '${localizations.welcome} - Добро пожаловать в мир Атрейдесов!';
    } else {
      return localizations.welcome;
    }
  }

  /// Получить стиль текста для языка
  static TextStyle getLanguageTextStyle(String languageCode, TextStyle baseStyle) {
    if (isHarkonnenLanguage(languageCode)) {
      return baseStyle.copyWith(
        fontWeight: FontWeight.bold,
        color: Colors.red[900],
        shadows: [
          Shadow(
            color: Colors.red[300]!,
            offset: const Offset(1, 1),
            blurRadius: 2,
          ),
        ],
      );
    } else if (isAtreidesLanguage(languageCode)) {
      return baseStyle.copyWith(
        fontWeight: FontWeight.w500,
        color: Colors.blue[700],
        shadows: [
          Shadow(
            color: Colors.blue[300]!,
            offset: const Offset(1, 1),
            blurRadius: 2,
          ),
        ],
      );
    }
    return baseStyle;
  }
}
