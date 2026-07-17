# App shell & routing

Used by: `app-shell-routing`. Optional local sandbox: `test/` (gitignored; not shipped).

## Shell anatomy (modern dashboard)

```text
┌─ topbar ──────────────────────────────────────────────────────────┐
│ [☰]  Logo+Brand ··· search? · theme · help · bell · avatar▾menu  │
├─ sidebar ────────────┬─ main ─────────────────────────────────────┤
│ collapse · nav only  │ page content (outlet)                      │
└──────────────────────┴────────────────────────────────────────────┘
```

### Topbar MUST

| Element | Rule |
|---------|------|
| Logo | SVG/img mark — letter avatar alone is a **placeholder**, replace before ship |
| Brand | Product name; hide text only if mark is unmistakable |
| Utilities | ≥1 icon action (search / bell / help) unless waived |
| Theme | Icon toggle in **utilities** (moon/sun). **Never** a labeled Dark mode button in the sidebar footer |
| Profile | **Avatar-only** trigger; open **account menu** for name/email + actions. Meta text does **not** live in the header by default — control stays on all breakpoints |

### Account menu MUST

| Rule | Detail |
|------|--------|
| Trigger | Avatar button with `aria-haspopup="menu"` / `aria-expanded` |
| Panel | Name + email in menu header; Settings / Profile / Sign out (or project equivalents) |
| Dismiss | Outside click + Escape; focus returns to trigger |
| Mobile | Same pattern — do not expand name/email into the topbar |

### Sidebar MUST

| Viewport | Pattern |
|----------|---------|
| <768 | Overlay **drawer** + **backdrop**; body scroll lock; burger ↔ close icon swap |
| 768–1023 | Prefer **auto-collapsed** icon rail (or user toggle) |
| ≥1024 | Expanded by default; toggle collapse; persist if useful |
| Content | Nav items only — no theme/account footer chrome |

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
- Theme toggle parked under sidebar nav
- Always-on name + email in the topbar (avatar + dropdown is the default)

## Related

- `responsive-ui`, `motion`, `data-fetching`, `fe-architecture`
