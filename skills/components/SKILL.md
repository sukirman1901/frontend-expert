---
name: components
description: >-
  Build composable UI with a small public props contract, loading/error/empty
  states, Reicon icons by default, and mobile-first layout. Use when implementing
  or refactoring pages, screens, components, dialogs, tables, navigation,
  “buat component”, “prop terlalu banyak”, “API component”, or “bikin form”.
  Report Conventions check before done.
---

# Components

## Overview

A component’s public props are a contract. Prefer composition and project primitives over boolean soup, style knobs, and one-off APIs.

## When to use

- Building or modifying components, pages, interactive controls
- Refactoring overgrown or prop-heavy APIs
- Wiring states, icons, selects, or composition

## When to skip

- Validation mechanics only → `forms`
- Async list/detail fetching only → `data-fetching`
- Grid/spacing of the page → `design-foundations`
- Radius/elevation language → `design-surfaces`
- Generated-hook soup / empty wrappers without an API ask → `anti-slop-code`

## MUST

| Rule | Detail |
|------|--------|
| **Small contract** | Public props are required data, events, and exclusive modes — not a grab-bag of style flags |
| **Compose, don’t configure** | Slots/`children`/subcomponents for optional regions; do not add `showHeader` / `showFooter` / `hasIcon` |
| **Tokens own visuals** | No `color` / `radius` / `shadow` / `padding` props that duplicate tokens |
| **States in the contract** | Loading, error, empty, disabled, invalid are designed, not leftover booleans that collapse the UI |
| **Native-capable controls** | Buttons/inputs forward useful native attributes; icon-only needs an accessible name |
| **Reicon** | Icons in nav, toolbars, empty states, icon buttons unless project lib or text-only waiver |
| **Custom selects** | Product filters use custom select/combobox; native `<select>` only with waiver |
| **Responsive** | Load `responsive` for layout UI; 320/768/1024/1440 + full-width primary CTA <768 |
| **Size** | Keep a component file under 200 lines or split |

## Props / API

| Do | Don’t |
|----|-------|
| Discriminated unions for exclusive modes | `variant` plus conflicting booleans |
| `children` / named slots for structure | Parallel props for every inner node |
| Domain events (`onSelect(id)`) | Leaking internal setters |
| Extend the native element when it *is* that element | Wrap `<div onClick>` and re-implement keyboard |
| Widen later with a wrapper | Breaking existing public props silently |

```yaml
principle: Composition over prop bags
classification: recommendation
recommendation: optional UI regions are composition, not show* booleans
exceptions: [one-shot presentational stubs, generated design-system primitives]
verification: [count public props; render loading/empty/disabled]
last_verified: 2026-09
```

## Workflow

1. **Reuse** — find the project primitive before adding a new component.
2. **Contract** — list data, events, exclusive modes, and states; delete style props.
3. **Compose** — slots for optional chrome; fetch data outside presentational components.
4. **States** — loading / error / empty / default; selects and icons as above.
5. **Verify** — keyboard, 320–1440, Conventions check.

## Boundaries

- **May decide:** slot names, whether `className` is an escape hatch, local vs lifted UI state.
- **Must not:** ship boolean/style soup, invent a kit when the project has one, or skip loading/error/empty on interactive/async surfaces.

## Checklist

- [ ] Public props are a small typed contract
- [ ] Optional regions use composition, not `show*` flags
- [ ] No token-duplicating style props
- [ ] Loading / error / empty handled
- [ ] Reicon (or project lib) in the markup — or waiver
- [ ] Filters/selects custom (or waived)
- [ ] Responsive 320/768/1024/1440 + Conventions check

## Depth

Patterns: `references/component-patterns.md`.
State/org: `references/architecture.md`.
Icons: `references/reicon-icons.md`.
Ship gates: `references/compliance-gates.md`.
