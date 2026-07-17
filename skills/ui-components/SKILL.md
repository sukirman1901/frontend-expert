---
name: ui-components
description: >-
  Build composable UI with loading/error/empty states, Reicon icons by default,
  mobile-first layout, and clean composition. Use whenever implementing or
  modifying pages, screens, components, forms, dialogs, tables, or navigation —
  including "buat component", "bikin form", "layout dashboard". Must report
  Conventions check (tokens/icons/states) before done — see compliance-gates.
---

# UI Components

## Overview

Implement production UI with composition over configuration, clear state handling, and components under 200 lines.

## When to Use

- Building or modifying components, pages, layouts
- Wiring interactive UI with `/ui`
- Refactoring overgrown or prop-heavy components

## Workflow

1. **Structure**
   - Prefer composition over configuration
   - Separate data fetching from presentation
   - Colocate component + test + styles when practical
   - Keep files under 200 lines (split if larger)

2. **State** (see also `references/architecture.md`)
   - Local (`useState`) → component UI
   - Lifted → 2–3 siblings
   - Context → theme, auth, locale
   - URL → filters, pagination
   - Server state (React Query/SWR) → remote data
   - Avoid prop drilling deeper than 3 levels

3. **Required UI states**
   - Loading
   - Error
   - Empty
   - Default / success

4. **Responsive**
   - Mobile-first
   - Verify 320 / 768 / 1024 / 1440
   - No fixed widths that break small screens

5. **Icons (default on — do not omit)**
   - **MUST** use **[Reicon](https://reicon.dev)** for nav, toolbars, empty states, and icon buttons unless the project already standardizes another library
   - Vanilla HTML/CSS/JS: add CDN `https://unpkg.com/reicon/cdn/reicon.min.js` + `<re-icon icon="kebab-name" size="20">`
   - React: `reicon-react`; Vue/Svelte: matching package — see `references/reicon-icons.md`
   - Prefer `currentColor` + token text classes; Outline default, Filled for emphasis
   - Icon-only controls need an accessible name
   - Text-only UI only with an explicit waiver in the Conventions check

6. **Tokens + slop**
   - Use `design-tokens` for all visual values
   - Finish with `anti-ai-slop` scan

7. **Before DONE**
   - Output **Conventions check** from `references/compliance-gates.md` (tokens, icons, states, webgl n/a, …)

## Checklist

- [ ] Composition preferred over giant prop APIs
- [ ] Loading / error / empty handled
- [ ] **Reicon (or project icon lib) actually in the markup** — not forgotten
- [ ] Interactive elements keyboard accessible
- [ ] Mobile-first breakpoints covered
- [ ] Component ≤ 200 lines or split
- [ ] Anti-slop scan clean
- [ ] Conventions check reported

## Depth

Good/bad examples: `references/component-patterns.md`.  
Icons: `references/reicon-icons.md`.  
Ship gates: `references/compliance-gates.md`.  
State & org: `references/architecture.md`.
