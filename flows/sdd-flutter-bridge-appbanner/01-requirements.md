# Requirements: BridgeAppBanner

> Version: 1.0
> Status: DRAFT
> Last Updated: 2026-05-25

## Problem Statement

When users visit the web store on mobile, stores want to encourage them to use the native app for a better experience. A smart banner can prompt users to "Open in App" or "Install App" without being intrusive. This is a visual element that many stores don't want, so it must be a separate optional module.

## User Stories

### Primary

**As a** mobile web visitor
**I want** to see a non-intrusive app banner
**So that** I can easily switch to the native app if installed

**As a** store owner
**I want** to customize banner text and appearance
**So that** it matches my brand

### Secondary

**As a** visitor who dismissed the banner
**I want** it to stay hidden for a configurable period
**So that** I'm not annoyed on every page load

**As a** store admin
**I want** to control which pages show the banner
**So that** I can limit it to high-value pages (products, categories)

## Acceptance Criteria

### Must Have

1. **Given** app banner is enabled
   **When** product page loads on mobile
   **Then** banner appears at top of page with "Open" and "Install" buttons

2. **Given** user clicks close button
   **When** banner dismisses
   **Then** cookie is set for configured days and banner doesn't reappear

3. **Given** "Open" button is clicked
   **When** app is installed
   **Then** deep link opens app to current page

4. **Given** "Install" button is clicked
   **When** user taps it
   **Then** opens configured app store URL

5. **Given** admin configures pages
   **When** page type is not enabled
   **Then** banner does not appear

### Should Have

- Customizable title, subtitle, button text
- CSS class prefix for easy theme customization
- Smooth show/hide animations

### Won't Have (This Iteration)

- Smart App Banners (Safari meta tags) - future enhancement
- A/B testing
- Analytics tracking

## Constraints

- **Dependencies**: Requires `NativeMind_BridgeCore`
- **Optional dependency**: Can use App Store URLs from AppLinks module if available
- **No JS frameworks**: Vanilla JS only for banner behavior
- **FPC-compatible**: Initial render hidden, JS shows if cookie not set

## Config Scope

```text
nativemind_Bridge/app_banner/
  - enabled
  - title (default: "Open in App")
  - subtitle (default: "Better shopping experience")
  - open_button_text (default: "Open")
  - install_button_text (default: "Install")
  - show_on_product (yes/no)
  - show_on_category (yes/no)
  - show_on_home (yes/no)
  - dismiss_cookie_days (default: 7)
  - install_url (fallback if AppLinks not available)
```

## Banner Behavior

```text
Initial state: display:none (FPC-safe)

On page load (JS):
  1. Check for dismiss cookie
  2. If not dismissed → show banner
  3. If dismissed → keep hidden

On close click:
  1. Hide banner
  2. Set cookie nm_Bridge_dismissed=1 for N days

Open button:
  - Links to current URL (relies on App Links to intercept)

Install button:
  - Links to configured store URL
  - Opens in new tab
```

## CSS Architecture

```text
All classes prefixed: .nm-Bridge-banner*

Structure:
  .nm-Bridge-banner (container)
    .nm-Bridge-banner__content
      .nm-Bridge-banner__text
        .nm-Bridge-banner__title
        .nm-Bridge-banner__subtitle
      .nm-Bridge-banner__actions
        .nm-Bridge-banner__btn--open
        .nm-Bridge-banner__btn--install
    .nm-Bridge-banner__close
```

## Open Questions

- [x] Platform detection (iOS vs Android)? → Not in v1, show generic banner
- [x] Show on desktop? → No, mobile only via CSS media queries

## References

- Original: `Block/App/Banner.php`, `view/frontend/templates/app/banner.phtml`, `view/frontend/web/css/bridge.css`
- Smart App Banners: https://developer.apple.com/documentation/webkit/promoting_apps_with_smart_app_banners

---

## Approval

- [ ] Reviewed by: [pending]
- [ ] Approved on: [pending]
- [ ] Notes:
