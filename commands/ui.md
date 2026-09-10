---
name: ui
description: Build production UI with curated design tokens. Prevents AI aesthetic patterns.
---

# /ui

Build production-quality UI. Orchestrates suite skills — not a single monolith.

## Skills to load (in order)

1. `design-direction` — non-trivial / blank-canvas only (see skip rules)
2. `design-foundations` — structural layout (grid, spacing, alignment, density); skip isolated color/type/motion/polish
3. `tokens` — decision tree: custom → explicit → Plasma hard-gate → score
4. `design-typography` / `design-color` / `design-surfaces` / `content-design` — only when their domain is in scope
5. `marketing` — **if** marketing homepage / landing section stack (hand-roll; not registry)
6. `app-shell` — **if** shell / nav / multi-route
7. `data-fetching` — **if** remote/async data
8. `forms` — **if** forms / wizards
9. `components` — implement with states
10. `anti-slop-code` — generated implementation tells (not a visual restyle)
11. `responsive` — **MUST** for layout (320–1440)
12. `motion` — light shell defaults; marketing → families/patterns from `motion-families.md` (**hand-roll**)
13. `anti-slop-design` — scan before done (includes decorative motion spam / hero-only landing)
14. `polish` — micro craft
15. `accessibility` — light pass
16. `seo` / `webgl` — **only if** in scope

## What It Does

1. Selects tokens via decision tree (custom → explicit → Plasma hard-gate → score)
2. Structures layout via `design-foundations` (relationships before values)
3. Builds marketing section stack **or** shell/data/forms when needed, then components
4. **Responsive all devices** — `responsive`
5. **Ships Reicon icons** unless waiver
6. Handles loading, error, empty
7. Shell: theme in topbar; avatar → account menu; custom selects for filters
8. Marketing: Header→Hero→Logo cloud→Features→Gallery→Testimonials→CTA→Footer (not hero-only)
9. Light **motion** (shell) or named family/patterns (marketing) — hand-roll, not registry default
10. Enforces accessibility basics
11. Scans for generated-code tells (`anti-slop-code`), then visual AI slop, then `polish`
12. Ends with **Conventions check** (includes Responsive + Shell + Landing + Motion)

## Usage

```
/ui                      # Decision tree (default)
/ui --token <file>       # Explicit preset
/ui --custom             # Project design system
```

## Agent Invoked

`ui-developer` with the skills listed above.
