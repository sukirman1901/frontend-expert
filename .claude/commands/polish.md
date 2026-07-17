---
description: Loop build → test → audit → fix until UI quality gates pass
---

Invoke the ui-quality-loop skill as the controller.

## Agents per step

- Build/fix → `ui-developer`
- Test → `test-engineer`
- Audit → `design-reviewer`

## Skills

Lead with `ui-quality-loop`. Load domain skills as each step requires (`frontend-judgment`, `design-tokens`, `ui-components`, `responsive-ui`, `anti-ai-slop`, `ui-feel`, `accessibility`, `frontend-testing`, audit chain).

## Modes

- **`/polish`** — full loop (default max 3 fix cycles)
- **`/polish --max N`** — override cap
- **`/polish --audit-only-fix`** — skip blank-canvas judgment; fix from audit

`$ARGUMENTS` selects modes.

## What to do

1. Follow `ui-quality-loop` gates and cycle output template
2. Clear Critical/High only as blockers; leave Medium/Low unless asked
3. Never infinite-loop — stop at cap with remaining list
4. Do not fabricate audit metrics without tokens/screenshots
