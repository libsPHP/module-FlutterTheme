# Specifications: Localization (l10n)

**Status:** DRAFT
**Created:** 2026-02-02

## 1. Technical Architecture

### 1.1 Dependencies
- **`flutter_localizations`**: Needed for standard Flutter localization widgets and classes.
- **`intl`**: Already present, used for message formatting.
- **`shared_preferences`**: Already present, used for persisting the user's language choice.
- **`provider`**: Already present, used for state management (`LocaleProvider`).

### 1.2 Configuration (`l10n.yaml`)
A `l10n.yaml` file will be created in the project root to configure the generation of localization classes.
```yaml
arb-dir: lib/l10n
template-arb-file: app_en.arb
output-localization-file: app_localizations.dart
```

### 1.3 File Structure
```
lib/
├── l10n/
│   ├── app_en.arb (English - Template)
│   ├── app_zh.arb (Chinese)
│   ├── app_hi.arb (Hindi)
│   ├── app_bn.arb (Bengali)
│   ├── app_ru.arb (Russian)
│   └── app_th.arb (Thai)
├── core/
│   ├── localization/
│   │   ├── locale_provider.dart
│   │   └── language_constants.dart
```

### 1.4 State Management (`LocaleProvider`)
A `LocaleProvider` class (extending `ChangeNotifier`) will manage the application's locale state.

**Responsibilities:**
1.  **Initialization:** Load the saved locale from `SharedPreferences` on app start.
2.  **Fallback:** If no preference is saved, use `WidgetsBinding.instance.platformDispatcher.locale` to check if the device locale is supported. If not, default to English.
3.  **Update:** Allow the UI to set a new locale, update the state, and persist the choice to `SharedPreferences`.

**Interface:**
```dart
class LocaleProvider extends ChangeNotifier {
  Locale? _locale;
  Locale get locale => _locale ?? const Locale('en');

  Future<void> setLocale(Locale locale);
  Future<void> loadSavedLocale();
  bool isSupported(Locale locale);
}
```

## 2. Implementation Details

### 2.1 `app_en.arb` (Initial Scope)
The initial ARB file will contain basic structural strings and strings for the Profile screen to demonstrate functionality.

```json
{
  "appTitle": "TaxLien Swipe",
  "profileTitle": "Expert Profile",
  "language": "Language",
  "settings": "Settings",
  "roles": "Roles",
  "switchProfile": "Switch Profile"
}
```

### 2.2 Integration in `main.dart`
The `MaterialApp` must be updated to use the generated delegates and the provider's locale.

```dart
// inside build()
return MaterialApp.router(
  // ...
  locale: provider.locale,
  localizationsDelegates: AppLocalizations.localizationsDelegates,
  supportedLocales: AppLocalizations.supportedLocales,
  // ...
);
```

### 2.3 UI: Language Switcher
A new widget `LanguageSelector` will be added to `ProfileScreen`.

**Design:**
- A `ListTile` with title "Language" and a trailing dropdown or text indicating the current language.
- Tapping it opens a selection dialog or navigates to a selection screen.
- **Display Names:**
    - English
    - 中文 (Chinese)
    - हिन्दी (Hindi)
    - বাংলা (Bengali)
    - Русский (Russian)
    - ไทย (Thai)

## 3. Workflow for Adding Strings
1.  Developer adds a new key-value pair to `lib/l10n/app_en.arb`.
2.  Run `flutter gen-l10n` (or rely on IDE auto-gen).
3.  Use `AppLocalizations.of(context)!.keyName` in widgets.
4.  Translators (or AI) populate other `.arb` files.

## 4. Testing
- **Unit:** Verify `LocaleProvider` correctly persists and loads locales.
- **Manual:**
    1.  Launch app -> Default should be System or En.
    2.  Go to Profile -> Change to Russian.
    3.  Verify UI updates immediately.
    4.  Restart app -> Verify Russian is still selected.