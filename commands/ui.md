---
name: ui
description: Build production UI with curated design tokens. Prevents AI aesthetic patterns.
---

# /ui

Build production-quality UI. Orchestrates domain skills — not a single monolith.

## Skills to load (in order)

1. `frontend-judgment` — non-trivial / blank-canvas only (see skip rules)
2. `design-tokens` — pick preset or project system
3. `ui-components` — implement with states + responsive
4. `anti-ai-slop` — scan before done
5. `ui-feel` — micro craft (radius, press, tabular-nums, …)
6. `accessibility` — light pass (keyboard, labels, contrast)
7. `motion` — **only if** animation is in scope
8. `webgl` — **only if** shader / Plasma / canvas background is in scope

## What It Does

1. Selects tokens (preset from `tokens/` or existing design system)
2. Implements components — composition-first, under 200 lines, CSS variables only
3. **Ships Reicon icons** in nav/toolbars/empty/icon-buttons (CDN or package) unless waiver
4. Handles loading, error, empty
5. Enforces accessibility basics
6. Scans for AI slop, then applies `ui-feel` polish
7. Ends with **Conventions check** (`references/compliance-gates.md`)

## Usage

```
/ui                      # Token mode (default)
/ui --token <file>       # Specific preset
/ui --custom             # Use project's existing design system
```

## Agent Invoked

`ui-developer` with the skills listed above.
