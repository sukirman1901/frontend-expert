---
name: accessibility
description: >-
  Enforce WCAG 2.2 AA by default (keyboard, ARIA, focus, contrast, semantics,
  target size, dragging alternatives, accessible authentication). Use for
  accessibility work, pre-ship UI checks, and as a light pass on every UI build
  or design review — including "a11y", "keyboard", "screen reader", or shipping
  user-facing changes.
---

# Accessibility

## Overview

New user-facing UI targets **WCAG 2.2 AA** by default. Honor an explicit legal/project target such as 2.1, and record it. Do not claim a check that was not performed.

## When to use

- Light pass on every `/ui` build
- `/design` audits and dedicated a11y fixes
- Keyboard, screen reader, contrast, focus, or target-size issues

## When to skip

- Palette construction → `design-color` (this skill owns *conformance* of pairs)
- Type wrapping/truncation → `design-typography`
- Hit-area *feel* only, with no conformance claim → `polish`

## MUST

| Rule | Detail |
|------|--------|
| **Name the target** | WCAG 2.2 AA unless the project/legal pin is different |
| **Keyboard path** | Native controls first; visible `:focus-visible`; logical order |
| **Focus not obscured** | Sticky/fixed UI must not hide focused items (2.4.11) |
| **Names and states** | Visible labels; icon-only buttons have `aria-label`; toggles expose state |
| **Contrast measured** | Text 4.5:1 / large 3:1 / UI 3:1 — measure pairs, do not guess from lightness |
| **Not color alone** | State needs icon, text, or pattern as well as color |
| **Target size** | 2.5.8 minimum is **24×24 CSS px** (with exceptions). 44×44 is a pack *recommendation*, not 2.5.8 |
| **Dragging alternative** | Pointer-drag actions have a non-drag method (2.5.7) |
| **Auth / redundant entry** | No cognitive-function test without an alternative (3.3.8); don’t re-ask data the user already gave in the same process (3.3.7) |
| **Honest verification** | Untested screen-reader or zoom checks are `Not verified` |

## Workflow

1. **Target** — record 2.2 AA or the project pin.
2. **Keyboard** — tab the real UI; trap/restore in dialogs; skip link on long nav.
3. **Names** — labels, landmarks, live regions for dynamic status.
4. **Perceive** — measured contrast; color-blind-safe state; 200% zoom if claiming it.
5. **Operate** — 2.2 target size, dragging alternative, focus not obscured.
6. **Report** — pass/fail per check; `Not verified` for tools not run.

Cheapest valid fix: native element → correct name/role → then ARIA.

## Boundaries

- **May decide:** native `<dialog>` vs labeled custom modal; live-region politeness.
- **Must not:** report 44px as WCAG 2.5.8; claim SR/axe results without running them; use ARIA to paper over unkeyboardable divs.

## Checklist

- [ ] Conformance target recorded (2.2 AA or project pin)
- [ ] Keyboard path and visible focus; focus not obscured
- [ ] Labels / `aria-label` / toggle states / live regions as relevant
- [ ] Contrast measured for text and UI components
- [ ] No color-only state
- [ ] 2.5.8 target size (24px) distinguished from 44px recommendation
- [ ] Dragging alternative and accessible authentication checked if in scope
- [ ] Untested items marked `Not verified`

## Depth

Full checklist and recipes: `references/accessibility-checklist.md`.
Contrast context: `references/design-color.md`, `references/ux-foundations.md`.
Evidence classes: `references/evidence-policy.md`.
