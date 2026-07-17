---
name: app-shell-routing
description: >-
  App shell, navigation, layouts, breadcrumbs, deep links, 404/empty routes.
  Use when building dashboards shells, side nav, top nav, multi-page flows,
  "routing", "layout app", "404", or information architecture for web apps.
---

# App Shell & Routing

## Overview

Define **where the user is** and **how they move**. Shell (chrome) stays stable; page content swaps.

## When to use

- New app layout, dashboard shell, marketing+app split
- Nav IA, breadcrumbs, nested routes, 404/unauthorized

## Workflow

1. **Shell** — header/nav/sidebar + main landmark; don’t remount chrome on every child route
2. **IA** — primary nav ≤7 items; nest the rest; active state clear
3. **Routing** — URLs reflect location; filters in query when shareable
4. **Fallbacks** — 404, empty route, unauthorized → clear CTA home/login
5. **Deep links** — detail pages load from URL alone (pair with `data-fetching`)
6. **Responsive** — side nav → drawer on small (`responsive-ui`)

## Checklist

- [ ] Main content in a landmark / primary region
- [ ] Active nav indication
- [ ] 404 / empty route handled
- [ ] Mobile nav pattern defined
- [ ] Icons via Reicon (or project lib) on nav items

## Depth

`references/app-shell-routing.md`.
