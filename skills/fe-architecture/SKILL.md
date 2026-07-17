---
name: fe-architecture
description: >-
  Frontend structure — feature folders, state ownership, server/client boundary,
  when not to add a global store. Use for "arsitektur FE", folder structure,
  refactor large UI, state management choice, or modularizing an app.
---

# FE Architecture

## Overview

Keep UI **modular and owned**. Prefer local state and server cache over inventing a global store.

## When to use

- Greenfield folder layout
- Refactors of tangled components
- Debates: Redux vs context vs query vs URL

## Workflow

1. **Boundaries** — feature folders (`features/billing/…`) over type folders only (`components/`, `hooks/` dump)
2. **State ladder** — local → lifted → URL → server cache → context (theme/auth) → global store **last**
3. **Server/client** — fetch on server when the stack allows; mark client islands explicitly
4. **Deps** — UI primitives don’t import feature screens; features may use shared UI
5. **Size** — split files >200 lines; colocated tests

## Checklist

- [ ] Feature ownership clear
- [ ] No unnecessary global store
- [ ] Server state not duplicated in Redux-like clients without reason
- [ ] Shared UI stays presentational

## Depth

`references/fe-architecture.md` + existing `references/architecture.md`.
