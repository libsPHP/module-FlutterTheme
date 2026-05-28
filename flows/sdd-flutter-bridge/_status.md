# Status: sdd-flutter-bridge

## Current Phase

IMPLEMENTATION

## Phase Status

IN_PROGRESS

## Last Updated

2026-05-24 by Claude (Phases 0-3 implemented)

## Blockers

- None

## Progress

- [x] Requirements drafted
- [x] Requirements approved
- [x] Specifications drafted
- [x] Specifications approved
- [x] Plan drafted
- [x] Plan approved
- [x] Implementation started  <-- current
- [ ] Implementation complete

## Context Notes

Key decisions and context for resuming:

- Transforming existing NativeMind_FlutterTheme into NativeMind_Bridge
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
- Implementation plan has 67 tasks across 12 phases

## Fork History

N/A - New SDD flow

## Next Actions

1. Get plan approved
2. Begin implementation with Phase 0 (Cleanup & Rename)
