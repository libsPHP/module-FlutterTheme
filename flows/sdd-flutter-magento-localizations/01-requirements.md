# Requirements: flutter_magento_localizations

> Version: 1.0
> Status: APPROVED
> Last Updated: 2026-05-24

## Problem Statement

Multi-store Magento setups serve different locales. This package provides localization infrastructure: store context switching, locale-aware formatting (currency, dates), and UI strings for magento_ui widgets.

## User Stories

### Primary

**As a** Flutter developer
**I want** currency formatting based on store
**So that** prices display correctly per locale

**As a** Flutter developer
**I want** date formatting per locale
**So that** order dates show in user's format

**As a** Flutter developer
**I want** localized UI strings
**So that** magento_ui widgets work in any language

### Secondary

**As a** Flutter developer
**I want** store switcher support
**So that** users can change locale at runtime

**As a** Flutter developer
**I want** RTL support detection
**So that** UI handles Arabic/Hebrew correctly

## Acceptance Criteria

### Must Have

1. **Given** Money value
   **When** formatted with MagentoFormatters
   **Then** shows correct currency symbol and position per locale

2. **Given** DateTime value
   **When** formatted
   **Then** uses locale-appropriate format

3. **Given** magento_ui widget
   **When** rendered
   **Then** shows strings in app's locale

4. **Given** multiple stores configured
   **When** store context changes
   **Then** formatters update automatically

### Should Have

- Number formatting (quantities, weights)
- Pluralization rules
- Store-specific config (tax display, etc.)
- RTL layout detection

### Won't Have (This Iteration)

- Translation management UI
- Auto-translation
- Custom translation formats (only ARB)

## Constraints

- **Technical**: Use Flutter's intl and localizations
- **Format**: ARB files for translations
- **Coverage**: EN, ES, DE, FR, AR, TH, CN, HI, RU base translations

## References

- Flutter Internationalization guide
- intl package documentation
