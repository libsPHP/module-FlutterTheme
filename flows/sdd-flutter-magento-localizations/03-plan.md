# Plan: Localization (l10n)

**Status:** DRAFT
**Created:** 2026-02-02

## 1. Setup & Configuration
- [x] **Dependency Check:** Verify `flutter_localizations` is added (it's part of the SDK, but needs declaration in `pubspec.yaml`).
- [x] **Config File:** Create `l10n.yaml` in the project root.
- [x] **Directory Structure:** Create `lib/l10n` directory.

## 2. Core Localization Logic
- [x] **ARB Creation:** Create `lib/l10n/app_en.arb` with initial strings (App Title, Profile, Language, etc.).
- [x] **Placeholder ARBs:** Create empty/skeleton ARB files for other languages (`zh`, `hi`, `bn`, `ru`, `th`) to ensure compilation works.
- [x] **Locale Provider:** Implement `lib/core/localization/locale_provider.dart` with `SharedPreferences` logic for persistence.
- [x] **Main Integration:** Update `lib/main.dart` to:
    - Initialize `LocaleProvider`.
    - Inject `LocaleProvider` into the widget tree.
    - Configure `MaterialApp.router` with localization delegates and supported locales.

## 3. UI Implementation
- [x] **Profile Screen Update:**
    - Modify `lib/features/profile/screens/profile_screen.dart`.
    - Add a `LanguageSelector` widget (dropdown or list tile) that consumes `LocaleProvider`.
    - Use `AppLocalizations` strings for the UI text.
- [x] **Language Mapping:** Create a constant map of Locale codes to Native Names (e.g., 'ru': 'Русский') for the selector.

## 4. Translation Population
- [x] **Populate ARBs:** Fill in the translation strings for `zh`, `hi`, `bn`, `ru`, `th` for the initial set of keys (using AI translation for now).

## 5. Verification
- [x] **Manual Test:**
    - Run the app.
    - Go to Profile.
    - Switch language to Russian.
    - Verify text changes.
    - Restart app.
    - Verify Russian persists.