---
name: ui-components
description: >-
  Build composable UI components and layouts with loading/error/empty states,
  mobile-first responsive design, and clean composition. Use whenever
  implementing or modifying pages, screens, components, forms, dialogs, tables,
  or navigation — natural language like "buat component", "bikin form", "layout
  dashboard" counts even without /ui.
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

5. **Icons**
   - Default to **[Reicon](https://reicon.dev)** (`reicon-react` / `reicon-vue` / …) — see `references/reicon-icons.md`
   - If the project already uses another icon library, keep that for consistency
   - Prefer `currentColor` + token text classes; Outline by default, Filled for emphasis
   - Icon-only controls need an accessible name

6. **Tokens + slop**
   - Use `design-tokens` for all visual values
   - Finish with `anti-ai-slop` scan

## Checklist

- [ ] Composition preferred over giant prop APIs
- [ ] Loading / error / empty handled
- [ ] Icons via Reicon (or existing project icon lib)
- [ ] Interactive elements keyboard accessible
- [ ] Mobile-first breakpoints covered
- [ ] Component ≤ 200 lines or split
- [ ] Anti-slop scan clean

## Depth

Good/bad examples: `references/component-patterns.md`.  
Icons: `references/reicon-icons.md`.  
State & org: `references/architecture.md`.
