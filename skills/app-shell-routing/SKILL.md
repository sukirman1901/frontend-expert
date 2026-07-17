---
name: app-shell-routing
description: >-
  App shell, navigation, layouts, breadcrumbs, deep links, 404/empty routes.
  Use when building dashboard shells, side nav, top nav, multi-page flows,
  "routing", "layout app", "404", or information architecture for web apps.
  Requires modern chrome: logo, topbar theme icon, avatar→account menu,
  custom filter selects — not a bare settings page or native OS selects.
---

# App Shell & Routing

## Overview

Define **where the user is** and **how they move**. Shell (chrome) stays stable; page content swaps. Match **modern SaaS dashboard** chrome — not a blank header with only text brand.

## When to use

- New app layout, dashboard shell, marketing+app split
- Nav IA, breadcrumbs, nested routes, 404/unauthorized
- Settings / admin pages (still need full shell)

## Workflow

1. **Shell chrome (MUST for product/dashboard UI)**
   - **Logo** — real mark (SVG/img), not a letter in a box alone
   - **Brand name** visible next to logo (can truncate on tiny widths)
   - **Utilities** — at least 1–2 of: search, notifications, help (icon buttons OK)
   - **Theme** — if light/dark exists, put it in **topbar utilities** as an **icon toggle** (moon/sun). Do **not** park a labeled “Dark mode” button in the sidebar footer
   - **Profile** — **avatar-only** control in the topbar at **all** breakpoints; name/email live in an **account dropdown** on click — never `display:none` the whole account control on mobile; do **not** spill name/email into the header chrome by default
   - Anatomy: `brand · (optional primary nav) · utilities (theme/help/bell) · avatar menu`
2. **Sidebar**
   - Desktop: persistent rail; support **collapse → icon-only** (≥768)
   - Prefer **auto-collapse** near tablet / narrow desktop; remember preference when useful
   - Mobile: **overlay drawer + backdrop** (not push-down accordion under the header) — see `responsive-ui`
   - Sidebar is for **nav**, not theme/account chrome
3. **IA** — primary nav ≤7 items; nest the rest; active state clear
4. **Routing** — URLs reflect location; filters in query when shareable
5. **Fallbacks** — 404, empty route, unauthorized → clear CTA
6. **Motion** — load `motion` for shell/drawer/section enter (light defaults)

## Checklist

- [ ] Logo mark + brand (not letter-only placeholder as the final chrome)
- [ ] Theme toggle in topbar utilities (if theming) — not sidebar footer
- [ ] Avatar-only profile → account dropdown (name/email inside menu)
- [ ] Utility cluster present (or explicit waiver: minimal tool)
- [ ] Sidebar collapse (desktop) + drawer+backdrop (mobile)
- [ ] Main landmark; active nav indication
- [ ] 404 / empty route handled when multi-route
- [ ] Icons via Reicon (or project lib) on nav items

## Anti-patterns (fail / High)

- Header = brand text only, no logo/utilities/profile
- Theme as a full-width labeled button under the sidebar nav
- Name + email always visible in the topbar (use avatar + menu instead)
- Hiding profile entirely below a breakpoint
- Mobile nav that pushes content down while burger stays visible as a second competing control
- Sidebar that never collapses on mid-width dashboards

## Depth

`references/app-shell-routing.md`.  
Drawer rules: `references/responsive.md`.  
Optional local sandbox: `test/` (gitignored; not shipped).
