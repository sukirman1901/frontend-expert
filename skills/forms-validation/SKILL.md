---
name: forms-validation
description: >-
  Accessible forms, field/form errors, submit pending, wizards, progressive
  disclosure. Use when building or fixing forms, login, settings, checkout,
  filters, "validasi", "form error", or multi-step flows.
---

# Forms & Validation

## Overview

Forms must be keyboard-accessible, show clear errors, and never lose user input on soft failures.

## When to use

- Any form, wizard, filter bar with submit
- Auth, settings, checkout, create/edit dialogs

## When to skip

- Read-only detail with no inputs
- Pure button that is not a form submit

## MUST (ship)

| Rule | Detail |
|------|--------|
| **Labels** | Every control has a visible label or `aria-label`; `htmlFor`/`id` associated |
| **Errors** | Text + association (`aria-describedby` / equivalent) — not border-only |
| **Submit** | Pending/disabled while in flight; values kept on 4xx/5xx |
| **Focus** | On submit failure, move focus to first invalid field |
| **Mobile** | Primary submit `width: 100%` below 768; inputs `font-size ≥ 16px` |
| **No Lorem** | Real hint/error copy |

## Workflow

1. **Labels** — visible label (or `aria-label`); associate with `htmlFor` / `id`
2. **Validation** — prefer inline field errors after submit or on blur; don’t block typing with aggressive live errors
3. **Submit** — disable or show pending on the primary button; keep values on error
4. **Errors** — field-level + optional form-level summary with links to fields
5. **Progressive disclosure** — hide advanced fields until needed
6. **Mobile** — full-width primary submit; adequate tap targets (`responsive-ui`)
7. **Async submit** — pair with `data-fetching` for retry/toast; never wipe the form on soft fail

## Agent boundaries

- **May decide:** validation timing (submit vs blur), wizard step count, inline vs summary errors
- **Must not:** invent purple/error hex off-token; skip labels for “clean UI”; use `alert()` for validation

## Checklist

- [ ] Labels + focus order correct
- [ ] Error text linked to fields (`aria-describedby` / equivalent)
- [ ] Pending + error + success submit states
- [ ] First invalid field focused after failed submit
- [ ] No Lorem placeholder as the only copy
- [ ] Full-width primary + ≥16px inputs at 320px
- [ ] Works at 320px width (no horizontal overflow)

## Depth

`references/forms-validation.md`. A11y: `accessibility`. Responsive: `responsive-ui`.
