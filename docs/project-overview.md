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

## Firebase Configuration Status

Updated on: 2026-05-24.

Firebase is configured for this Flutter project.

- Firebase project id: `rafeeq-alquran`.
- Android application id/package: `com.yousefapps.rafeeq_alquran`.
- Android config file exists at `android/app/google-services.json`.
- FlutterFire generated config exists at `lib/firebase_options.dart`.
- Android uses Kotlin DSL Gradle files and has the Google Services plugin configured.
- Firebase Core initializes before `runApp` through `lib/core/firebase/firebase_initializer.dart`.
- Startup remains safe: if Firebase initialization fails in development/preproduction, the app logs the error and still opens the app shell.
- Firebase Auth email/password support is implemented in the app code. The Email/Password provider must remain enabled in Firebase Console.

This status does not mean every Firebase product is fully implemented. Firestore feature sync adapters, security rules, Cloud Functions deployment, Analytics, Messaging, Crashlytics, Storage, and Remote Config are separate future tasks unless already implemented.

## Storage Direction

- Guest users are local-only.
- Logged-in users save locally first, then sync to Firebase.
- Logged-in offline users save locally and queue changes for sync.
- When connectivity returns, pending local changes should sync to Firebase.

## Religious Content Rule

AI must never generate Quran text, tafsir, adhkar, or religious rulings.

Quran, tafsir, adhkar, and religious content must come from verified sources approved by the project owner.
