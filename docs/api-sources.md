# API Sources

## Source Strategy

External data sources must be verified before production implementation.

T-01 will verify detailed access strategy. Until then, this document records the intended direction only.

## Quran, Tafsir, Surahs, Ayahs, And Audio

Preferred source:

- Quran Foundation / Quran.com, only if access is free or explicitly approved for this project.

Rules:

- Do not expose Quran Foundation client secrets in Flutter/mobile code.
- If secret-based OAuth or private credentials are required, use Firebase Cloud Functions or another backend proxy.
- If credentials are not available, future tasks should create repository interfaces and mock/local sample datasources only.
- Do not use unverified Quran or tafsir text.
- Do not generate Quran, tafsir, translations, or religious explanations with AI.

## Prayer Times

Preferred source:

- AlAdhan API.

Expected support:

- GPS-based location.
- Manual city/country input.
- Calculation method setting.
- Madhab setting.
- Monthly cache where possible.

## Adhkar

Adhkar should be bundled as local JSON from a trusted source.

Each adhkar data file should include source metadata or be paired with clear source documentation.

## Adhan Audio

Adhan notification audio should be a short bundled local audio file suitable for notification playback.

## Verification Status

Detailed API access, credential availability, and fallback decisions are pending T-01.

