---
name: data-fetching
description: >-
  Async UI for remote data — loading, error, retry, empty, stale, cache boundaries.
  Use when building lists, detail pages, dashboards fed by API, React Query/SWR,
  fetch/loaders, or "ambil data", "loading state API", "retry".
---

# Data Fetching

## Overview

Separate **server state** from UI chrome. Every remote surface needs loading / error / empty / success — with retry where useful.

## When to use

- Lists, detail, search results, dashboards from API
- Introducing React Query, SWR, router loaders, `useEffect` fetch
- Fixing spinner-forever or silent failure UIs

## When to skip

- Static content / mock-only prototypes with no async
- Pure presentational components receiving props only

## Workflow

1. **Choose ownership** — server state in query/loader; local UI state stays in the component
2. **Required states** — loading · error (message + retry) · empty · success
3. **UX** — skeleton/placeholder preferred over blank; don’t block the whole app for one widget when possible
4. **Errors** — user-safe message; log details; retry for transient failures
5. **Cache** — stale-while-revalidate when the stack supports it; invalidate on mutations
6. **Hand off** — presentation via `ui-components`; never paint raw hex while waiting

## Checklist

- [ ] Loading / error / empty / success covered
- [ ] Retry or clear next step on error
- [ ] Empty copy is real (not Lorem)
- [ ] Fetch logic not tangled inside giant presentational files
- [ ] Responsive + tokens still apply to async UI

## Depth

Patterns: `references/data-fetching.md`.  
State org: `references/architecture.md`.
