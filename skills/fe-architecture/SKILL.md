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

## When to skip

- Single-file prototype the user wants kept flat
- Pure visual polish with no structure ask

## MUST (agent decisions)

| Decision | Default |
|----------|---------|
| **Folders** | Feature cohesion (`features/x/`) over dumping everything in `components/` |
| **Remote data** | Query/loader (`data-fetching`) — not a global store of server entities |
| **URL state** | Shareable filters/tabs in the URL |
| **Global store** | **Last resort** — only after local → lift → URL → server cache → context |
| **File size** | Split presentational files >~200 lines; colocated tests when testing |

## Workflow

1. **Boundaries** — feature folders over type-only dumps
2. **State ladder** — local → lifted → URL → server cache → context (theme/auth) → global store **last**
3. **Server/client** — fetch on server when the stack allows; mark client islands explicitly
4. **Deps** — UI primitives don’t import feature screens; features may use shared UI
5. **Size** — split files >200 lines; colocated tests

## Agent boundaries

- **May decide:** Feature vs route folder names; query lib; whether auth lives in context/session
- **Must not:** Add Redux/Zustand “by default”; put every form field in a global store; create circular feature imports

## Checklist

- [ ] Feature ownership clear
- [ ] No unnecessary global store
- [ ] Server state not duplicated in client stores without reason
- [ ] Shared UI stays presentational
- [ ] State ladder documented in handoff when non-trivial

## Depth

`references/fe-architecture.md` + existing `references/architecture.md`.
