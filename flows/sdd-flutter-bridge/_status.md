# Status: sdd-flutter-bridge

## Current Phase

PLAN

## Phase Status

DRAFTING

## Last Updated

2026-05-24 by Claude (specifications drafted)

## Blockers

- None

## Progress

- [x] Requirements drafted
- [x] Requirements approved
- [x] Specifications drafted
- [x] Specifications approved
- [ ] Plan drafted  <-- current
- [ ] Plan drafted
- [ ] Plan approved
- [ ] Implementation started
- [ ] Implementation complete

## Context Notes

Key decisions and context for resuming:

- Transforming existing NativeMind_FlutterTheme into NativeMind_FlutterBridge
- New approach: theme-agnostic module that works with any Magento theme
- Module should NOT contain Flutter Web build or replace theme
- Module ADDS: canonical, route metadata, JSON-LD, OpenGraph, App Links, app banner
- Files to DELETE: Root.php, Fallback blocks, flutter-loader.js, fallback CSS, Vishakha styles
- Files to CREATE: Route builders, Canonical resolvers, JsonLd builders, App Links controllers, new layout XMLs
- Key architectural decisions:
  - Route metadata JSON goes in `before.body.end` container
  - Canonical/robots handled via PageConfig plugins
  - JSON-LD mode: disabled/append/replace (for theme compatibility)
  - All blocks must be FPC-safe (no private data)

## Fork History

N/A - New SDD flow

## Next Actions

1. Get specifications approved
2. Create implementation plan (03-plan.md)
3. Begin implementation
