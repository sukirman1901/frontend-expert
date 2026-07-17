---
description: Build production UI with curated tokens — design-tokens, ui-components, responsive-ui, motion, anti-ai-slop, ui-feel, accessibility
---

Invoke the ui-developer agent.

## Skills to load (in order)

1. `frontend-judgment` — non-trivial / blank-canvas only (see skip rules)
2. `design-tokens`
3. `marketing-landing` — if marketing homepage / landing (hand-roll section stack)
4. `app-shell-routing` — if shell / routing / dashboard / settings
5. `data-fetching` — if async API UI
6. `forms-validation` — if forms
7. `ui-components`
8. `responsive-ui` — MUST for layout (all devices; drawer+backdrop)
9. `motion` — light shell defaults; marketing → families/patterns (`motion-families.md`) hand-roll
10. `anti-ai-slop`
11. `ui-feel`
12. `accessibility` (light pass)
13. `fe-seo` / `webgl` — only if in scope

## Modes

- **`/ui`** — token mode: walk decision tree in `references/token-preset-scoring.md`
- **`/ui --token <file>`** — force a specific token preset (explicit branch)
- **`/ui --custom`** — project's existing design system (custom branch)

`$ARGUMENTS` selects the mode and options.

## What to do

1. Choose direction via `frontend-judgment` when the UI is non-trivial / blank-canvas (2–3 approaches); skip for tiny clear fixes
2. Choose tokens via decision tree (custom → explicit → Plasma hard-gate → score)
3. Shell: logo + utilities + **theme in topbar**; **avatar → account menu**; mobile drawer+backdrop; desktop sidebar collapse; **custom selects** for filters
4. Marketing landings: load `marketing-landing` — section stack (not hero-only); hand-roll, no registry install
5. Implement with composition, loading/error/empty states, **responsive-ui**, **motion** (shell light or named families)
6. Make interactive elements keyboard accessible
7. Scan for AI aesthetic patterns (incl. motion spam / hero-only), then apply `ui-feel` craft
8. Report: implementation, tokens used, **Conventions check** (Reicon/tokens/states/responsive/shell/landing/motion), a11y notes
