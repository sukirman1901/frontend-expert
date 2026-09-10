---
description: Build production UI with curated tokens — tokens, components, responsive, motion, anti-slop-design, polish, accessibility
---

Invoke the ui-developer agent.

## Skills to load (in order)

1. `design-direction` — non-trivial / blank-canvas only (see skip rules)
2. `design-foundations` — structural layout (grid, spacing, alignment, density); skip isolated color/type/motion/polish
3. `tokens`
4. `marketing` — if marketing homepage / landing (hand-roll section stack)
5. `app-shell` — if shell / routing / dashboard / settings
6. `data-fetching` — if async API UI
7. `forms` — if forms
8. `components`
9. `anti-slop-code` — generated implementation tells (preserve UI)
10. `responsive` — MUST for layout (all devices; drawer+backdrop)
11. `motion` — light shell defaults; marketing → families/patterns (`motion-families.md`) hand-roll
12. `anti-slop-design`
13. `polish`
14. `accessibility` (light pass)
15. `seo` / `webgl` — only if in scope

## Modes

- **`/ui`** — token mode: walk decision tree in `references/token-preset-scoring.md`
- **`/ui --token <file>`** — force a specific token preset (explicit branch)
- **`/ui --custom`** — project's existing design system (custom branch)

`$ARGUMENTS` selects the mode and options.

## What to do

1. Choose direction via `design-direction` when the UI is non-trivial / blank-canvas (2–3 approaches); skip for tiny clear fixes
2. Structure the layout via `design-foundations` (relationships before token values); skip isolated color/type/motion/polish
3. Choose tokens via decision tree (custom → explicit → Plasma hard-gate → score)
4. Shell: logo + utilities + **theme in topbar**; **avatar → account menu**; mobile drawer+backdrop; desktop sidebar collapse; **custom selects** for filters
5. Marketing landings: load `marketing` — section stack (not hero-only); hand-roll, no registry install
6. Implement with composition, loading/error/empty states, **responsive**, **motion** (shell light or named families)
7. Make interactive elements keyboard accessible
8. Scan for generated-code tells (`anti-slop-code`), then AI aesthetic patterns (incl. motion spam / hero-only), then apply `polish` craft
9. Report: implementation, tokens used, **Conventions check** (Reicon/tokens/states/responsive/shell/landing/motion), a11y notes
