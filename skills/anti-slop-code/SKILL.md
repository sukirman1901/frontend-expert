---
name: anti-slop-code
description: >-
  Detect and fix AI-generated frontend implementation slop: isolated helpers that
  ignore other modules, needless useEffect, type lies, empty wrappers, and
  boilerplate error handling that misses field edge cases. Trigger for “kode
  terasa AI”, “rapikan kode”, “dampak ke modul lain”, “edge case”, “error
  handling generik”, “too many useEffect”, or “over-engineered”. Visual slop
  stays on anti-slop-design; copy stays on content-design.
---

# Anti-slop Code

## Overview

Generated code often looks tidy **inside one function** while ignoring callers, shared cache, server round-trips, and failures seen in the field. Scan blast radius first. Do not treat a visual restyle or a folder rewrite as a code-slop fix.

## When to use

- Implementing or reviewing React/FE modules that look generated
- “Rapikan kode” / over-engineered hooks / eslint-disable spray
- A change that may hit other modules, cache, or server load
- Generic `try/catch` or toast that skips real failure modes
- Cleaning a screen **without** changing layout, brand, or copy

## When to skip

- Purple/gradients/Lorem-as-layout → `anti-slop-design`
- Generic marketing/UI sentences → `content-design`
- Public props/`show*` soup → `components`
- Feature folders / state ladder / global store → `architecture`
- Query/loader chrome (skeleton, retry control) → `data-fetching`
- Measured LCP/INP/CLS campaigns → `performance`
- Security hardening (XSS, CSP, secrets) — out of this skill

## MUST

| Rule | Detail |
|------|--------|
| **Blast radius** | Name callers, sibling modules, shared types, cache keys, and server calls this change touches |
| **Not isolated** | Do not “fix” one helper by duplicating fetch, invalidating the world, or shifting load onto the client |
| **Preserve intended UX** | Same product behavior unless the user asked to change it; covering missed failures is required |
| **Effects are sync** | Derived values render; effects talk to *external* systems |
| **Honest types** | No `any` or `as unknown as` without a recorded reason |
| **Delete first** | One-shot wrappers, unused exports, fake `setTimeout` loading |
| **Second-use extract** | Don’t add a util/hook/context for a single call site |
| **Field errors** | Map this surface’s failures; never one generic catch/toast. Unknown modes are labeled, not invented |

## Workflow

1. **Context** — callers, shared cache, existing loaders, server round-trips, scale (list size, chatty calls).
2. **Scan** — effects, type lies, wrappers, disable comments, isolated helpers.
3. **Failures** — abort, auth, empty vs 404, conflict, 429, validation, partial, offline, double-submit.
4. **Handoff** — visual/copy/API/folder/fetch-chrome/CWV to their owners.
5. **Simplify** — delete; share existing data; keep project conventions.
6. **Verify** — neighboring modules still compile/behave; loading/error/empty remain; UI unchanged unless asked.

## Boundaries

- **May decide:** inline vs a helper once a second call site exists; keep a disable with a one-line reason.
- **Must not:** restyle the UI, invent a store, extract a kit, fabricate retry/idempotency, or run a security pass under this name.

## Checklist

- [ ] Blast radius named (modules / cache / server)
- [ ] No new isolated fetch or unbounded client work
- [ ] Derived state is not an effect
- [ ] No unexplained `any` / type assertion / eslint-disable
- [ ] Failure modes listed; generic catch replaced or labeled unknown
- [ ] Visuals, copy, and folders unchanged unless those skills were in scope

## Depth

Full catalog: `references/anti-slop-code.md`.
Visual catalog: `references/anti-patterns.md`.
State/folders: `references/fe-architecture.md`.
Async chrome: `references/data-fetching.md`.
