---
name: data-fetching
description: >-
  Async UI for remote data — loading, error, retry, empty, stale, cache boundaries.
  Use when building lists, detail pages, dashboards fed by API, React Query/SWR,
  fetch/loaders, or "ambil data", "loading state API", "retry".
---

# Data Fetching

## Overview

Separate **server state** from UI chrome. Every remote surface needs loading / error / empty / success — with retry where useful. Parity with Conventions **States** line.

## When to use

- Lists, detail, search results, dashboards from API
- Introducing React Query, SWR, router loaders, `useEffect` fetch
- Fixing spinner-forever or silent failure UIs

## When to skip

- Static content / mock-only prototypes with no async
- Pure presentational components receiving props only

## MUST (ship)

| State | Required UX |
|-------|-------------|
| **Loading** | Skeleton/placeholder — not a blank hole (prefer local to the widget) |
| **Error** | User-safe message + **Retry** (or clear next step) |
| **Empty** | Real empty copy + optional action (not Lorem) |
| **Success** | Render data; don’t leave stale error UI |

Also: abort/cancel on unmount when using raw `fetch`; don’t block the whole app shell for one panel.

## Workflow

1. **Choose ownership** — server state in query/loader; local UI state stays in the component
2. **Required states** — loading · error (message + retry) · empty · success
3. **UX** — skeleton preferred; isolate loading to the widget when possible
4. **Errors** — user-safe message; log details; retry for transient failures
5. **Cache** — stale-while-revalidate when the stack supports it; invalidate on mutations
6. **Hand off** — presentation via `ui-components`; tokens + `responsive-ui` still apply
7. **Conventions** — report `States: loading / empty / error covered? yes`

## Agent boundaries

- **May decide:** Query lib vs loader vs `useEffect` machine; skeleton vs spinner; toast vs inline error
- **Must not:** Swallow errors to `console.log` only; ship success-only UI; invent off-token loading colors

## Checklist

- [ ] Loading / error / empty / success covered
- [ ] Retry or clear next step on error
- [ ] Empty copy is real (not Lorem)
- [ ] Fetch logic not tangled inside giant presentational files
- [ ] Race/unmount handled for raw fetch
- [ ] Responsive + tokens still apply to async UI
- [ ] Conventions States line filled when shipping

## Depth

Patterns: `references/data-fetching.md`.  
State org: `references/architecture.md`.  
Ship gate: `references/compliance-gates.md` (States).
