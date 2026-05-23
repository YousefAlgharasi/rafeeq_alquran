# رفيق القرآن Project Overview

## Product Identity

The app name is **رفيق القرآن**.

The technical project name is **rafeeq_alquran**.

رفيق القرآن is a Flutter Islamic companion app focused on Quran reading, daily Quran connection, adhkar, prayer times, reminders, and personal progress.

## Platform Direction

- Android is the first target platform.
- iOS support should remain possible later.
- Code and package choices should avoid Android-only assumptions unless the feature is specifically Android-only, such as notification permission behavior.

## Language Direction

- Arabic and English must be supported from the beginning.
- Arabic UI must support RTL.
- English UI must support LTR.
- User-facing text should be localized instead of hard-coded in widgets.

## Core Technical Direction

- Flutter app.
- Feature-based architecture.
- Riverpod for state management.
- Drift / SQLite for local database storage.
- SharedPreferences for small settings.
- Firebase Auth and Cloud Firestore for optional login and sync.
- Firebase Cloud Functions only where needed, especially to keep Quran Foundation credentials server-side.

## Storage Direction

- Guest users are local-only.
- Logged-in users save locally first, then sync to Firebase.
- Logged-in offline users save locally and queue changes for sync.
- When connectivity returns, pending local changes should sync to Firebase.

## Religious Content Rule

AI must never generate Quran text, tafsir, adhkar, or religious rulings.

Quran, tafsir, adhkar, and religious content must come from verified sources approved by the project owner.

