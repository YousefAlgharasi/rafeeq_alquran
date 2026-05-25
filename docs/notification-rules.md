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

- Initialize timezone data before scheduling notifications.
- Request Android 13+ notification permission before enabling scheduled reminders.
- Use inexact scheduling unless a later product decision requires exact alarms.
- Reschedule Quran reminders after reminder settings change.
- Reschedule adhan and pre-prayer notifications after prayer notification settings change.
- Reschedule adhan and pre-prayer notifications after prayer times refresh.
- Fail gracefully if notification permissions are denied: save the user's settings, skip notification display/scheduling, and show guidance in settings.

## Localization

Notification titles and bodies must support Arabic and English.

## Manual Android Notification Checklist

Run this checklist on a physical Android device or emulator with Google Play services where possible.

- Fresh install on Android 13 or newer: open Settings, verify the notification permission section is visible, tap Enable notifications, and confirm the system permission prompt appears.
- Deny permission: enable Quran reminders and adhan settings, verify the app stays responsive and shows guidance instead of crashing.
- Grant permission from app settings: return to the app and verify the permission section reports notifications enabled.
- Quran reminders: enable reminders, change a reminder time, and verify schedules refresh without reducing the configured reminder slots.
- Daily goal complete: complete today's goal and verify further Quran reminder scheduling for that day is cancelled.
- Adhan: enable Fajr, Dhuhr, Asr, Maghrib, and Isha; verify sunrise is not scheduled.
- Pre-prayer: enable pre-prayer notifications and verify each one is scheduled 10 minutes before the prayer time.
- Prayer refresh: refresh prayer times from Home and Prayer Times screens and verify adhan/pre-prayer schedules are rebuilt from the refreshed times.
- Reboot/update path: schedule future notifications, reboot the device or reinstall an update build, and verify scheduled notifications still fire.
- Sound/vibration: verify adhan uses the bundled short adhan sound and pre-prayer/Quran reminders use the default notification channel behavior.
