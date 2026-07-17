# App shell & routing

Used by: `app-shell-routing`. Reference implementation: `test/`.

## Shell anatomy (modern dashboard)

```text
┌─ topbar ──────────────────────────────────────────────┐
│ [☰ mobile]  Logo+Brand ··· utilities · profile/avatar │
├─ sidebar ────────────┬─ main ─────────────────────────┤
│ collapse · nav items │ page content (outlet)          │
└──────────────────────┴────────────────────────────────┘
```

### Topbar MUST

| Element | Rule |
|---------|------|
| Logo | SVG/img mark — letter avatar alone is a **placeholder**, replace before ship |
| Brand | Product name; hide text only if mark is unmistakable |
| Utilities | ≥1 icon action (search / bell / help) unless waived |
| Profile | Avatar always; meta text can hide on xs — **control stays** |

### Sidebar MUST

| Viewport | Pattern |
|----------|---------|
| <768 | Overlay **drawer** + **backdrop**; body scroll lock; burger ↔ close icon swap |
| 768–1023 | Prefer **auto-collapsed** icon rail (or user toggle) |
| ≥1024 | Expanded by default; toggle collapse; persist if useful |

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
- Desktop sidebar with no mobile drawer equivalent
- Push-down mobile nav under a sticky header with a still-visible Menu button
- Profile `display: none` on small screens

## Related

- `responsive-ui`, `motion`, `data-fetching`, `fe-architecture`
