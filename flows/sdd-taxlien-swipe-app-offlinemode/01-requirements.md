# Requirements: Offline Mode & Data Sync

> Version: 0.5 (Revised)
> Status: APPROVED
> Last Updated: 2026-01-30

## Problem Statement

The application currently relies on active internet connection. Users may operate in areas with poor or no internet connectivity. To maintain user engagement and productivity, the app needs to work freely in these conditions without explicit manual intervention.

The goal is to provide a seamless experience where data (including images) is preloaded to support a configurable amount of work (N items), and user actions are queued locally and synced asynchronously when connectivity returns.

## User Stories

### Primary

**As a** User
**I want** the app to automatically preload the next batch of properties (images and data)
**So that** I can continue swiping without interruption even if I lose internet connection.

**As a** User
**I want** some of the preloaded items to have ultra-high-resolution photos
**So that** I can zoom in to see fine details (textures, cracks, etc.) even when I'm offline.

**As a** User
**I want** to be notified only when I completely run out of preloaded data
**So that** I am not distracted by "Offline" badges unless I am actually blocked from working.

**As a** User
**I want** the app to suggest reviewing details of my "Liked" properties when I run out of new items to swipe
**So that** I can continue being productive (deep diving into potential deals) while waiting for connection.

**As a** User
**I want** my decisions (swipes, annotations) to be saved immediately on my device and uploaded later
**So that** I don't lose progress if the internet cuts out.

**As a** User
**I want** the app to prioritize showing me the most important items (as determined by the system) even if I have already preloaded other items
**So that** I am always working on the highest value tasks.

## Acceptance Criteria

### Must Have

1. **Seamless Preloading / Caching**:
    - App must automatically cache textual data and images for properties based on current search/filters.
    - **Quantity:** `N` items are preloaded. `N` defaults to `100` (`OFFLINE_BATCH_SIZE`).
    - **Quality:** 
        - All photos must be "Device-Max" resolution (optimized for the current screen).
        - A configurable percentage (`M%`, default 20%, `.env: ULTRA_RES_PERCENT`) of the preloaded items (top of the queue) must have **Ultra-High-Resolution** (source-max) photos for offline zooming.
    - **Smart Content:** Cache must include items prioritized by ML and those commented on by linked accounts.
    - Caching must include **Full Details** for "Liked" properties.

2. **Proactive Refilling**:
    - App must proactively top-up the cache *on every swipe* to maintain the buffer at `N`.

3. **Dynamic Reordering**:
    - The app must support reordering the locally cached queue based on updates from the Gateway API.

4. **Storage Management (LRU)**:
    - Implement an LRU eviction policy for the image cache.
    - **Protection:** "Liked" properties and their full details must be protected from eviction.

5. **Offline Actions & Sync**:
    - All "write" actions must be persisted locally first and synced asynchronously.

6. **Empty State Experience**:
    - If the cache is exhausted and no internet is available, show "Review Liked Properties" CTA.

### Should Have

- [Removed: Manual Download button]

### Won't Have (This Iteration)

- Complex conflict resolution.

## Constraints

- **Technical**: Flutter/Dart implementation using local storage.
- **Configuration**: Batch size `N` and Ultra-res percentage `M` controlled by `.env`.

## Open Questions

1. **Storage**: Are there strict limits on how much space we can use for images? (Assumption: Mobile OS handles cache cleanup, but we should pin "Liked" item images).

## References

- Initial Prompt from User.

---

## Approval

- [ ] Reviewed by: Anton
- [ ] Approved on: 2026-01-30
- [ ] Notes: Approved via CLI.
