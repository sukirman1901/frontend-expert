# App shell & routing

Used by: `app-shell-routing`.

## Shell anatomy

```text
┌─ header / top nav ─────────────────────┐
│ brand · primary nav · utilities        │
├─ sidebar (optional) ─┬─ main ──────────┤
│ secondary nav        │ page content    │
│                      │ (outlet)        │
└──────────────────────┴─────────────────┘
```

- One **primary** navigation model (top *or* side dominant — not both competing)
- `main` (or role) wraps page content for skip links / a11y

## URL rules

| Concern | Prefer |
|---------|--------|
| Entity | `/users/:id` |
| Filters | `?status=active&q=` |
| Tabs | path segment or query — be consistent |
| Modals | optional query `?modal=edit` if shareable |

## States

- **404** — explain + link home
- **403** — explain + login/upgrade CTA
- **Index empty** — onboarding CTA not a blank outlet

## Framework notes (agnostic)

- Next App Router / Remix / Vue Router / etc. — keep loader/action data with the route
- Don’t invent a second client-only router alongside the framework

## Anti-patterns

- Entire app remounting layout per page
- Nav links without active styles
- Dead-end routes with browser Back as only escape
- Desktop sidebar with no mobile equivalent

## Related

- `responsive-ui`, `data-fetching`, `fe-architecture`
