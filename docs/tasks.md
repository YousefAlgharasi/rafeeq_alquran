# رفيق القرآن — Project Task Plan for Codex

## 0. Final Product Decisions

App name: **رفيق القرآن**

Platforms:
- Android first
- iOS later, but code should not block future iOS support

Languages:
- Arabic + English from the beginning

Core features from the beginning:
- Daily random ayah
- Tafsir Al-Muyassar, with UI prepared for three tafsir/meaning levels
- Quran reading and mushaf browsing
- Quran recitation audio
- Morning/evening/sleep/after-prayer/wake-up adhkar and selected duas
- Adhkar counters
- Prayer times
- Adhan notification at each prayer time using one short bundled adhan sound
- 10-minute pre-prayer notification
- Daily Quran reading reminders at fixed natural times
- Do **not** reduce Quran reminders even if the user ignores them for many days
- Daily reading goal
- Streak
- Reflection notes
- Favorites/bookmarks
- Share ayah as image
- Offline mode from the beginning
- Optional login from the beginning
- Firebase sync only when logged in
- Guest mode is local-only

Storage behavior:
- Guest user: all data is local-only.
- Logged-in user online: data is stored locally first, then synced to Firebase.
- Logged-in user offline: data stays local and pending sync until the device becomes online.
- When online returns: pending local changes are registered/synced to Firebase.

Architecture:

```text
lib/
  core/
    config/
    constants/
    database/
    errors/
    firebase/
    localization/
    network/
    notifications/
    responsive/
    routing/
    sync/
    theme/
    utils/
  features/
    feature_name/
      data/
        datasources/
        models/
        repository/
          repo_impl/
      logic/
        entity/
        repository/
        provider/
      ui/
        pages/
        widgets/
```

State management:
- Riverpod

Local database:
- Drift / SQLite

Small settings:
- SharedPreferences

Firebase:
- Firebase Auth
- Cloud Firestore
- Firebase Cloud Functions only where needed, especially if Quran Foundation credentials must stay server-side
- Firebase Analytics and Crashlytics can be added after core setup if time allows

Religious content rule:
- Do not generate Quran text, tafsir, adhkar, or religious rulings with AI.
- Quran/tafsir data must come from Quran Foundation/Quran.com or another verified source approved by the project owner.
- Adhkar must be local JSON from a trusted source, with source metadata.
- Any “ayah by mood/state” feature must use manually selected ayahs chosen by the project owner, not AI-generated selection.

---

# Task Format

Each task below contains:
- Task ID
- Task name
- Dependencies
- Description
- Technical requirements
- Expected result
- Files/folders to create or update
- Testing requirements
- Codex prompt

Every Codex prompt includes dependency checking and documentation reading instructions.

---

# T-00 — Create Project Documentation Foundation

## Dependencies
None.

## Description
Create the initial documentation files that explain the project, architecture, data rules, API choices, notification behavior, and task workflow. These docs are required so future Codex tasks can read the project context before changing code.

## Technical Requirements
Create a `docs/` folder with clear Markdown files:

```text
docs/
  project-overview.md
  app-features.md
  architecture.md
  api-sources.md
  religious-content-policy.md
  data-storage-and-sync.md
  notification-rules.md
  responsive-ui-rules.md
  tasks.md
  codex-workflow.md
```

The docs must explain:
- App name: رفيق القرآن
- Arabic + English support
- Android first, iOS later
- Feature-based Flutter architecture
- Local-first storage
- Optional login
- Firebase sync behavior
- Quran Foundation/Quran.com as preferred Quran source if access is free/approved
- AlAdhan as prayer times source
- Local JSON for adhkar
- No AI-generated Quran/tafsir/adhkar content
- Responsive UI requirements
- Notification rules, including no reduction of Quran reminders

## Expected Result
A complete documentation foundation exists and future Codex tasks can read it before implementation.

## Files/Folders
```text
docs/project-overview.md
docs/app-features.md
docs/architecture.md
docs/api-sources.md
docs/religious-content-policy.md
docs/data-storage-and-sync.md
docs/notification-rules.md
docs/responsive-ui-rules.md
docs/tasks.md
docs/codex-workflow.md
```

## Testing Requirements
No automated tests required. Verify docs are readable, consistent, and do not contradict each other.

## Codex Prompt
```text
You are working on a Flutter Islamic app called “رفيق القرآن”.

Before coding anything, create the documentation foundation for the project.

Create these files:
- docs/project-overview.md
- docs/app-features.md
- docs/architecture.md
- docs/api-sources.md
- docs/religious-content-policy.md
- docs/data-storage-and-sync.md
- docs/notification-rules.md
- docs/responsive-ui-rules.md
- docs/tasks.md
- docs/codex-workflow.md

Document these decisions:
- App name: رفيق القرآن
- Languages: Arabic + English from the beginning
- Platform: Android first, iOS later
- Flutter architecture: feature-based architecture
- State management: Riverpod
- Local database: Drift / SQLite
- Small settings: SharedPreferences
- Firebase from the beginning: Auth + Firestore; Cloud Functions only where needed
- Guest users are local-only
- Logged-in users save locally first, then sync to Firebase
- Logged-in offline users save locally and sync when online returns
- Quran source preference: Quran Foundation / Quran.com if access is free/approved
- Prayer times source: AlAdhan API
- Adhkar source: local JSON from trusted source with metadata
- Religious rule: never generate Quran text, tafsir, adhkar, or rulings with AI
- Daily Quran reminders must not be reduced even after many ignored days
- UI must be responsive for small phones, large phones, and tablets

Do not implement app code in this task. Only create clear docs.
```

---

# T-01 — Verify API Sources and Access Strategy

## Dependencies
T-00.

## Description
Verify the API strategy before building features that depend on external religious data. Quran Foundation/Quran.com is preferred, but it uses app credentials and may require backend token handling. Prayer times use AlAdhan.

## Technical Requirements
Update `docs/api-sources.md` with:
- Quran Foundation/Quran.com status
- Whether credentials are available
- Whether access is free/approved for this project
- Whether Cloud Functions/proxy is required
- AlAdhan API endpoints needed
- Fallback strategy if Quran Foundation access is not available

For Quran:
- Do not expose Quran Foundation client secret in Flutter.
- If Quran Foundation requires secret-based OAuth, use Firebase Cloud Functions or backend proxy.
- If credentials are missing, create only interfaces/mock datasources in later tasks, not production API calls.

For prayer times:
- Use AlAdhan calendar/month endpoint where possible to cache a month of prayer times.
- Support GPS and manual city/country input.
- Support calculation method and madhab settings.

## Expected Result
A written API decision exists before implementation. Codex must know whether to implement live Quran API, backend proxy, or mock interface.

## Files/Folders
```text
docs/api-sources.md
docs/religious-content-policy.md
```

## Testing Requirements
No automated tests. Manual verification through docs.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/api-sources.md
- docs/religious-content-policy.md
- docs/codex-workflow.md

Task: Verify and document API source strategy.

Check whether the previous task T-00 exists. If the docs folder or required docs are missing, stop and report the missing dependency.

Update docs/api-sources.md with a clear decision table for:
1. Quran text, surahs, ayahs, tafsir, and recitation audio.
2. Prayer times.
3. Adhkar.
4. Adhan audio.

Use these decisions:
- Preferred Quran source: Quran Foundation / Quran.com, only if access is free/approved and credentials are available.
- Quran Foundation credentials must never be exposed in Flutter/mobile code.
- If Quran Foundation requires client_secret, plan a Firebase Cloud Functions proxy.
- If credentials are not available yet, later implementation must use repository interfaces + mock/local sample data until credentials are provided.
- Prayer times source: AlAdhan API.
- Adhkar: local JSON from trusted source with source metadata.
- Adhan: bundled short local audio file.

Do not implement feature code in this task. Only update docs.
```

---

# T-02 — Bootstrap Flutter Project and Dependencies

## Dependencies
T-00, T-01.

## Description
Set up the Flutter project dependencies, analysis rules, asset folders, localization setup, and baseline app shell. This creates the technical foundation for every future feature.

## Technical Requirements
Add dependencies for:
- flutter_riverpod
- riverpod_annotation
- riverpod_generator
- build_runner
- go_router
- dio
- json_annotation
- json_serializable
- freezed_annotation
- freezed
- drift
- drift_flutter or sqlite packages required for Drift
- shared_preferences
- firebase_core
- firebase_auth
- cloud_firestore
- cloud_functions
- connectivity_plus
- flutter_local_notifications
- timezone
- permission_handler
- geolocator
- intl
- flutter_localizations
- path_provider
- share_plus or equivalent
- screenshot or image rendering package for sharing ayah image

Create asset folders:

```text
assets/
  audio/adhan/
  data/adhkar/
  data/quran_samples/
  fonts/
  images/
```

Configure `pubspec.yaml` for assets and localization.

## Expected Result
Flutter app builds with required dependencies and asset folders.

## Files/Folders
```text
pubspec.yaml
analysis_options.yaml
assets/audio/adhan/
assets/data/adhkar/
assets/data/quran_samples/
assets/fonts/
assets/images/
lib/main.dart
```

## Testing Requirements
Run:

```text
flutter pub get
flutter analyze
flutter test
```

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/architecture.md
- docs/api-sources.md
- docs/responsive-ui-rules.md
- docs/codex-workflow.md

Task: Bootstrap the Flutter project dependencies and asset folders.

Dependency check:
- Confirm T-00 docs exist.
- Confirm T-01 API source docs exist.
- If missing, stop and report the missing dependency.

Implement:
- Add required Flutter packages for Riverpod, routing, Dio, Drift/SQLite, Firebase, notifications, timezone, location, localization, connectivity, sharing, and code generation.
- Create asset folders:
  assets/audio/adhan/
  assets/data/adhkar/
  assets/data/quran_samples/
  assets/fonts/
  assets/images/
- Configure pubspec.yaml assets.
- Create or update analysis_options.yaml with useful Flutter/Riverpod lint rules if available.
- Keep app compilable.

Rules:
- Do not build feature UI yet.
- Do not add unverified Quran or tafsir data.
- UI-related base code must be ready for responsive design.

Run or document:
- flutter pub get
- flutter analyze
- flutter test
```

---

# T-03 — Core App Architecture Scaffold

## Dependencies
T-02.

## Description
Create the `core/` infrastructure and the feature-based folder conventions. This task prepares routing, theme, localization, networking, errors, database placeholders, notification placeholders, sync placeholders, and responsive helpers.

## Technical Requirements
Create:

```text
lib/core/
  config/
  constants/
  database/
  errors/
  firebase/
  localization/
  network/
  notifications/
  responsive/
  routing/
  sync/
  theme/
  utils/
```

Create feature placeholders:

```text
lib/features/auth/
lib/features/home/
lib/features/quran_content/
lib/features/daily_ayah/
lib/features/tafsir/
lib/features/prayer_times/
lib/features/adhan_notifications/
lib/features/adhkar/
lib/features/reading_tracker/
lib/features/daily_goal/
lib/features/streak/
lib/features/favorites/
lib/features/reflection_notes/
lib/features/share_ayah/
lib/features/settings/
```

Each feature should follow:

```text
data/datasources
data/models
data/repository/repo_impl
logic/entity
logic/repository
logic/provider
ui/pages
ui/widgets
```

## Expected Result
Clean architecture scaffold exists and compiles.

## Files/Folders
All core and feature folders.

## Testing Requirements
Run `flutter analyze`.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/architecture.md
- docs/codex-workflow.md

Task: Create the core architecture scaffold and feature-based folder structure.

Dependency check:
- Confirm T-02 is complete by checking pubspec.yaml and lib/main.dart exist and the app is compilable.
- If missing, stop and report missing dependency.

Create core folders:
- lib/core/config
- lib/core/constants
- lib/core/database
- lib/core/errors
- lib/core/firebase
- lib/core/localization
- lib/core/network
- lib/core/notifications
- lib/core/responsive
- lib/core/routing
- lib/core/sync
- lib/core/theme
- lib/core/utils

Create feature folders:
- auth
- home
- quran_content
- daily_ayah
- tafsir
- prayer_times
- adhan_notifications
- adhkar
- reading_tracker
- daily_goal
- streak
- favorites
- reflection_notes
- share_ayah
- settings

For every feature create:
- data/datasources
- data/models
- data/repository/repo_impl
- logic/entity
- logic/repository
- logic/provider
- ui/pages
- ui/widgets

Do not implement business logic yet. Keep code minimal and compilable.
Run flutter analyze.
```

---

# T-04 — Localization, Theme, Routing, and Responsive Shell

## Dependencies
T-03.

## Description
Build the base app shell with Arabic and English localization, responsive layout rules, app theme, and main navigation.

## Technical Requirements
Implement:
- Arabic and English localization
- RTL support for Arabic
- Theme setup
- GoRouter setup
- Main shell with bottom navigation for phones
- Navigation rail or adaptive layout for wider screens
- Placeholder pages for Home, Quran, Daily Ayah, Adhkar, Prayer Times, Favorites, Settings
- Responsive helpers using `LayoutBuilder`, breakpoints, and safe spacing

## Expected Result
The app opens to a responsive shell with localized navigation.

## Files/Folders
```text
lib/core/localization/
lib/core/routing/
lib/core/theme/
lib/core/responsive/
lib/features/home/ui/pages/
lib/features/settings/ui/pages/
```

## Testing Requirements
- Widget test for app shell loading.
- Manual test Arabic RTL and English LTR.
- Check small phone width and tablet width.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/architecture.md
- docs/responsive-ui-rules.md
- docs/codex-workflow.md

Task: Implement localization, theme, routing, and responsive app shell.

Dependency check:
- Confirm T-03 core and feature folder structure exists.
- If missing, stop and report missing dependency.

Implement:
- Arabic + English localization from the beginning.
- Arabic must use RTL.
- English must use LTR.
- App theme with clean Islamic-friendly design but no heavy visual complexity.
- GoRouter routes for Home, Quran, Daily Ayah, Adhkar, Prayer Times, Favorites, Settings.
- Responsive shell:
  - Bottom navigation on phones.
  - NavigationRail or adaptive layout on tablets/large screens.
- Placeholder pages only; do not implement feature logic yet.

Rules:
- All UI must be responsive.
- Avoid fixed widths that break small screens.
- Use scrollable layouts where needed.
- Keep text localized.

Add widget tests for app shell loading.
Run flutter analyze and flutter test.
```

---

# T-05 — Drift Local Database Schema

## Dependencies
T-03.

## Description
Design and implement the local SQLite database with Drift. This is the backbone of offline-first behavior.

## Technical Requirements
Create tables for:
- User profile cache
- Quran chapters cache
- Quran verses cache
- Tafsir cache
- Audio cache metadata
- Daily ayah history
- Reading progress
- Daily goals
- Streak records
- Reflection notes
- Favorites/bookmarks
- Adhkar categories
- Adhkar items
- Adhkar progress/counters
- Prayer times cache
- Notification schedules
- App settings
- Sync queue
- Sync metadata

Every user-owned table should support:
- local id
- optional Firebase id
- owner user id nullable for guest/local
- created_at
- updated_at
- deleted_at nullable for soft delete where needed
- sync_status where needed

## Expected Result
Local database layer exists and can be used by repositories.

## Files/Folders
```text
lib/core/database/
```

## Testing Requirements
- Unit tests for database open/create.
- Unit tests for inserting and reading sample records.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/architecture.md
- docs/data-storage-and-sync.md
- docs/codex-workflow.md

Task: Implement Drift local database schema for offline-first app behavior.

Dependency check:
- Confirm T-03 architecture scaffold exists.
- Confirm Drift dependencies from T-02 exist in pubspec.yaml.
- If missing, stop and report missing dependency.

Implement a Drift database in lib/core/database.

Create tables for:
- user profile cache
- quran chapters cache
- quran verses cache
- tafsir cache
- audio cache metadata
- daily ayah history
- reading progress
- daily goals
- streak records
- reflection notes
- favorites/bookmarks
- adhkar categories
- adhkar items
- adhkar progress/counters
- prayer times cache
- notification schedules
- app settings
- sync queue
- sync metadata

Rules:
- Local-first design.
- Guest data must work without Firebase.
- Logged-in offline data must be stored locally and later synced.
- Add timestamps.
- Add sync fields where needed.
- Use soft delete for user-owned syncable records where appropriate.

Add tests for database creation and simple insert/read.
Run code generation if needed.
Run flutter analyze and flutter test.
```

---

# T-06 — Firebase Setup and Optional Auth

## Dependencies
T-02, T-04, T-05.

## Description
Initialize Firebase and implement optional login. The app must work without login, but logged-in users can sync data.

## Technical Requirements
Implement:
- Firebase initialization
- Auth repository interface
- Firebase Auth datasource
- Guest session state
- Logged-in session state
- Login page
- Profile page
- Logout flow
- Riverpod auth provider

Authentication methods:
- Email/password from the beginning, or Google sign-in if already configured.
- Keep architecture ready for more providers later.

## Expected Result
The app supports guest mode and optional login.

## Files/Folders
```text
lib/core/firebase/
lib/features/auth/
lib/features/settings/ui/pages/profile_page.dart
```

## Testing Requirements
- Unit tests for auth state mapping if possible.
- Widget tests for guest/login UI.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/architecture.md
- docs/data-storage-and-sync.md
- docs/codex-workflow.md

Task: Set up Firebase initialization and optional authentication.

Dependency check:
- Confirm T-02 Firebase dependencies are installed.
- Confirm T-04 routing/shell exists.
- Confirm T-05 local database exists.
- If any dependency is missing, stop and report it.

Implement:
- Firebase initialization in core/firebase.
- Auth feature using the project feature-based architecture.
- Auth repository interface in logic/repository.
- Firebase auth datasource in data/datasources.
- Repository implementation in data/repository/repo_impl.
- Riverpod auth provider in logic/provider.
- Guest state support.
- Logged-in state support.
- Login page and profile/logout page.

Rules:
- Login is optional.
- App must be usable as guest.
- Guest data stays local-only.
- Logged-in data sync is implemented in a later task.
- UI must be responsive and localized Arabic/English.

Add tests where practical.
Run flutter analyze and flutter test.
```

---

# T-07 — Local-First Sync Engine

## Dependencies
T-05, T-06.

## Description
Build a generic sync engine that pushes local pending changes to Firestore when the user is logged in and online.

## Technical Requirements
Implement:
- Sync queue manager
- Connectivity listener
- Sync status enum
- Sync metadata
- Firestore sync datasource
- Conflict resolution policy
- Retry behavior

Rules:
- Guest mode: never sync.
- Logged-in online: write local first, enqueue, then sync.
- Logged-in offline: write local first, enqueue, wait for internet.
- On reconnect: process sync queue.
- Default conflict policy: last-write-wins using `updated_at`, except counters can use max/merge where appropriate.

## Expected Result
A reusable sync engine exists for later features.

## Files/Folders
```text
lib/core/sync/
lib/core/firebase/
lib/core/network/
```

## Testing Requirements
- Unit tests for queue state transitions.
- Unit tests for guest mode no-sync behavior.
- Unit tests for online/offline sync decisions.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/data-storage-and-sync.md
- docs/architecture.md
- docs/codex-workflow.md

Task: Implement the local-first sync engine.

Dependency check:
- Confirm T-05 Drift database exists with sync tables/fields.
- Confirm T-06 auth provider exists.
- If missing, stop and report missing dependency.

Implement core sync engine:
- SyncQueueManager
- SyncStatus enum
- SyncOperation model/entity
- Connectivity listener using connectivity_plus
- Firestore sync datasource abstraction
- Sync processor that runs when logged in and online
- Guest mode must never sync
- Logged-in offline mode must enqueue changes locally
- Logged-in online mode must save locally first, then sync to Firestore
- On reconnect, process pending queue

Conflict policy:
- Default last-write-wins using updated_at
- Allow feature-specific merge strategy later

Do not implement all feature sync adapters yet. Build the reusable engine.
Add unit tests for queue behavior and guest/logged-in decisions.
Run flutter analyze and flutter test.
```

---

# T-08 — Quran Foundation Backend Proxy / Cloud Function

## Dependencies
T-01, T-06.

## Description
Create a secure backend proxy for Quran Foundation/Quran.com Content APIs if credentials are available and approved. The mobile app must not hold Quran Foundation client secret.

## Technical Requirements
If Quran Foundation credentials are available:
- Create Firebase Cloud Functions or backend endpoint for Quran content.
- Store QF_CLIENT_ID, QF_CLIENT_SECRET, QF_ENV securely as environment variables/secrets.
- Implement OAuth2 client credentials token retrieval server-side.
- Cache token until expiry.
- Proxy endpoints needed by Flutter:
  - chapters
  - verses by chapter/page/juz
  - tafsir by ayah/resource
  - recitation audio metadata
  - search if needed later

If credentials are not available:
- Do not fake production access.
- Create backend structure and mock/sample endpoints only if needed.
- Document what is missing.

## Expected Result
Secure Quran API access layer exists, or a clear blocked report exists if credentials are missing.

## Files/Folders
Depending on backend choice:

```text
functions/
  src/
    quran/
```

or

```text
backend/
  src/
    quran/
```

## Testing Requirements
- Unit tests for token cache logic.
- Manual test endpoint if credentials exist.
- Confirm secrets are not committed.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/api-sources.md
- docs/religious-content-policy.md
- docs/codex-workflow.md

Task: Implement secure Quran Foundation backend proxy or prepare blocked/mocked structure if credentials are not available.

Dependency check:
- Confirm T-01 API source strategy exists.
- Confirm T-06 Firebase setup exists if using Firebase Cloud Functions.
- If missing, stop and report missing dependency.

Important rule:
- Never put Quran Foundation client_secret in Flutter/mobile code.

Implement one of these paths:

Path A — credentials available and approved:
- Create Firebase Cloud Functions or backend proxy for Quran Foundation Content APIs.
- Read QF_CLIENT_ID, QF_CLIENT_SECRET, and QF_ENV from secure environment/secrets.
- Implement server-side OAuth2 client credentials token retrieval.
- Cache access token until expiry.
- Add proxy endpoints for:
  - chapters
  - verses by chapter/page/juz
  - tafsir by ayah/resource
  - audio/recitation metadata
- Return only the data Flutter needs.

Path B — credentials not available:
- Do not implement fake production calls.
- Create interfaces and clearly document missing credentials in docs/api-sources.md.
- Use local sample JSON only for development previews if needed.

Add tests for token/cache logic if Path A is possible.
Ensure secrets are not committed.
```

---

# T-09 — Quran Content Feature: Chapters, Verses, Mushaf Reading

## Dependencies
T-05, T-08.

## Description
Implement Quran browsing and reading. It should use the backend proxy if available, and local cache/offline data after fetching.

## Technical Requirements
Implement:
- Quran entities: Chapter, Ayah/Verse, Page/Juz metadata if available
- Remote datasource through Quran proxy
- Local datasource through Drift
- Repository with cache-first behavior
- Riverpod providers
- Quran page/surah list
- Surah details page
- Last read position
- Offline display of cached content

UI:
- Arabic Quran text must be readable and respectful.
- Responsive layout.
- Arabic/English app UI.
- Avoid cramped ayah cards.

## Expected Result
User can open Quran, browse surahs, read verses, and continue from last read.

## Files/Folders
```text
lib/features/quran_content/
lib/features/reading_tracker/
```

## Testing Requirements
- Unit tests for repository cache-first behavior.
- Widget test for surah list page.
- Widget test for responsive Quran reading page.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/architecture.md
- docs/api-sources.md
- docs/religious-content-policy.md
- docs/responsive-ui-rules.md
- docs/codex-workflow.md

Task: Implement Quran content feature for chapters, verses, and mushaf reading.

Dependency check:
- Confirm T-05 Drift database exists.
- Confirm T-08 Quran backend proxy or mock/interface decision exists.
- If missing, stop and report missing dependency.

Implement feature-based Quran content:
- data/datasources: remote datasource through Quran proxy, local Drift datasource
- data/models: API/local models
- data/repository/repo_impl: cache-first repository implementation
- logic/entity: Chapter, Verse/Ayah, reading position entities
- logic/repository: repository abstraction
- logic/provider: Riverpod providers
- ui/pages and ui/widgets: Quran home, surah list, surah reading page

Behavior:
- Fetch Quran chapters/verses from approved source only.
- Cache fetched Quran content locally.
- Work offline for cached content.
- Save last read position.
- Do not generate Quran text.

UI rules:
- Responsive on small phones, large phones, tablets.
- Arabic Quran text must be readable.
- Support Arabic + English UI.
- Use scrollable layouts and avoid fixed widths.

Add unit and widget tests.
Run flutter analyze and flutter test.
```

---

# T-10 — Tafsir Feature with Three-Level UI Support

## Dependencies
T-08, T-09.

## Description
Implement tafsir viewing for ayahs. The selected tafsir is **التفسير الميسر**. UI should support three levels, but every level must be backed by verified data. Do not generate simplified tafsir with AI.

## Technical Requirements
Implement:
- Tafsir entity
- Tafsir resource mapper
- Tafsir remote datasource through Quran proxy
- Local tafsir cache in Drift
- Tafsir repository
- Riverpod providers
- Tafsir UI component under daily ayah and Quran reading pages

Three-level UI:
- Level 1: مختصر / short meaning — only if verified source exists or manually curated data exists
- Level 2: التفسير الميسر — primary tafsir
- Level 3: تفسير كامل — only if verified source exists and project owner approves it

If only Tafsir Al-Muyassar is available, show only available verified level and keep disabled/coming-soon states for unavailable verified levels.

## Expected Result
User can read verified tafsir for an ayah, with architecture ready for three levels.

## Files/Folders
```text
lib/features/tafsir/
```

## Testing Requirements
- Unit tests for tafsir repository cache behavior.
- Widget tests for available/disabled tafsir levels.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/api-sources.md
- docs/religious-content-policy.md
- docs/architecture.md
- docs/responsive-ui-rules.md
- docs/codex-workflow.md

Task: Implement Tafsir feature with verified data only.

Dependency check:
- Confirm T-08 Quran backend proxy/interface exists.
- Confirm T-09 Quran content feature exists.
- If missing, stop and report missing dependency.

Implement Tafsir feature:
- data/datasources: remote tafsir datasource through Quran proxy, local Drift datasource
- data/models
- data/repository/repo_impl
- logic/entity
- logic/repository
- logic/provider
- ui/widgets and pages as needed

Tafsir decision:
- Primary tafsir: التفسير الميسر.
- UI must support three levels:
  1. مختصر / short meaning
  2. التفسير الميسر
  3. تفسير كامل

Important religious rule:
- Do not generate or rewrite tafsir with AI.
- Do not create fake short/simple/full tafsir levels.
- Every visible tafsir/meaning level must come from a verified source or manually curated approved local data.
- If only Tafsir Al-Muyassar is available, show that level and mark other levels unavailable/coming soon.

Add caching.
Add tests for repository behavior and UI available/unavailable levels.
Run flutter analyze and flutter test.
```

---

# T-11 — Quran Recitation Audio Feature

## Dependencies
T-08, T-09.

## Description
Add audio playback for ayahs using approved Quran Foundation/Quran.com recitation metadata if available.

## Technical Requirements
Implement:
- Reciter entity
- Ayah audio entity
- Audio datasource through Quran proxy
- Audio metadata cache
- Audio player service
- Play/pause controls in Quran reading and daily ayah
- Offline metadata cache; actual audio file caching optional but architecture-ready

## Expected Result
User can listen to the current ayah.

## Files/Folders
```text
lib/features/quran_content/
lib/core/audio/ or lib/core/utils/audio/
```

## Testing Requirements
- Unit tests for audio metadata mapping.
- Widget test for play button states.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/api-sources.md
- docs/religious-content-policy.md
- docs/architecture.md
- docs/responsive-ui-rules.md
- docs/codex-workflow.md

Task: Add Quran recitation audio support.

Dependency check:
- Confirm T-08 Quran proxy/interface exists.
- Confirm T-09 Quran content feature exists.
- If missing, stop and report missing dependency.

Implement:
- Reciter entity and model.
- Ayah audio metadata entity/model.
- Remote datasource through Quran proxy if available.
- Local metadata cache using Drift.
- Audio playback service.
- Play/pause UI in Quran reading and daily ayah widgets.

Rules:
- Use only approved Quran recitation audio metadata/source.
- Do not hardcode random unverified audio URLs.
- UI must be responsive and localized.
- Offline actual audio caching can be prepared but not required unless simple.

Add tests for metadata mapping and UI button state.
Run flutter analyze and flutter test.
```

---

# T-12 — Daily Random Ayah Feature

## Dependencies
T-09, T-10, T-11, T-05.

## Description
Implement daily random ayah selection with tafsir, audio, read status, and local history. The ayah changes daily, not every 5 hours.

## Technical Requirements
Implement:
- Daily ayah entity
- Daily ayah repository
- Random ayah selector
- Stable daily seed by date
- Avoid repeating recent ayahs when possible
- Fetch/cache ayah + tafsir + audio metadata
- Mark as read
- Daily history
- Home card and full daily ayah page

Rules:
- Use approved Quran source only.
- Do not use AI to choose religious meaning.
- The daily ayah is random, but can exclude ayahs if metadata marks them as requiring special context later.

## Expected Result
Every day the app shows a different random ayah with tafsir, audio, read button, favorite button, reflection entry, and share button.

## Files/Folders
```text
lib/features/daily_ayah/
```

## Testing Requirements
- Unit test daily seed selection.
- Unit test no same ayah in same day.
- Widget test daily ayah card.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/api-sources.md
- docs/religious-content-policy.md
- docs/notification-rules.md
- docs/architecture.md
- docs/responsive-ui-rules.md
- docs/codex-workflow.md

Task: Implement Daily Random Ayah feature.

Dependency check:
- Confirm T-09 Quran content exists.
- Confirm T-10 tafsir exists.
- Confirm T-11 audio exists or audio interface exists.
- Confirm T-05 database exists.
- If missing, stop and report missing dependency.

Implement:
- DailyAyah entity/model.
- DailyAyah repository abstraction and implementation.
- Local datasource for daily ayah history.
- Random daily ayah selector with stable date-based behavior.
- Avoid repeating recent ayahs when possible.
- Fetch/cache ayah text, tafsir, and audio metadata from approved source.
- Mark daily ayah as read.
- Daily ayah card on Home.
- Daily ayah full page.

Rules:
- The app shows one daily ayah per day.
- Do not generate Quran text or tafsir.
- UI must support Arabic + English and be responsive.

Add unit and widget tests.
Run flutter analyze and flutter test.
```

---

# T-13 — Reading Tracker, Daily Goals, and Streak

## Dependencies
T-05, T-09, T-12.

## Description
Track Quran reading activity, daily goal progress, and streaks from the beginning.

## Technical Requirements
Implement:
- Daily goal types:
  - one ayah/day
  - five ayahs/day
  - one page/day
  - ten minutes/day
- Reading session tracking
- Mark ayah/page read
- Daily completion status
- Streak calculation
- Missed-day tracking
- Goal settings UI
- Progress card on Home

## Expected Result
User can choose a daily goal and see progress/streak.

## Files/Folders
```text
lib/features/reading_tracker/
lib/features/daily_goal/
lib/features/streak/
```

## Testing Requirements
- Unit tests for goal completion logic.
- Unit tests for streak calculation.
- Widget tests for progress card.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/data-storage-and-sync.md
- docs/architecture.md
- docs/responsive-ui-rules.md
- docs/codex-workflow.md

Task: Implement reading tracker, daily goals, and streak.

Dependency check:
- Confirm T-05 local database exists.
- Confirm T-09 Quran content exists.
- Confirm T-12 daily ayah exists.
- If missing, stop and report missing dependency.

Implement:
- Reading tracker feature.
- Daily goal feature.
- Streak feature.
- Goal types:
  1. one ayah per day
  2. five ayahs per day
  3. one page per day
  4. ten minutes per day
- Track reading sessions.
- Track daily completion.
- Calculate streak.
- Track missed days.
- Add goal settings UI.
- Add progress/streak card to Home.

Rules:
- Guest data local-only.
- Logged-in data must be sync-ready through the sync engine.
- UI must be responsive and localized.

Add tests for goal completion and streak calculation.
Run flutter analyze and flutter test.
```

---

# T-14 — Daily Quran Reminder Notifications

## Dependencies
T-12, T-13, T-04.

## Description
Implement Quran reading reminders at fixed natural times. The app must not reduce reminders even if the user ignores them for many days.

## Technical Requirements
Default reminder times:
- After Fajr by configurable offset
- Midday configurable time
- After Asr by configurable offset
- Before sleep configurable time

Behavior:
- If user has completed daily goal, do not send more Quran reminders that day.
- If user has not completed daily goal, send reminders at configured times.
- Do not reduce reminder frequency after 3 ignored days.
- Allow user to enable/disable Quran reminders in settings.
- Use local notifications.

## Expected Result
Quran reminders are scheduled daily and respect completion status, but never auto-reduce due to ignoring.

## Files/Folders
```text
lib/core/notifications/
lib/features/daily_ayah/
lib/features/reading_tracker/
lib/features/settings/
```

## Testing Requirements
- Unit tests for reminder decision logic.
- Tests must confirm reminders are not reduced after ignored days.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/notification-rules.md
- docs/data-storage-and-sync.md
- docs/architecture.md
- docs/codex-workflow.md

Task: Implement daily Quran reminder notifications.

Dependency check:
- Confirm T-12 Daily Ayah feature exists.
- Confirm T-13 reading tracker/daily goal exists.
- Confirm T-04 localization/shell exists.
- If missing, stop and report missing dependency.

Implement:
- Local notification service for Quran reminders.
- Reminder scheduler.
- Reminder decision logic.
- Settings for enabling/disabling Quran reminders.
- Default reminder slots:
  - after Fajr offset
  - midday fixed time
  - after Asr offset
  - before sleep fixed time

Rules:
- If daily goal is completed, do not send more Quran reminders that day.
- If not completed, send reminders at configured times.
- Do NOT reduce reminders after 3 ignored days.
- Do NOT implement any behavior that reduces reminders based on ignored days.
- Notifications must be localized Arabic/English.

Add unit tests that prove reminder frequency does not decrease after ignored days.
Run flutter analyze and flutter test.
```

---

# T-15 — Adhkar Local JSON Data Model and Importer

## Dependencies
T-05, T-01.

## Description
Create the local adhkar data structure from trusted sources. All adhkar are stored as local JSON with metadata and imported into Drift.

## Technical Requirements
Categories from the beginning:
- Morning adhkar
- Evening adhkar
- Sleep adhkar
- After-prayer adhkar
- Wake-up adhkar
- Selected duas

Each adhkar item must include:
- id
- category
- Arabic text
- English translation if available
- transliteration optional
- repeat count
- source/reference
- source authenticity/metadata if available
- order

## Expected Result
Trusted adhkar data structure exists and can be loaded offline.

## Files/Folders
```text
assets/data/adhkar/adhkar_ar_en.json
lib/features/adhkar/data/
```

## Testing Requirements
- JSON parsing test.
- Validation test ensuring every item has source/reference and repeat count.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/api-sources.md
- docs/religious-content-policy.md
- docs/architecture.md
- docs/codex-workflow.md

Task: Create adhkar local JSON structure and importer.

Dependency check:
- Confirm T-05 local database exists.
- Confirm T-01 API/source strategy exists.
- If missing, stop and report missing dependency.

Implement:
- assets/data/adhkar/adhkar_ar_en.json structure.
- Adhkar models/entities.
- JSON parser/importer.
- Drift local datasource for adhkar categories/items.

Categories from the beginning:
- Morning adhkar
- Evening adhkar
- Sleep adhkar
- After-prayer adhkar
- Wake-up adhkar
- Selected duas

Important religious rule:
- Do not invent adhkar.
- Do not generate adhkar with AI.
- If real trusted content is not available yet, create a clearly marked sample file with placeholder/sample structure only and document that real reviewed content must be added.
- Every real adhkar item must include source/reference and repeat count.

Add tests for JSON parsing and validation.
Run flutter analyze and flutter test.
```

---

# T-16 — Adhkar UI and Counters

## Dependencies
T-15.

## Description
Build the adhkar screens with category navigation and counters.

## Technical Requirements
Implement:
- Adhkar categories page
- Adhkar list page
- Counter per adhkar item
- Reset daily behavior for morning/evening items
- Progress per category
- “Completed” state
- Local storage of progress
- Sync-ready progress records

## Expected Result
User can read adhkar and track repetitions like 0/3, 0/7, 0/100.

## Files/Folders
```text
lib/features/adhkar/
```

## Testing Requirements
- Unit tests for counter increment/reset.
- Widget tests for adhkar item counter.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/architecture.md
- docs/religious-content-policy.md
- docs/data-storage-and-sync.md
- docs/responsive-ui-rules.md
- docs/codex-workflow.md

Task: Implement Adhkar UI and counters.

Dependency check:
- Confirm T-15 adhkar JSON model/importer exists.
- If missing, stop and report missing dependency.

Implement:
- Adhkar category page.
- Adhkar list page.
- Adhkar item widget with counter.
- Repeat count display: 0 / required_count.
- Category progress.
- Completed state.
- Daily reset behavior for relevant categories.
- Local progress storage.
- Sync-ready progress records.

Rules:
- Do not modify religious text content in code.
- UI must be responsive and localized Arabic/English.
- Counters must be easy to tap on small phones.

Add tests for counter logic and widget behavior.
Run flutter analyze and flutter test.
```

---

# T-17 — Prayer Times Feature with GPS and Manual City

## Dependencies
T-05, T-04.

## Description
Implement prayer times using AlAdhan, with GPS and manual city/country input.

## Technical Requirements
Implement:
- PrayerTime entity
- PrayerSettings entity
- Remote datasource for AlAdhan
- Local cache for current day/month
- Repository
- Riverpod providers
- Location permission flow
- Manual city/country settings
- Calculation method setting
- Madhab setting for Asr
- Prayer Times page
- Next prayer countdown
- Hijri date display if available

## Expected Result
User can see today’s prayer times and next prayer countdown.

## Files/Folders
```text
lib/features/prayer_times/
```

## Testing Requirements
- Unit tests for next prayer calculation.
- Unit tests for API model parsing.
- Widget test for prayer times page.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/api-sources.md
- docs/architecture.md
- docs/responsive-ui-rules.md
- docs/codex-workflow.md

Task: Implement Prayer Times feature using AlAdhan.

Dependency check:
- Confirm T-05 local database exists.
- Confirm T-04 localization/routing/shell exists.
- If missing, stop and report missing dependency.

Implement:
- PrayerTime entity/model.
- PrayerSettings entity/model.
- AlAdhan remote datasource.
- Drift local datasource/cache.
- Repository abstraction and implementation.
- Riverpod providers.
- GPS location flow using geolocator.
- Manual city/country fallback.
- Calculation method setting.
- Madhab setting for Asr.
- Prayer times page.
- Next prayer countdown card.
- Hijri date display if provided by API.

Rules:
- Use AlAdhan only for prayer times unless docs/api-sources.md is changed.
- Cache prayer times for offline use.
- UI must be responsive and localized.

Add tests for next prayer calculation and API model parsing.
Run flutter analyze and flutter test.
```

---

# T-18 — Adhan and Pre-Prayer Notifications

## Dependencies
T-17, T-04.

## Description
Schedule adhan notifications for each prayer time and a notification 10 minutes before each prayer.

## Technical Requirements
Adhan notifications:
- Fajr
- Dhuhr
- Asr
- Maghrib
- Isha

No adhan for sunrise.

Pre-prayer notifications:
- 10 minutes before each prayer
- Notification only, no adhan sound required

Adhan audio:
- One bundled short adhan sound from the beginning
- Sound should be short enough for notification use
- Android notification channel configured for adhan sound
- Future-ready for multiple muezzins

Settings:
- Enable/disable adhan per prayer
- Enable/disable pre-prayer notifications
- Enable/disable vibration

## Expected Result
The app schedules adhan at prayer times and a pre-prayer notification 10 minutes before.

## Files/Folders
```text
lib/features/adhan_notifications/
lib/core/notifications/
assets/audio/adhan/
```

## Testing Requirements
- Unit tests for schedule generation.
- Verify sunrise has no adhan.
- Verify pre-prayer is exactly 10 minutes before.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/notification-rules.md
- docs/architecture.md
- docs/responsive-ui-rules.md
- docs/codex-workflow.md

Task: Implement adhan and 10-minute pre-prayer notifications.

Dependency check:
- Confirm T-17 prayer times feature exists.
- Confirm T-04 localization/shell exists.
- Confirm flutter_local_notifications dependency exists.
- If missing, stop and report missing dependency.

Implement:
- Adhan notification scheduler.
- Pre-prayer notification scheduler.
- Android notification channel for adhan sound.
- One bundled short adhan sound support.
- Settings for enabling/disabling adhan per prayer.
- Settings for enabling/disabling pre-prayer notifications.
- Vibration setting.

Rules:
- Schedule adhan for Fajr, Dhuhr, Asr, Maghrib, Isha.
- Do not schedule adhan for sunrise.
- Schedule pre-prayer notification 10 minutes before each prayer.
- Use local notification scheduling.
- UI must be responsive and localized.

Add tests:
- schedule includes 5 adhan notifications.
- sunrise has no adhan.
- pre-prayer notification time = prayer time minus 10 minutes.
Run flutter analyze and flutter test.
```

---

# T-19 — Favorites and Bookmarks

## Dependencies
T-05, T-09, T-10, T-12.

## Description
Allow users to save favorite ayahs, tafsir entries, adhkar, and reading bookmarks.

## Technical Requirements
Implement:
- Favorite entity
- Bookmark entity
- Local datasource
- Sync-ready records
- Favorite buttons in Quran reading, daily ayah, tafsir, adhkar
- Favorites page
- Filter by type

## Expected Result
User can save and view favorites/bookmarks offline.

## Files/Folders
```text
lib/features/favorites/
```

## Testing Requirements
- Unit tests for add/remove favorite.
- Widget test for favorites page.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/data-storage-and-sync.md
- docs/architecture.md
- docs/responsive-ui-rules.md
- docs/codex-workflow.md

Task: Implement favorites and bookmarks.

Dependency check:
- Confirm T-05 database exists.
- Confirm T-09 Quran content exists.
- Confirm T-10 tafsir exists.
- Confirm T-12 daily ayah exists.
- If missing, stop and report missing dependency.

Implement:
- Favorite entity/model.
- Bookmark entity/model.
- Local datasource.
- Repository and Riverpod providers.
- Favorite button widgets.
- Favorites page with filters by type.
- Reading bookmark support.

Favorite types:
- ayah
- tafsir
- adhkar
- reflection note if applicable

Rules:
- Guest data local-only.
- Logged-in data sync-ready.
- UI must be responsive and localized.

Add unit and widget tests.
Run flutter analyze and flutter test.
```

---

# T-20 — Reflection Notes

## Dependencies
T-05, T-12, T-07.

## Description
Allow users to write personal reflection notes for daily ayah or any Quran ayah.

## Technical Requirements
Implement:
- ReflectionNote entity
- Local datasource
- Repository
- Riverpod providers
- Add/edit/delete note UI
- Reflection prompt localized:
  - Arabic: ماذا تعلمت من هذه الآية؟
  - English: What did you learn from this ayah?
- Sync-ready behavior

## Expected Result
User can write and save reflection notes offline.

## Files/Folders
```text
lib/features/reflection_notes/
```

## Testing Requirements
- Unit tests for CRUD behavior.
- Widget test for note editor.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/data-storage-and-sync.md
- docs/architecture.md
- docs/responsive-ui-rules.md
- docs/codex-workflow.md

Task: Implement reflection notes.

Dependency check:
- Confirm T-05 local database exists.
- Confirm T-12 daily ayah exists.
- Confirm T-07 sync engine exists.
- If missing, stop and report missing dependency.

Implement:
- ReflectionNote entity/model.
- Local datasource.
- Repository and Riverpod providers.
- Add/edit/delete note UI.
- Link notes to daily ayah or Quran ayah.
- Local-first saving.
- Sync-ready records for logged-in users.

Localized prompt:
- Arabic: ماذا تعلمت من هذه الآية؟
- English: What did you learn from this ayah?

Rules:
- Notes are user-generated, not tafsir.
- Do not present user notes as religious explanation.
- UI must be responsive and localized.

Add unit and widget tests.
Run flutter analyze and flutter test.
```

---

# T-21 — Share Ayah as Image

## Dependencies
T-12, T-10.

## Description
Allow user to share daily ayah or selected ayah as an image.

## Technical Requirements
Implement:
- Share image card widget
- Render ayah text, surah name, ayah number
- Optional short tafsir line only if verified and safe for layout
- Arabic-friendly typography
- Share action using share package
- Save/share generated image

## Expected Result
User can share an ayah as a clean image from the daily ayah page.

## Files/Folders
```text
lib/features/share_ayah/
```

## Testing Requirements
- Widget test for image card rendering.
- Unit test for share payload preparation where possible.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/religious-content-policy.md
- docs/architecture.md
- docs/responsive-ui-rules.md
- docs/codex-workflow.md

Task: Implement share ayah as image.

Dependency check:
- Confirm T-12 daily ayah exists.
- Confirm T-10 tafsir exists or tafsir interface exists.
- If missing, stop and report missing dependency.

Implement:
- Share ayah image feature.
- Image/card widget with ayah text, surah name, and ayah number.
- Optional tafsir snippet only if it comes from verified tafsir data.
- Generate image from widget.
- Share image using share package.

Rules:
- Do not alter Quran text.
- Do not generate religious text.
- Use Arabic-friendly typography.
- Make layout responsive and avoid clipped Quran text.

Add widget tests where practical.
Run flutter analyze and flutter test.
```

---

# T-22 — Settings Feature

## Dependencies
T-04, T-06, T-14, T-17, T-18.

## Description
Build a full settings area for language, account, notifications, prayer settings, adhan settings, daily goal, and sync status.

## Technical Requirements
Settings include:
- Language Arabic/English
- Theme mode if implemented
- Account/profile/login/logout
- Quran reminder toggles and times
- Prayer location mode: GPS/manual
- City/country manual entry
- Calculation method
- Madhab
- Adhan per prayer toggles
- Pre-prayer notification toggle
- Vibration toggle
- Daily goal selection
- Sync status for logged-in users

## Expected Result
User can configure app behavior from settings.

## Files/Folders
```text
lib/features/settings/
```

## Testing Requirements
- Widget tests for settings page sections.
- Unit tests for settings persistence.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/notification-rules.md
- docs/data-storage-and-sync.md
- docs/architecture.md
- docs/responsive-ui-rules.md
- docs/codex-workflow.md

Task: Implement Settings feature.

Dependency check:
- Confirm T-04 localization/shell exists.
- Confirm T-06 auth exists.
- Confirm T-14 Quran reminder logic exists.
- Confirm T-17 prayer times exists.
- Confirm T-18 adhan notifications exists.
- If missing, stop and report missing dependency.

Implement settings sections:
- Language: Arabic/English.
- Account: guest/profile/login/logout.
- Quran reminders: enable/disable and reminder time slots.
- Prayer location: GPS/manual.
- Manual city/country.
- Calculation method.
- Madhab.
- Adhan toggles per prayer.
- Pre-prayer notification toggle.
- Vibration toggle.
- Daily goal selection.
- Sync status if logged in.

Rules:
- Persist small settings in SharedPreferences or local database as appropriate.
- UI must be responsive and localized.
- Do not hide important notification settings.

Add tests for settings persistence and page rendering.
Run flutter analyze and flutter test.
```

---

# T-23 — Home Dashboard Integration

## Dependencies
T-12, T-13, T-16, T-17, T-18, T-19, T-20.

## Description
Build the final home dashboard that brings together prayer time, daily ayah, reading goal, streak, adhkar shortcuts, and reminders status.

## Technical Requirements
Home should display:
- Next prayer and countdown
- Today’s prayer times quick view
- Daily ayah card
- Read/complete button
- Tafsir/audio/share/favorite quick actions
- Daily goal progress
- Streak
- Adhkar shortcuts
- Sync/offline indicator if useful

## Expected Result
Home page feels like the main “daily companion” screen.

## Files/Folders
```text
lib/features/home/
```

## Testing Requirements
- Widget tests for home loading state, loaded state, offline/cache state.
- Responsive test with small and wide layouts.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/app-features.md
- docs/architecture.md
- docs/responsive-ui-rules.md
- docs/codex-workflow.md

Task: Integrate Home dashboard.

Dependency check:
- Confirm T-12 daily ayah exists.
- Confirm T-13 reading goal/streak exists.
- Confirm T-16 adhkar UI exists.
- Confirm T-17 prayer times exists.
- Confirm T-18 notifications exist.
- Confirm T-19 favorites exists.
- Confirm T-20 reflection notes exists.
- If missing, stop and report missing dependency.

Implement Home dashboard with:
- Next prayer countdown.
- Today prayer times summary.
- Daily ayah card.
- Read/complete action.
- Tafsir, audio, share, favorite quick actions.
- Daily goal progress.
- Streak.
- Adhkar shortcuts.
- Optional sync/offline indicator.

Rules:
- Home must be clean, not crowded.
- UI must be responsive for small phones and tablets.
- Arabic and English localized text.

Add widget tests for loading, loaded, and offline/cache states.
Run flutter analyze and flutter test.
```

---

# T-24 — Firestore Feature Sync Adapters

## Dependencies
T-07, T-13, T-16, T-19, T-20, T-22.

## Description
Connect user-owned features to the sync engine so logged-in users sync data to Firebase.

## Technical Requirements
Sync these user-owned records:
- Profile/settings
- Reading progress
- Daily goals
- Streak records
- Reflection notes
- Favorites/bookmarks
- Adhkar progress
- Notification preferences
- Prayer settings

Do not sync Quran text/tafsir as user data unless needed for cache. Quran content should be fetched from approved source and cached locally.

## Expected Result
Logged-in users can sync their personal data to Firebase. Guest users remain local-only.

## Files/Folders
```text
lib/core/sync/
lib/features/*/data/datasources/firebase_*.dart
```

## Testing Requirements
- Unit tests for guest no-sync behavior.
- Unit tests for logged-in queue creation.
- Unit tests for conflict merge behavior.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/data-storage-and-sync.md
- docs/architecture.md
- docs/codex-workflow.md

Task: Implement Firestore sync adapters for user-owned data.

Dependency check:
- Confirm T-07 sync engine exists.
- Confirm T-13 reading goal/streak exists.
- Confirm T-16 adhkar progress exists.
- Confirm T-19 favorites/bookmarks exists.
- Confirm T-20 reflection notes exists.
- Confirm T-22 settings exists.
- If missing, stop and report missing dependency.

Implement Firestore sync adapters for:
- profile/settings
- reading progress
- daily goals
- streak records
- reflection notes
- favorites/bookmarks
- adhkar progress
- notification preferences
- prayer settings

Rules:
- Guest users must never sync.
- Logged-in users save locally first.
- Logged-in offline users enqueue changes.
- On reconnect, sync pending changes.
- Do not sync Quran text/tafsir as user-owned data.
- Do not expose secrets.

Add tests for guest no-sync, logged-in queue creation, and conflict behavior.
Run flutter analyze and flutter test.
```

---

# T-25 — Offline Mode Completion

## Dependencies
T-05, T-09, T-12, T-15, T-17, T-24.

## Description
Ensure the app is meaningfully usable offline from the beginning.

## Technical Requirements
Offline support:
- Quran cached content can be read offline
- Daily ayah remains visible offline if cached
- Tafsir remains visible offline if cached
- Adhkar fully offline from local JSON
- Prayer times use cached current/month data
- Favorites, notes, goals, streaks work offline
- Logged-in offline changes sync later
- Clear offline indicator when needed

## Expected Result
The app does not feel broken offline.

## Files/Folders
Multiple features.

## Testing Requirements
- Integration-style tests with fake offline datasource.
- Unit tests for repository fallback behavior.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/data-storage-and-sync.md
- docs/api-sources.md
- docs/architecture.md
- docs/codex-workflow.md

Task: Complete offline mode behavior across the app.

Dependency check:
- Confirm T-05 database exists.
- Confirm T-09 Quran content exists.
- Confirm T-12 daily ayah exists.
- Confirm T-15 adhkar local JSON/importer exists.
- Confirm T-17 prayer times cache exists.
- Confirm T-24 sync adapters exist.
- If missing, stop and report missing dependency.

Implement or fix offline behavior:
- Quran cached content readable offline.
- Daily ayah visible offline if cached.
- Tafsir visible offline if cached.
- Adhkar fully offline.
- Prayer times use cached data when offline.
- Favorites, notes, goals, and streaks work offline.
- Logged-in offline changes sync later.
- Add clear but non-annoying offline indicator where needed.

Add tests for repository fallback and offline states.
Run flutter analyze and flutter test.
```

---

# T-26 — Ayah by State / Mood, Manual Curation Only

## Dependencies
T-09, T-10, T-12.

## Description
Add the later feature “ayah suitable for your state,” but only with manually selected ayahs chosen by the project owner. This task can create structure now, but real mappings must be manually reviewed.

## Technical Requirements
States:
- قلق / anxious
- حزين / sad
- توبة / repentance
- صبر / patience
- رزق / rizq
- شكر / gratitude
- طمأنينة / peace

Data structure:
- state id
- Arabic label
- English label
- list of ayah references
- note explaining that these ayahs are manually curated
- source/reviewer metadata

## Expected Result
Architecture and UI can support mood/state ayah later, but no unreviewed AI-generated mapping is used.

## Files/Folders
```text
lib/features/daily_ayah/
assets/data/quran_samples/ayah_states.json
```

## Testing Requirements
- Validation test that every state mapping has ayah references and reviewer/source metadata.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/religious-content-policy.md
- docs/api-sources.md
- docs/architecture.md
- docs/codex-workflow.md

Task: Prepare Ayah by State/Mood feature using manual curation only.

Dependency check:
- Confirm T-09 Quran content exists.
- Confirm T-10 tafsir exists.
- Confirm T-12 daily ayah exists.
- If missing, stop and report missing dependency.

Implement structure for states:
- anxious / قلق
- sad / حزين
- repentance / توبة
- patience / صبر
- rizq / رزق
- gratitude / شكر
- peace / طمأنينة

Important rule:
- Do not use AI to select ayahs.
- Do not create real ayah mappings unless the project owner manually provides them.
- You may create a placeholder JSON schema with empty arrays and reviewer/source fields.
- The app should hide this feature or mark it coming soon until mappings are reviewed.

Add validation tests for mapping schema.
Run flutter analyze and flutter test.
```

---

# T-27 — Notification Permission and Reliability Hardening

## Dependencies
T-14, T-18.

## Description
Improve notification reliability on Android by handling permissions, exact alarm needs, battery optimization guidance, and rescheduling after app updates/device restart where possible.

## Technical Requirements
Implement:
- Notification permission request flow
- Android 13+ notification permission support
- Exact alarm handling if needed
- Timezone initialization
- Reschedule notifications after settings change
- Reschedule after prayer times refresh
- Safe fallback if permissions denied
- User-facing guidance page if notifications are disabled

## Expected Result
Notifications are more reliable and failures are understandable to the user.

## Files/Folders
```text
lib/core/notifications/
lib/features/settings/
```

## Testing Requirements
- Unit tests for scheduling refresh triggers.
- Manual Android notification test checklist.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/notification-rules.md
- docs/architecture.md
- docs/codex-workflow.md

Task: Harden notification permissions and scheduling reliability.

Dependency check:
- Confirm T-14 Quran reminders exist.
- Confirm T-18 adhan/pre-prayer notifications exist.
- If missing, stop and report missing dependency.

Implement:
- Notification permission flow.
- Android 13+ notification permission handling.
- Timezone initialization.
- Reschedule notifications when settings change.
- Reschedule adhan when prayer times refresh.
- Safe fallback if permissions are denied.
- User guidance screen/section when notifications are disabled.

Rules:
- Do not reduce Quran reminders after ignored days.
- Keep all notification labels localized Arabic/English.
- Keep UI responsive.

Add tests for scheduling refresh triggers and create a manual Android notification checklist in docs/notification-rules.md.
Run flutter analyze and flutter test.
```

---

# T-28 — Responsive UI QA Pass

## Dependencies
T-04, T-23.

## Description
Perform a full responsive UI pass across all screens.

## Technical Requirements
Check:
- Small phones
- Large phones
- Tablets
- Portrait
- Landscape where practical
- Arabic RTL
- English LTR
- Text scaling
- Quran text readability
- Large adhkar counters
- Prayer cards not overflowing

## Expected Result
App UI is usable across common Android sizes.

## Files/Folders
Multiple UI files and `docs/responsive-ui-rules.md`.

## Testing Requirements
- Widget/layout tests where practical.
- Manual QA checklist in docs.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/responsive-ui-rules.md
- docs/architecture.md
- docs/codex-workflow.md

Task: Perform responsive UI QA pass across the app.

Dependency check:
- Confirm T-04 responsive app shell exists.
- Confirm T-23 home dashboard integration exists.
- If missing, stop and report missing dependency.

Review and improve all major UI screens:
- Home
- Quran
- Daily Ayah
- Tafsir
- Adhkar
- Prayer Times
- Favorites
- Notes
- Settings
- Auth/Profile

Check:
- small phone layout
- large phone layout
- tablet/wide layout
- Arabic RTL
- English LTR
- text scaling
- scroll behavior
- no overflow errors
- Quran text readability
- large tap targets for counters and notification settings

Update docs/responsive-ui-rules.md with a manual QA checklist.
Add widget/layout tests where practical.
Run flutter analyze and flutter test.
```

---

# T-29 — Firestore Security Rules and Data Privacy

## Dependencies
T-06, T-24.

## Description
Add Firebase security rules so users can only access their own synced data.

## Technical Requirements
Rules should cover:
- user profiles
- settings
- favorites
- notes
- reading progress
- goals
- streaks
- adhkar progress
- prayer settings

Rules:
- Authenticated user can only read/write own document paths.
- Guest data is never in Firestore.
- Quran public content should not be stored as user-writable shared data unless explicitly designed.

## Expected Result
Firestore data is protected by owner-based rules.

## Files/Folders
```text
firestore.rules
firebase.json
```

## Testing Requirements
- Firebase rules tests if test framework is set up.
- At minimum, document manual rules test cases.

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/data-storage-and-sync.md
- docs/architecture.md
- docs/codex-workflow.md

Task: Implement Firestore security rules and privacy structure.

Dependency check:
- Confirm T-06 Firebase Auth exists.
- Confirm T-24 Firestore sync adapters exist.
- If missing, stop and report missing dependency.

Implement or update:
- firestore.rules
- firebase.json if needed

Rules must ensure:
- Users can only read/write their own data.
- Guest data is never stored in Firestore.
- User-owned paths are protected by request.auth.uid.
- Quran text/tafsir content is not user-writable shared data.

Cover collections for:
- profiles
- settings
- favorites
- reflection notes
- reading progress
- daily goals
- streaks
- adhkar progress
- prayer settings

Add Firebase rules tests if the project has test setup. If not, document manual rule test cases.
```

---

# T-30 — Final MVP QA and Release Preparation

## Dependencies
T-00 through T-29, except T-26 can remain hidden/coming soon if manual mappings are not ready.

## Description
Final integration, bug fixing, performance checks, Android build preparation, and release checklist.

## Technical Requirements
Check:
- App starts as guest
- Optional login works
- Firebase sync works for logged-in users
- Offline mode works
- Daily ayah works
- Tafsir uses verified source only
- Quran reading works
- Adhkar counters work
- Prayer times work
- Adhan notification works
- 10-minute pre-prayer notification works
- Quran reminders do not reduce after ignored days
- Share ayah image works
- Arabic and English work
- Android release build works

## Expected Result
MVP is ready for Android testing/release.

## Files/Folders
```text
docs/release-checklist.md
```

## Testing Requirements
Run:

```text
flutter analyze
flutter test
flutter build apk --release
```

## Codex Prompt
```text
Read these files first:
- docs/project-overview.md
- docs/app-features.md
- docs/api-sources.md
- docs/religious-content-policy.md
- docs/data-storage-and-sync.md
- docs/notification-rules.md
- docs/responsive-ui-rules.md
- docs/tasks.md
- docs/codex-workflow.md

Task: Final MVP QA and Android release preparation.

Dependency check:
- Check the status of T-00 through T-29.
- T-26 may remain coming soon if manual ayah mappings are not provided.
- If any required MVP dependency is missing, list it clearly before making changes.

Perform final QA:
- Guest mode works.
- Optional login works.
- Logged-in online sync works.
- Logged-in offline changes sync later.
- Daily ayah works.
- Tafsir uses verified source only.
- Quran reading works.
- Quran recitation works if source is available.
- Adhkar counters work.
- Prayer times work.
- Adhan notifications work.
- 10-minute pre-prayer notifications work.
- Quran reminders do not reduce after ignored days.
- Daily goals and streak work.
- Favorites/bookmarks work.
- Reflection notes work.
- Share ayah image works.
- Arabic and English work.
- UI is responsive.

Create docs/release-checklist.md with:
- Completed checks
- Known limitations
- Required manual configuration
- Firebase setup checklist
- Quran Foundation credentials checklist
- Android notification test checklist

Run:
- flutter analyze
- flutter test
- flutter build apk --release

Fix issues where possible and document anything blocked by credentials or manual religious content review.
```

---

# Recommended Build Order

Use this order with Codex:

```text
T-00 Documentation Foundation
T-01 API Verification
T-02 Flutter Bootstrap
T-03 Architecture Scaffold
T-04 Localization/Theme/Routing/Responsive Shell
T-05 Drift Database
T-06 Firebase Auth
T-07 Sync Engine
T-08 Quran Backend Proxy
T-09 Quran Content
T-10 Tafsir
T-11 Audio
T-12 Daily Ayah
T-13 Reading Goals/Streak
T-14 Quran Reminders
T-15 Adhkar JSON
T-16 Adhkar UI/Counters
T-17 Prayer Times
T-18 Adhan Notifications
T-19 Favorites
T-20 Reflection Notes
T-21 Share Ayah Image
T-22 Settings
T-23 Home Dashboard
T-24 Firestore Sync Adapters
T-25 Offline Completion
T-26 Ayah by State/Mood, hidden until manually curated
T-27 Notification Reliability
T-28 Responsive UI QA
T-29 Firestore Security Rules
T-30 Final MVP QA
```

---

# Important Notes for You

1. Quran Foundation/Quran.com is the preferred source, but you need to confirm access and whether it is free/approved for your app.
2. Because Quran Foundation credentials must stay server-side, using Firebase Cloud Functions as a Quran proxy is the cleanest approach if credentials are required.
3. AlAdhan is fine for prayer times.
4. Adhkar should be local JSON, not API-based.
5. Adhan audio should be bundled locally and short for notification compatibility.
6. Do not let Codex generate real religious text. It can build schemas and UI, but real Quran/tafsir/adhkar content must come from verified sources.
7. The “ayah by state” feature must wait for you to manually choose ayahs for each state.
8. Quran reminders must not be reduced after ignored days.

