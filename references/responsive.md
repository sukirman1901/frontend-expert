# Responsive UI (all devices)

Mandatory for product UI. Used by: `responsive-ui`, `ui-components`, `/ui`, `/design`, `/polish`.

## Canonical breakpoints

Verify **mobile-first** at least:

| Width | Role |
|-------|------|
| **320** | Narrow phone (floor) |
| **390 / 430** | Common phones (optional smoke) |
| **768** | Tablet |
| **1024** | Small laptop / large tablet |
| **1440** | Desktop |

Base styles = phone. Enhance with `min-width` media queries (or container queries when layout is component-scoped).

## Hard rules

1. **No horizontal page scroll** at 320–1440 (except intentional code blocks / media with internal scroll)
2. **Tap targets ≥ 44×44px** for primary controls on touch
3. **Nav / forms / primary CTAs usable on phone** — not desktop-only chrome
4. **Adapt, don’t delete** — if a column/table hides on small screens, provide a stacked/card/alternative view
5. **Fluid images/media** — `max-width: 100%`; avoid fixed widths that blow out the viewport
6. **Typography** — readable line length; don’t rely on hover-only affordances for essential actions

## Patterns

| Desktop pattern | Small-screen adapt |
|-----------------|-------------------|
| Wide data table | Card list / stacked rows / horizontal scroll *inside* a contained region with affordance |
| Multi-column dashboard | Single column stack; priority order top→bottom |
| Side nav always open | Drawer / bottom nav / collapsible |
| Hover menus | Tap-open + focus visible |
| Dense toolbars | Overflow menu / icon+label wrap |

## Conventions line

```markdown
- Responsive: 320/768/1024/1440 checked | waiver: …
```

Greenfield without this line → audit **High** (Token/Responsive adherence).

## Anti-patterns

- Desktop-first CSS with `max-width` hacks only
- `width: 1200px` fixed shells
- Content that exists only at `lg+` with no mobile equivalent
- Tiny hit targets (`h-6 w-6` icon buttons without padding)
- Assuming hover for delete/edit

## Related

- Components: `ui-components`, `references/component-patterns.md`
- A11y overlap: `accessibility` (focus, labels)
- Feel: `ui-feel` (press states still apply on touch)
