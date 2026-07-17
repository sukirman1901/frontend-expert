---
name: ui
description: Build production UI with curated design tokens. Prevents AI aesthetic patterns.
---

# /ui

Build production-quality UI. Orchestrates suite skills — not a single monolith.

## Skills to load (in order)

1. `frontend-judgment` — non-trivial / blank-canvas only (see skip rules)
2. `design-tokens` — decision tree: custom → explicit → Plasma hard-gate → score
3. `app-shell-routing` — **if** shell / nav / multi-route
4. `data-fetching` — **if** remote/async data
5. `forms-validation` — **if** forms / wizards
6. `ui-components` — implement with states
7. `responsive-ui` — **MUST** for layout (320–1440)
8. `motion` — light shell defaults; marketing → families/patterns from `motion-families.md` (**hand-roll**)
9. `anti-ai-slop` — scan before done (includes decorative motion spam)
10. `ui-feel` — micro craft
11. `accessibility` — light pass
12. `fe-seo` / `webgl` — **only if** in scope

## What It Does

1. Selects tokens via decision tree (custom → explicit → Plasma hard-gate → score)
2. Builds shell/data/forms when needed, then components
3. **Responsive all devices** — `responsive-ui`
4. **Ships Reicon icons** unless waiver
5. Handles loading, error, empty
6. Shell: theme in topbar; avatar → account menu; custom selects for filters
7. Light **motion** (shell) or named family/patterns (marketing) — hand-roll, not registry default
8. Enforces accessibility basics
9. Scans for AI slop, then `ui-feel`
10. Ends with **Conventions check** (includes Responsive + Shell + Motion)

## Usage

```
/ui                      # Decision tree (default)
/ui --token <file>       # Explicit preset
/ui --custom             # Project design system
```

## Agent Invoked

`ui-developer` with the skills listed above.
