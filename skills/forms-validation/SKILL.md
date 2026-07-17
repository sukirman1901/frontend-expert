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

## Workflow

1. **Labels** — every input has a visible label (or `aria-label`); associate with `htmlFor` / `id`
2. **Validation** — prefer inline field errors after submit or on blur; don’t block typing with aggressive live errors
3. **Submit** — disable or show pending on the primary button; keep values on error
4. **Errors** — field-level + optional form-level summary with links to fields
5. **Progressive disclosure** — hide advanced fields until needed
6. **Mobile** — full-width controls; adequate tap targets (`responsive-ui`)

## Checklist

- [ ] Labels + focus order correct
- [ ] Error text linked to fields (`aria-describedby` / equivalent)
- [ ] Pending + error + success submit states
- [ ] No Lorem placeholder as the only copy
- [ ] Works at 320px width

## Depth

`references/forms-validation.md`. A11y: `accessibility`.
