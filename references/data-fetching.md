# Data fetching (async UI)

Used by: `data-fetching`.

## Principles

1. **Server state ≠ UI state** — filters in URL when shareable; remote entities in query cache/loader
2. **Four states minimum** — loading, error, empty, success
3. **Fail visibly** — never swallow errors into a blank screen
4. **Conventions** — States line must say loading/empty/error covered when shipping async UI
5. **Optimistic UI** only when rollback is defined

## Four states (MUST)

| State | Ship |
|-------|------|
| Loading | Skeleton/placeholder local to the widget |
| Error | Message + Retry |
| Empty | Real copy + optional CTA |
| Success | Render data |

## Patterns

### Query (read)

```text
mount/navigate → fetch → 
  pending: skeleton
  error: message + Retry
  success + length 0: empty state
  success + data: render
```

### Mutation (write)

```text
submit → pending on control →
  error: field or form-level message
  success: invalidate queries / navigate / toast
```

### Framework-agnostic notes

| Stack | Prefer |
|-------|--------|
| React | TanStack Query / SWR / router `loader` + `useFetcher` |
| Vue | TanStack Query / Pinia for client-only; prefer query for remote |
| Vanilla | Explicit state machine; abort `fetch` on unmount |

## Anti-patterns

- `useEffect` fetch with no cleanup / race handling
- Global spinner for every tiny request
- Error as `console.log` only
- Mixing 5 endpoints’ loading flags in one mega-component

## Related

- `forms-validation` for submit pipelines  
- `frontend-testing` for MSW / loading assertions  
- `responsive-ui` for skeleton layouts on small screens  
- `compliance-gates.md` States line
