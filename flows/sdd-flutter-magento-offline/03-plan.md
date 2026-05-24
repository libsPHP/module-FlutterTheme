# Implementation Plan: Offline Mode & Data Sync

> Version: 1.0  
> Status: DRAFT  
> Last Updated: 2026-01-30  
> Specifications: [link to 02-specifications.md]

## Summary

This plan outlines the transition from a direct-to-API architecture to an "Offline-First" architecture using SQLite for caching and a Repository pattern for data access.

## Task Breakdown

### Phase 1: Foundation & Storage

#### Task 1.1: Configuration Updates
- **Description**: Add new environment variables to `.env` and `EnvConfig`.
- **Files**: 
  - `.env` - Add `OFFLINE_BATCH_SIZE=100`, `ULTRA_RES_PERCENT=20`.
  - `lib/core/config/env_config.dart` - Add getters for new variables.
- **Complexity**: Low

#### Task 1.2: Database Service Implementation
- **Description**: Create SQLite database helper using `sqflite`.
- **Files**: 
  - `lib/core/database/database_service.dart` - Define tables (`properties`, `action_queue`, `metadata`).
- **Complexity**: Medium

### Phase 2: Data Repository Layer

#### Task 2.1: Repository Pattern Implementation
- **Description**: Create `DataRepository` to coordinate between `DatabaseService` and `TaxLienService`.
- **Files**: 
  - `lib/core/repositories/data_repository.dart` - Implement fetch, cache, and action queuing logic.
- **Complexity**: High

#### Task 2.2: Image Cache Manager
- **Description**: Logic to proactively download images based on the two-tier strategy (Device-Max and Ultra-Source).
- **Files**: 
  - `lib/services/image_cache_service.dart` - Wrapper for `flutter_cache_manager`.
- **Complexity**: Medium

### Phase 3: Sync & Background Processing

#### Task 3.1: Sync Manager Implementation
- **Description**: Background service to handle periodic prefetching and flushing the `action_queue`.
- **Files**: 
  - `lib/services/sync_manager.dart` - Implementation of connectivity-aware sync logic.
- **Complexity**: Medium

### Phase 4: UI Integration

#### Task 4.1: Swipe Screen Refactoring
- **Description**: Update `SwipeScreen` (and its Provider/Bloc) to consume data from `DataRepository`.
- **Files**: 
  - `lib/features/swipe/swipe_provider.dart` (or similar)
- **Complexity**: Medium

#### Task 4.2: Empty State & Fallback UX
- **Description**: Implement "No more items" screen with "Review Liked Properties" CTA.
- **Files**: 
  - `lib/features/swipe/widgets/offline_empty_state.dart`
- **Complexity**: Low

#### Task 4.3: Details Screen Offline Mode
- **Description**: Ensure property details (and Ultra-res images) work offline for "Liked" and high-priority items.
- **Files**: 
  - `lib/features/details/details_screen.dart`
- **Complexity**: Medium

### Phase 5: Testing & Verification

#### Task 5.1: Unit Testing
- **Description**: Test DB eviction (LRU) and Sync retry logic.
- **Complexity**: Medium

#### Task 5.2: Manual E2E Testing
- **Description**: Verify offline swiping and subsequent online sync.
- **Complexity**: Low

## File Change Summary

| File | Action | Reason |
|------|--------|--------|
| `lib/core/config/env_config.dart` | Modify | Add offline config. |
| `lib/core/database/database_service.dart` | Create | Local persistence. |
| `lib/core/repositories/data_repository.dart` | Create | Offline-first data hub. |
| `lib/services/image_cache_service.dart` | Create | Multi-tier image preloading. |
| `lib/services/sync_manager.dart` | Create | Background sync logic. |
| `lib/services/tax_lien_service.dart` | Modify | Refactor for batch operations. |

## Risk Assessment

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| Storage overflow from Ultra-res images | Medium | Medium | Strict LRU and pinning only "Liked" items. |
| Duplicate actions on sync retry | Low | High | Use UUIDs for actions and idempotent API endpoints. |
| UI lag during DB operations | Low | Medium | Use compute isolates for heavy JSON parsing/DB writes. |

## Checkpoints

- [ ] Database tables created and migrations tested.
- [ ] `DataRepository` successfully serves mock data from DB when offline.
- [ ] Background prefetcher fills 100 items upon startup.
- [ ] "Liked" items persist after app restart without internet.

---

## Approval

- [ ] Reviewed by:
- [ ] Approved on:
- [ ] Notes: