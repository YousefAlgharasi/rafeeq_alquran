# Religious Content Policy

## Core Rule

AI must never generate Quran text, tafsir, adhkar, duas, religious rulings, or religious guidance content for this app.

Codex may build app structure, schemas, validation, UI, repositories, and import pipelines, but the actual religious content must come from verified sources approved by the project owner.

## Quran And Tafsir

- Quran text must come from Quran Foundation / Quran.com or another verified approved source.
- Tafsir must come from a verified approved source.
- Tafsir Al-Muyassar is planned, but the app must not include AI-generated tafsir.
- Any Quran or tafsir cache must preserve source metadata where practical.

## Adhkar And Duas

- Adhkar should be local JSON from a trusted source.
- Source metadata is required.
- AI must not write adhkar text or selected duas.

## Ayah By State Or Mood

Ayah by state, mood, emotion, or life situation must use manually selected ayahs chosen by the project owner.

AI must not choose ayahs for:

- anxiety
- sadness
- repentance
- patience
- rizq
- gratitude
- peace
- advice
- rulings
- any spiritual or religious recommendation

Until mappings are manually reviewed, this feature should stay hidden or marked as coming soon.

## Source Changes

Any new religious content source must be approved before implementation.

## API Access Guardrails

Quran Foundation / Quran.com remains the preferred Quran source only if access is free or explicitly approved for this project.

If Quran Foundation credentials are required, secrets must stay server-side. Flutter/mobile code must never contain a Quran Foundation `client_secret`.

Until approved credentials are available, implementation tasks must use repository interfaces and mock/local sample datasources only. Production Quran, tafsir, translation, or recitation API calls must wait for source approval and credential handling.

Prayer times may use AlAdhan according to `docs/api-sources.md`.

Adhkar must remain local JSON from a trusted source with source metadata.

Adhan audio must be a bundled short local audio file, not generated religious content.
