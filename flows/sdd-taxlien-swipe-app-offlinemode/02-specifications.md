# Specifications: Offline Mode & Data Sync

> Version: 1.3
> Status: DRAFT
> Last Updated: 2026-01-30
> Requirements: [link to 01-requirements.md]

## Overview

The Offline Mode feature enables users to continue swiping and annotating properties without an active internet connection. It achieves this by:
1.  **Proactive Caching:** Maintaining a local buffer of `N` items in a SQLite database.
2.  **Tiered Image Caching:** Fetching images optimized for the device, with a subset (`M%`) fetched in Ultra-High-Res for zooming.
3.  **Smart Management:** Using an LRU strategy while protecting "Liked" and high-priority data.
4.  **Queue Sync:** Synchronizing user actions in the background.

## Affected Systems

| System | Impact | Notes |
|--------|--------|-------|
| `TaxLienService` | Modify | Route requests through `DataRepository`. |
| `SwipeFeature` | Modify | Consume stream of properties from repository. |
| `LocalStorage` | Create | SQLite schema for properties, images, and action queue. |
| `SyncManager` | Create | Background service for prefetching and syncing. |

## Interfaces

### New Interfaces

#### IDataRepository

```dart
abstract class IDataRepository {
  Stream<List<Property>> getPropertiesStream(FilterContext context);
  Future<void> queueAction(UserAction action);
  
  /// Triggers a proactive refill of the cache.
  /// Requests:
  /// - 'Device-Max' resolution for 100% of batch.
  /// - 'Source-Max' (Ultra) resolution for the first M% of the batch.
  Future<void> prefetchBatch({
    required int limit, 
    required int ultraResLimit,
    required DeviceCapabilities caps
  });
}
```

## Integration Points

### External API Recommendations (Gateway)

1.  **`POST /api/v1/sync/actions`**: Batch upload.
2.  **`GET /api/v1/properties/discovery`**: Recommendation feed with `priority_score`.
3.  **`POST /api/v1/properties/priority-updates`**: Score deltas.
4.  **`POST /api/v1/properties/details/bulk`**: High-res data fetch.

### Image Strategy Recommendation
- **Quality Mandate:** **ALL** photos must be stored and served in maximum quality.
- **Two-Tier Preloading:**
    - **Tier 1 (Device-Max):** 100% of preloaded items fetch images optimized for the device's maximum display dimensions (e.g., `?w=2048&q=90`).
    - **Tier 2 (Ultra-Source):** A top subset (`M%`, e.g., first 20 items) fetches the original full-resolution source image (e.g., `?quality=source`) to allow offline zooming.
- **Device-Specific Parameters:** Preload requests include `max_w`, `max_h`, and `dpr`.
- **Processing:** On-the-fly resizing proxy to serve requested resolutions while maintaining source quality.

## Testing Strategy

### Unit Tests
- `DataRepository`: Verify tiered prefetching logic (correct number of Ultra vs Device-Max requests).
- `LRU`: Verify "Liked" and "Ultra" items are handled correctly (Ultra might be heavier, but important).

### Integration Tests
- Verify zooming works offline for the first `M%` of items.
- Verify correct image dimensions/quality flags are sent to the Gateway.

---

## Approval

- [ ] Reviewed by:
- [ ] Approved on:
- [ ] Notes:
