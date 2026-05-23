# Responsive UI Rules

## Device Targets

The UI must work on:

- Small Android phones.
- Large Android phones.
- Tablets.
- Portrait orientation.
- Landscape orientation where practical.

## Language Direction

- Arabic must use RTL layout.
- English must use LTR layout.
- Text must be localized.
- Layouts must handle Arabic text length and English text length.

## Layout Rules

- Avoid fixed widths that break on small screens.
- Prefer responsive constraints, flexible layouts, and scrollable content where needed.
- Use shared breakpoints from `lib/core/responsive/` once implemented.
- Avoid overflow in cards, buttons, navigation, and counters.
- Preserve readable Quran text sizing.
- Keep touch targets comfortable for counters, prayer settings, and notification controls.

## Navigation Direction

- Phones should use bottom navigation where appropriate.
- Wider layouts may use NavigationRail or another adaptive layout.

## Testing Direction

Future UI tasks should check:

- Small phone width.
- Large phone width.
- Tablet width.
- Arabic RTL.
- English LTR.
- Text scaling.
- Scroll behavior.
- No overflow errors.

