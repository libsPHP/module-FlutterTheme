# Requirements: Localization (l10n) & Internationalization (i18n)

**Status:** DRAFT
**Created:** 2026-02-02

## 1. Overview
The goal is to implement full localization support for the TaxLien Swipe App. This will allow the application to be used by speakers of various languages and enable users to demonstrate the app to potential stakeholders (family members, investors) who may not speak English.

## 2. Supported Languages

### 2.1 Primary Language
- **English (en)**: The source language for development and the default fallback.

### 2.2 Additional Languages
- **Chinese (Simplified) (zh)**
- **Hindi (hi)**
- **Bengali (bn)**
- **Russian (ru)**
- **Thai (th)**

## 3. Functional Requirements

### 3.1 Language Resolution Strategy
1.  **System Default:** Upon first launch, the app must detect the device's system locale.
    - If the system locale matches one of the supported languages, use it.
    - If not, fall back to **English**.
2.  **Manual Override:** The user must be able to manually change the language within the app settings.
    - This setting must persist across app restarts.
    - Changing the language should update the UI immediately (or require a soft restart if architectural constraints dictate, but immediate is preferred).

### 3.2 In-App Language Switcher
- **Location:** Settings / Profile screen.
- **UI:** A dropdown or modal list displaying the supported languages in their native script (e.g., "English", "Русский", "中文").
- **Purpose:** "Enable users to show the app to a person speaking another language."

### 3.3 Scope of Localization
- **UI Strings:** All static text labels, buttons, menu items, onboarding screens, help text, and error messages.
- **Date/Time Formatting:** Display dates and times according to the selected locale's conventions.
- **Number/Currency Formatting:** While currency might remain in USD (as the assets are US-based), number formatting (decimal separators) should respect the locale.

### 3.4 Out of Scope (for this phase)
- **Dynamic Content Translation:** Property descriptions, legal texts, and data fetched from the backend will remain in their source language (likely English) unless the backend provides translated fields. This phase focuses on the **Client App UI**.

## 4. Technical Constraints & Context
- **Framework:** Flutter.
- **Standard:** Use `flutter_localizations` and ARB files (Application Resource Bundle) as the standard approach.
- **Context:** The app includes complex flows like:
    - **Onboarding:** "Choose Your Style", "Beginner/Advanced Mode" descriptions.
    - **Swipe Screen:** "Context View", "Details View", HUD labels.
    - **Annotation:** Tools labels ("Point", "Line", "Comment").
    - **Offline Mode:** Sync status messages.
- **Reference Flows:**
    - `sdd-miw-gift` (Business logic context)
    - `sdd-taxlien-swipe-app-onboarding` (UI text sources)
    - `sdd-taxlien-swipe-app-swipe-screen` (UI text sources)

## 5. User Stories
- **US-1:** As a user, I want the app to automatically open in Russian because my phone is set to Russian.
- **US-2:** As a user, I want to switch the app language to Thai so I can show it to my grandfather who doesn't speak English well.
- **US-3:** As a developer, I want to easily add new strings to `app_en.arb` and have them ready for translation.
