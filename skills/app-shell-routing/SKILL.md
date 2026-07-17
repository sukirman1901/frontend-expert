---
name: app-shell-routing
description: >-
  App shell, navigation, layouts, breadcrumbs, deep links, 404/empty routes.
  Use when building dashboards shells, side nav, top nav, multi-page flows,
  "routing", "layout app", "404", or information architecture for web apps.
  Requires modern chrome: logo, utilities, profile — not a bare settings page.
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
   - **Profile** — avatar (+ name/email when space) at **all** breakpoints — never `display:none` the whole account control on mobile
   - Anatomy: `brand · (optional primary nav) · utilities · profile`
2. **Sidebar**
   - Desktop: persistent rail; support **collapse → icon-only** (≥768)
   - Prefer **auto-collapse** near tablet / narrow desktop; remember preference when useful
   - Mobile: **overlay drawer + backdrop** (not push-down accordion under the header) — see `responsive-ui`
3. **IA** — primary nav ≤7 items; nest the rest; active state clear
4. **Routing** — URLs reflect location; filters in query when shareable
5. **Fallbacks** — 404, empty route, unauthorized → clear CTA
6. **Motion** — load `motion` for shell/drawer/section enter (light defaults)

## Checklist

- [ ] Logo mark + brand (not letter-only placeholder as the final chrome)
- [ ] Profile/avatar reachable on mobile and desktop
- [ ] Utility cluster present (or explicit waiver: minimal tool)
- [ ] Sidebar collapse (desktop) + drawer+backdrop (mobile)
- [ ] Main landmark; active nav indication
- [ ] 404 / empty route handled when multi-route
- [ ] Icons via Reicon (or project lib) on nav items

## Anti-patterns (fail / High)

- Header = brand text only, no logo/utilities/profile
- Hiding profile entirely below a breakpoint
- Mobile nav that pushes content down while burger stays visible as a second competing control
- Sidebar that never collapses on mid-width dashboards

## Depth

`references/app-shell-routing.md`.  
Drawer rules: `references/responsive.md`.  
Demo reference: `test/` settings shell.
