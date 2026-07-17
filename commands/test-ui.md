---
name: test-ui
description: Test user-facing UI — component tests, states, a11y, critical paths. Use for /test-ui or natural-language test requests.
---

# /test-ui

Prove UI behavior. Orchestrates testing skills — parity with `/ui` and `/design`.

## Skills to load (in order)

1. `frontend-testing` — pyramid, TDD, Testing Library, a11y in tests
2. `ui-components` — know which states must exist
3. `accessibility` — what a11y invariants to assert
4. `fe-devtools` — Lighthouse/axe/viewport when evidence is required
5. `anti-ai-slop` — only if verifying visual regressions of slop fixes
6. `frontend-judgment` — only if test *strategy* for a large/ambiguous surface is unclear

## What It Does

1. Identifies the component/flow under test
2. Publishes a short **test plan** (unit vs integration vs E2E)
3. Writes or updates tests (prefer TDD for new behavior)
4. Covers loading / error / empty when those states exist
5. Adds a11y assertions when tooling allows (incl. reduced-motion if the UI is animated)
6. Runs the project's test command when available
7. Reports coverage checklist + remaining gaps (motion family regressions = Info unless animation was in scope)

## Usage

```
/test-ui                     # Test current / recently changed UI
/test-ui --component <name>  # Focus one component
/test-ui --tdd               # Red-green-refactor for new behavior
/test-ui --gaps              # Report missing coverage only
```

## Agent Invoked

`test-engineer` with the skills listed above.
