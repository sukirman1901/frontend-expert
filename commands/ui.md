---
name: ui
description: Build production UI with curated design tokens. Prevents AI aesthetic patterns.
---

# /ui

Build production-quality UI. Orchestrates suite skills — not a single monolith.

## Skills to load (in order)

1. `frontend-judgment` — non-trivial / blank-canvas only (see skip rules)
2. `design-tokens` — decision tree: custom → explicit → Plasma hard-gate → score
3. `marketing-landing` — **if** marketing homepage / landing section stack (hand-roll; not registry)
4. `app-shell-routing` — **if** shell / nav / multi-route
5. `data-fetching` — **if** remote/async data
6. `forms-validation` — **if** forms / wizards
7. `ui-components` — implement with states
8. `responsive-ui` — **MUST** for layout (320–1440)
9. `motion` — light shell defaults; marketing → families/patterns from `motion-families.md` (**hand-roll**)
10. `anti-ai-slop` — scan before done (includes decorative motion spam / hero-only landing)
11. `ui-feel` — micro craft
12. `accessibility` — light pass
13. `fe-seo` / `webgl` — **only if** in scope

## What It Does

1. Selects tokens via decision tree (custom → explicit → Plasma hard-gate → score)
2. Builds marketing section stack **or** shell/data/forms when needed, then components
3. **Responsive all devices** — `responsive-ui`
4. **Ships Reicon icons** unless waiver
5. Handles loading, error, empty
6. Shell: theme in topbar; avatar → account menu; custom selects for filters
7. Marketing: Header→Hero→Logo cloud→Features→Gallery→Testimonials→CTA→Footer (not hero-only)
8. Light **motion** (shell) or named family/patterns (marketing) — hand-roll, not registry default
9. Enforces accessibility basics
10. Scans for AI slop, then `ui-feel`
11. Ends with **Conventions check** (includes Responsive + Shell + Landing + Motion)

## Usage

```
/ui                      # Decision tree (default)
/ui --token <file>       # Explicit preset
/ui --custom             # Project design system
```

## Agent Invoked

`ui-developer` with the skills listed above.
