---
name: frontend-testing
description: >-
  Test user-facing UI with TDD, component tests, a11y checks, and critical-path
  coverage. Use when writing or fixing UI tests, verifying loading/error/empty
  states, or when the user mentions test/TDD/coverage/regresi — including
  natural language, not only /test-ui.
---

# Frontend Testing

## Overview

Prove UI behavior with a lean pyramid: mostly unit/component tests, some integration, few E2E. Prefer Testing Library queries that mirror how users interact. Include accessibility checks for interactive UI.

## When to Use

- `/test-ui` or explicit test requests
- After `/ui` when the user wants TDD or coverage for a component
- Fixing a UI bug (regression test first)

## Workflow

1. **Choose level**
   - Unit/component (~80%): render, props, states (loading/error/empty)
   - Integration (~15%): user flows across a few components
   - E2E (~5%): critical paths only (Playwright/Cypress)

2. **TDD when changing behavior**
   - Red → Green → Refactor
   - One behavior per test; name by user-visible outcome

3. **Query priority (Testing Library)**
   - Prefer: role, label, text
   - Avoid: test IDs unless no accessible name exists

4. **Must cover for interactive UI**
   - Default render
   - Loading / error / empty when those states exist
   - Primary user action (click/submit)
   - Keyboard path for custom controls when non-native
   - **Robustness (when risk is real):** double-submit / spam click, interrupt open→close mid-animation, slow network loading UI

5. **Accessibility in tests**
   - axe-core (or equivalent) on critical components when tooling exists
   - Assert accessible names on icon-only controls

6. **Visual regression (optional)**
   - Storybook + Chromatic/Percy when the project already uses them
   - Do not introduce a visual stack just for this skill

## Checklist

- [ ] Tests describe user-visible behavior
- [ ] Loading / error / empty covered when applicable
- [ ] Double-submit / interrupt paths covered when destructive or async
- [ ] No unnecessary `test-id` queries
- [ ] Regression test for bugs fixed
- [ ] A11y assertion or axe run for interactive surfaces (when tooling available)

## Depth

Full guide: `references/testing.md`. Robustness ideas also in `references/anti-patterns.md`.