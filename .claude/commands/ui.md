---
description: Build production UI with curated tokens — design-tokens, ui-components, anti-ai-slop, accessibility
---

Invoke the ui-developer agent.

## Skills to load (in order)

1. `frontend-judgment` — non-trivial / blank-canvas only (see skip rules)
2. `design-tokens`
3. `ui-components`
4. `anti-ai-slop`
5. `accessibility` (light pass)
6. `motion` — only if animation is in scope

## Modes

- **`/ui`** — token mode (default): pick a preset from `tokens/` or use the project's existing tokens
- **`/ui --token <file>`** — force a specific token preset
- **`/ui --custom`** — adapt to the project's existing design system

`$ARGUMENTS` selects the mode and options.

## What to do

1. Choose direction via `frontend-judgment` when the UI is non-trivial / blank-canvas (2–3 approaches); skip for tiny clear fixes
2. Choose tokens (preset or existing project system) — never invent raw hex
3. Implement with composition, loading/error/empty states, mobile-first
4. Make interactive elements keyboard accessible
5. Scan for AI aesthetic patterns before finishing
6. Report: implementation, tokens used, a11y notes, responsive notes
