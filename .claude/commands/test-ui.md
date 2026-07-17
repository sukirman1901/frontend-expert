---
description: Test user-facing UI — frontend-testing, states, a11y; invoke test-engineer
---

Invoke the test-engineer agent.

## Skills to load (in order)

1. `frontend-testing`
2. `ui-components`
3. `accessibility`
4. `fe-devtools` — Lighthouse/axe/viewport when evidence is required
5. `anti-ai-slop` — only if verifying visual regressions tied to slop fixes
6. `frontend-judgment` — only if test strategy for a large surface is unclear

## Modes

- **`/test-ui`** — test current / recently changed UI
- **`/test-ui --component <name>`** — focus one component
- **`/test-ui --tdd`** — red-green-refactor for new behavior
- **`/test-ui --gaps`** — report missing coverage only

`$ARGUMENTS` selects the mode and options.

## What to do

1. Publish a short test plan (unit / integration / E2E)
2. Prefer TDD for new behavior
3. Cover loading / error / empty when those states exist
4. Prefer role/label queries over test IDs
5. Add a11y assertions when tooling exists
6. Run the project's test command when available
7. Report coverage checklist + remaining gaps (per test-engineer output format)
