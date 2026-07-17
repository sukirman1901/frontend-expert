---
description: Test user-facing UI — frontend-testing, component states, a11y assertions
---

Invoke the ui-developer agent with testing in scope.

## Skills to load (in order)

1. `frontend-testing`
2. `ui-components`
3. `accessibility`
4. `anti-ai-slop` — only if verifying slop-related visual regressions

## Modes

- **`/test-ui`** — test current / recently changed UI
- **`/test-ui --component <name>`** — focus one component
- **`/test-ui --tdd`** — red-green-refactor for new behavior

`$ARGUMENTS` selects the mode and options.

## What to do

1. Identify the component or flow under test
2. Prefer TDD for new behavior (red → green → refactor)
3. Cover loading / error / empty when those states exist
4. Prefer role/label queries over test IDs
5. Add a11y assertions (axe or accessible names) when tooling exists
6. Run the project's test command when available and report results
