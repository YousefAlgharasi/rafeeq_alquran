# Notification Rules

## Notification Types

The app should support:

- Adhan notification at each prayer time.
- 10-minute pre-prayer notification.
- Daily Quran reading reminders at fixed natural times.

## Adhan Notifications

- Use one short bundled local adhan sound.
- Allow prayer notification settings later.
- Schedule based on prayer times from the approved prayer time source.
- Respect timezone handling.

## Pre-Prayer Notifications

- Send a notification 10 minutes before each prayer when enabled.
- Pre-prayer behavior should be configurable later.

## Quran Reading Reminders

Daily Quran reading reminders must not be reduced, suppressed, or disabled automatically because the user ignored previous reminders.

The app may allow the user to manually configure or disable reminders, but it must not silently reduce them based on inactivity.

## Permission And Reliability Direction

Android notification permissions, exact alarm needs, timezone initialization, and rescheduling after settings changes should be handled in later implementation tasks.

The app should fail gracefully if notification permissions are denied.

## Localization

Notification titles and bodies must support Arabic and English.

