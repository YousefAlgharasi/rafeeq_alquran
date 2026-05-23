# Codex Workflow

## Before Any Task

Codex must read the documents named by the task prompt before changing code.

Codex must check task dependencies before implementation.

If dependencies are missing, Codex should stop and report the missing dependency instead of skipping ahead.

## Task Scope

Implement only the requested task.

Do not build the whole app during an early task.

Do not skip tasks.

Do not add unrelated refactors.

## Architecture Rules

Follow the feature-based architecture in `docs/architecture.md`.

Use:

- Riverpod for state management.
- Drift / SQLite for local structured data.
- SharedPreferences for small settings.
- Firebase Auth and Firestore for optional login and sync.

## Religious Content Rules

Do not generate Quran text, tafsir, adhkar, duas, or religious rulings with AI.

Use verified sources approved by the project owner.

Ayah by state or mood must use manually selected ayahs from the project owner.

## Storage Rules

- Guest users are local-only.
- Logged-in users save locally first.
- Logged-in users sync to Firebase when online.
- Logged-in offline changes remain local and sync when connectivity returns.

## UI Rules

Any UI must support Arabic and English.

Any UI must be responsive.

Arabic must support RTL.

English must support LTR.

## After Finishing A Task

Codex should report:

- Files created or changed.
- Commands run or commands the user should run.
- Any blockers.
- Any skipped test and why it was skipped.

