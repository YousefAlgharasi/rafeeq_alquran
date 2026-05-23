# Data Storage And Sync

## Storage Principles

The app is local-first.

All important user actions should be stored locally before any Firebase sync attempt.

## Local Storage

Use Drift / SQLite for structured local data, including:

- Quran content cache.
- Tafsir cache.
- Audio cache metadata.
- Daily ayah history.
- Reading progress.
- Daily goals.
- Streak records.
- Reflection notes.
- Favorites and bookmarks.
- Adhkar categories, items, and counters.
- Prayer times cache.
- Notification schedules.
- Sync queue and sync metadata.

Use SharedPreferences for small settings, such as:

- Selected language.
- Theme mode, if implemented.
- Lightweight preference flags.
- Simple notification toggles where database storage is not required.

## Guest Users

Guest users are local-only.

Guest data must not be written to Firestore.

## Logged-In Users

Logged-in users save locally first.

When online, local changes should sync to Firebase.

When offline, local changes should remain available and be queued for later sync.

When connectivity returns, pending changes should sync to Firebase.

## Firebase

Use Firebase Auth for optional login.

Use Cloud Firestore for synced user-owned data.

Use Firebase Cloud Functions only where needed, especially for server-side API credentials or sensitive proxy behavior.

## Sync Scope

Sync user-owned data such as:

- Profile and settings.
- Reading progress.
- Daily goals.
- Streaks.
- Reflection notes.
- Favorites and bookmarks.
- Adhkar progress.
- Prayer settings.
- Notification preferences.

Do not treat Quran text or tafsir as user-owned synced data. Quran and tafsir are approved source content and may be cached locally.

