# API Sources

## T-01 Verification Status

Verified on: 2026-05-24.

This task documents the API strategy only. It does not implement feature code.

## Decision Table

| Area | Source | Current status | Credential status | Implementation decision |
| --- | --- | --- | --- | --- |
| Quran text, surahs, ayahs, tafsir, translations, recitation metadata/audio | Quran Foundation / Quran.com | Preferred source, but production use depends on approved access | Not available in this repo yet | Do not implement production API calls yet. Future tasks should create repository interfaces and mock/local sample datasources until credentials and approval are provided. |
| Prayer times | AlAdhan API | Approved source for prayer times | No project credential currently required by docs reviewed | Use AlAdhan endpoints in later tasks, with monthly cache where possible. |
| Adhkar | Local JSON from trusted source | Approved direction | Not applicable | Bundle local JSON files with source metadata. Do not fetch adhkar from an unverified API. |
| Adhan audio | Bundled local audio file | Approved direction | Not applicable | Use one short bundled adhan file suitable for notification playback. |

## Quran Foundation / Quran.com

Preferred source:

- Quran Foundation / Quran.com, only if access is free or explicitly approved for this project.

Verified documentation:

- Quran Foundation Content APIs provide Quran content such as chapters, verses, recitations, and translations.
- Quran Foundation Content APIs use OAuth2 Client Credentials with the `content` scope.
- API calls require token/client headers.
- Quran Foundation quickstart material says client secrets must be kept server-side and must not be embedded in browser or mobile apps.
- Quran Foundation User APIs and most Request Access clients may involve confidential clients, where secrets must remain on a backend.

Current project decision:

- Quran Foundation credentials are not present in this repo.
- Free/approved access has not been confirmed by the project owner yet.
- Production Quran Foundation calls are blocked until credentials and project approval are available.
- Flutter/mobile code must never include a Quran Foundation `client_secret`.
- If Quran Foundation requires `client_secret`, use Firebase Cloud Functions or another backend proxy.
- Later implementation must use repository interfaces and mock/local sample data only until credentials are provided.

Security requirements:

- Store Quran Foundation credentials only in backend environment/config.
- Do not commit Quran Foundation credentials.
- Do not call token endpoints directly from Flutter if a secret is required.
- Cache approved Quran data locally for offline use after it is fetched from an approved source.

Content integrity requirements:

- Do not use unverified Quran or tafsir text.
- Do not generate Quran, tafsir, translations, adhkar, duas, or religious explanations with AI.
- Preserve source metadata where practical.
- Do not auto-translate verified Quran translations or tafsir content.

## Quran Fallback Strategy

Until Quran Foundation access is approved and credentials are available:

- Build only contracts/interfaces for Quran data access.
- Use mock datasources or tiny local sample data only for development scaffolding.
- Mark sample data clearly as sample data.
- Do not ship unverified sample Quran, tafsir, translation, or adhkar content.
- Do not create production Quran API calls.

If access is approved and credentials are available:

- Implement a Firebase Cloud Functions proxy if `client_secret` is required.
- The Flutter app calls the project backend/proxy, not Quran Foundation token endpoints directly.
- Backend fetches and caches access tokens securely.
- Flutter receives only approved API responses needed by the app.

## Prayer Times: AlAdhan

Preferred source:

- AlAdhan API.

Verified documentation:

- AlAdhan provides REST endpoints for prayer times and prayer time calendars.
- It supports calculation by coordinates, city/country, and address.
- It exposes monthly calendar endpoints and daily timings endpoints.
- It supports calculation methods and juristic school settings.

Planned endpoint families for later implementation:

- Monthly calendar by coordinates: `https://api.aladhan.com/v1/calendar/:year/:month`
- Monthly calendar by city/country: `https://api.aladhan.com/v1/calendarByCity/:year/:month`
- Monthly calendar by address: `https://api.aladhan.com/v1/calendarByAddress/:year/:month`
- Daily timings by coordinates: `https://api.aladhan.com/v1/timings/:date`
- Daily timings by city/country: `https://api.aladhan.com/v1/timingsByCity/:date`
- Daily timings by address: `https://api.aladhan.com/v1/timingsByAddress/:date`
- Calculation methods: `https://api.aladhan.com/v1/methods`

Implementation rules for later tasks:

- Prefer monthly calendar endpoints to cache the current month.
- Support GPS coordinates.
- Support manual city/country input.
- Support calculation method setting.
- Support madhab/juristic school setting.
- Cache prayer times locally for offline use.
- Document that AlAdhan calculations may differ from a user's local mosque or authority.

## Adhkar

Approved direction:

- Local JSON from a trusted source.

Rules:

- Include source metadata with adhkar data.
- Do not generate adhkar content with AI.
- Do not use an unverified adhkar API.
- Keep adhkar fully usable offline.

## Adhan Audio

Approved direction:

- One short bundled local audio file for notifications.

Rules:

- Do not depend on streaming audio for notification playback.
- Keep the file suitable for Android notification behavior.
- Store it under the app assets when the asset scaffold task is reached.

## Source References

- Quran.com Developers: https://quran.com/en/developers
- Quran Foundation Content APIs: https://api-docs.quran.com/docs/content_apis_versioned/4.0.0/content-apis
- Quran Foundation OAuth2 quickstart: https://api-docs.quran.com/docs/quickstart
- Quran Foundation OAuth2 tutorial: https://api-docs.quran.com/docs/tutorials/oidc/getting-started-with-oauth2
- AlAdhan Prayer Times API: https://aladhan.com/prayer-times-api
- AlAdhan calculation methods: https://aladhan.com/calculation-methods
