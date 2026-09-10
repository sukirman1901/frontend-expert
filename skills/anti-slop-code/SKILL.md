---
name: anti-slop-code
description: >-
  Detect and fix AI-generated frontend implementation slop: needless useEffect,
  any / type lies, empty wrappers, premature abstractions, eslint-disable
  spray, and swallowed errors. Trigger for “kode terasa AI”, “rapikan kode”,
  “generated React”, “too many useEffect”, “over-engineered”, or “wrapper
  kosong”. Visual slop stays on anti-slop-design; copy stays on content-design.
---

# Anti-slop Code

## Overview

Generated UI code has recognizable tells. Delete and simplify until the module does one job. Do not treat a visual restyle or a folder rewrite as a code-slop fix.

## When to use

- Implementing or reviewing React/FE modules that look generated
- “Rapikan kode” / over-engineered hooks / eslint-disable spray
- Cleaning a screen **without** changing layout, brand, or copy

## When to skip

- Purple/gradients/Lorem-as-layout → `anti-slop-design`
- Generic marketing/UI sentences → `content-design`
- Public props/`show*` soup → `components`
- Feature folders / state ladder / global store → `architecture`
- Query/loader/cache → `data-fetching`
- Security hardening (XSS, CSP, secrets) — out of this skill

## MUST

| Rule | Detail |
|------|--------|
| **Preserve behavior** | Same user-visible states unless the user asked to change UX |
| **Effects are sync** | Derived values render; effects talk to *external* systems |
| **Honest types** | No `any` or `as unknown as` without a recorded reason |
| **Delete first** | One-shot wrappers, unused exports, fake `setTimeout` loading |
| **Second-use extract** | Don’t add a util/hook/context for a single call site |
| **Errors surface** | Don’t swallow; fetch failures belong with `data-fetching` |

## Workflow

1. **Scan** — effects, type lies, wrappers, disable comments, duplication.
2. **Handoff** — route visual/copy/API/folder/fetch concerns to their owners.
3. **Delete** — dead code and abstractions that hide one line.
4. **Simplify** — derive in render; name the real boundary; keep project conventions.
5. **Verify** — loading/error/empty still exist; UI unchanged unless asked.

## Boundaries

- **May decide:** inline vs a helper once a second call site exists; keep a disable with a one-line reason.
- **Must not:** restyle the UI, invent a store, extract a kit, or run a security pass under this name.

## Checklist

- [ ] Derived state is not an effect
- [ ] No unexplained `any` / type assertion / eslint-disable
- [ ] No single-use wrapper or util
- [ ] Errors and async states still visible
- [ ] Visuals, copy, and folders unchanged unless those skills were in scope

## Depth

Full catalog: `references/anti-slop-code.md`.
Visual catalog: `references/anti-patterns.md`.
State/folders: `references/fe-architecture.md`.
