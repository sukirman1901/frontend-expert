---
description: Build production UI with curated tokens — design-tokens, ui-components, responsive-ui, anti-ai-slop, ui-feel, accessibility
---

Invoke the ui-developer agent.

## Skills to load (in order)

1. `frontend-judgment` — non-trivial / blank-canvas only (see skip rules)
2. `design-tokens`
3. `app-shell-routing` — if shell / routing
4. `data-fetching` — if async API UI
5. `forms-validation` — if forms
6. `ui-components`
7. `responsive-ui` — MUST for layout (all devices)
8. `anti-ai-slop`
9. `ui-feel`
10. `accessibility` (light pass)
11. `motion` / `webgl` / `fe-seo` — only if in scope

## Modes

- **`/ui`** — token mode: walk decision tree in `references/token-preset-scoring.md`
- **`/ui --token <file>`** — force a specific token preset (explicit branch)
- **`/ui --custom`** — project's existing design system (custom branch)

`$ARGUMENTS` selects the mode and options.

## What to do

1. Choose direction via `frontend-judgment` when the UI is non-trivial / blank-canvas (2–3 approaches); skip for tiny clear fixes
2. Choose tokens via decision tree (custom → explicit → Plasma hard-gate → score) — never invent raw hex; emit Token score on score path
3. Implement with composition, loading/error/empty states, mobile-first **responsive-ui** (320–1440)
4. Make interactive elements keyboard accessible
5. Scan for AI aesthetic patterns, then apply `ui-feel` craft
6. Report: implementation, tokens used, **Conventions check** (Reicon/tokens/states/responsive), a11y notes, responsive notes
