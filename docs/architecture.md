# Architecture

## Architecture Style

The app must use feature-based Flutter architecture.

Shared infrastructure belongs in `lib/core/`.

Product features belong in `lib/features/`.

## Required Project Structure

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
    auth/
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

    quran_content/
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

    daily_ayah/
    tafsir/
    prayer_times/
    adhan_notifications/
    adhkar/
    reading_tracker/
    daily_goal/
    streak/
    favorites/
    reflection_notes/
    share_ayah/
    settings/
    home/
```

Every feature must follow this internal pattern:

```text
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

## Layer Responsibilities

- `data/datasources`: local, remote, Firebase, asset, and API access.
- `data/models`: DTOs, database models, serialization models.
- `data/repository/repo_impl`: concrete repository implementations.
- `logic/entity`: domain entities.
- `logic/repository`: repository contracts.
- `logic/provider`: Riverpod providers and feature state.
- `ui/pages`: routed screens.
- `ui/widgets`: reusable feature widgets.

## State Management

Use Riverpod for feature state, app state, repositories, services, and async loading flows.

## Routing

Routing should live in `lib/core/routing/`.

Future routes should be feature-aware and should not put feature business logic inside route definitions.

## Responsive UI

Responsive helpers should live in `lib/core/responsive/`.

Feature UIs should use shared breakpoints and spacing rules instead of one-off fixed layouts.

