---
name: test-ui
description: Test user-facing UI — component tests, states, a11y, critical paths.
---

# /test-ui

Prove UI behavior with `frontend-testing`. Orchestrates testing for components built via `/ui`.

## Skills to load (in order)

1. `frontend-testing` — pyramid, TDD, Testing Library, a11y in tests
2. `ui-components` — know which states must exist
3. `accessibility` — what a11y invariants to assert
4. `anti-ai-slop` — skip unless tests are about visual regressions of slop fixes

## What It Does

1. Identifies the component/flow under test
2. Writes or updates tests (prefer TDD for new behavior)
3. Covers loading / error / empty when those states exist
4. Adds a11y assertions when tooling allows
5. Runs the project's test command when available

## Usage

```
/test-ui                     # Test current / recently changed UI
/test-ui --component <name>  # Focus one component
/test-ui --tdd               # Red-green-refactor for new behavior
```

## Agent Invoked

`ui-developer` (implementation + tests) with `frontend-testing` leading. For audit-only test gap reports, `design-reviewer` may note missing coverage as **Info** — it does not replace `/test-ui`.
