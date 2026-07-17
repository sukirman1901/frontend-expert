---
name: responsive-ui
description: >-
  Mobile-first responsive UI for all devices (320–1440+): no horizontal scroll,
  44px tap targets, adaptive tables/nav/forms. REQUIRED on every user-facing
  page/layout/component build — including "mobile", "responsive", "tablet",
  "breakpoint", or shipping UI with /ui /polish. Report Responsive in Conventions check.
---

# Responsive UI

## Overview

Ship layouts that work on **all devices** — phone floor through desktop. Not React Native: responsive **web**.

## When to use

- Every `/ui` / polish build that touches layout
- “Mobile”, “responsive”, “tablet”, “semua device”
- Tables, dashboards, nav, forms, marketing pages

## When to skip

- Pure token/color tweak with no layout change (still keep existing responsive behavior)
- Explicit waiver: desktop-only internal tool (must state in Conventions)

## Workflow

1. **Mobile-first** — base styles for ~320px; enhance at 768 / 1024 / 1440
2. **Check** — no horizontal page scroll; primary actions reachable; tap targets ≥44px
3. **Adapt content** — tables → cards/stack; side nav → drawer; don’t hide without alternative
4. **Report** — Conventions: `Responsive: 320/768/1024/1440 checked`

## Checklist

- [ ] Verified (or reasoned) at 320 / 768 / 1024 / 1440
- [ ] No page-level horizontal overflow
- [ ] Touch targets adequate for primary controls
- [ ] Dense desktop patterns have small-screen alternatives
- [ ] Conventions Responsive line filled

## Depth

Full rules + patterns: `references/responsive.md`.  
Ship gate: `references/compliance-gates.md`.
