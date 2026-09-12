---
name: design-surfaces
description: >-
  Use when styling cards, dialogs, modals, panels, borders, shadows, elevation,
  overlays, nested radii, “radius terasa aneh”, “shadow kasar”, or surfaces
  that lose hierarchy between light and dark themes.
---

# Design Surfaces

## Overview

Surface styling communicates grouping, hierarchy, and state. Geometry and depth follow the project language before any standalone recipe.

## When to use

- Nested cards/panels, modal layers, overlays, dividers, or elevation
- Radius mismatch, harsh shadows, excessive borders, or dark-theme flattening
- Button/control families whose radii drift across text, icon, and state variants
- Creating surface tokens or auditing nested containers

## When to skip

- Palette construction → `design-color`
- Large layout grouping → `design-foundations`
- Enter/exit behavior → `motion`

## MUST

| Rule | Detail |
|---|---|
| **Project language first** | Reuse existing radius, border, and elevation tokens |
| **Control-family consistency** | Buttons and related controls use project radius tokens across text/icon variants and states |
| **Purposeful depth** | Borders structure; shadows/tonal steps may convey elevation |
| **Conditional concentricity** | Outer ≈ inner + inset only when curves share a visual center |
| **State-aware** | Verify hover, focus, selected, disabled, overlay, light, and dark as relevant |
| **No card nesting habit** | Add a surface only when it communicates a boundary or level |

## Workflow

1. **Inventory** — tokens, nesting, surface jobs, themes, and interaction states.
2. **Simplify** — remove redundant wrappers, borders, and competing elevation.
3. **Align** — correct radius geometry and structural separators; compare the control family as a matrix.
4. **Tune** — dark/light tonal separation, shadow opacity, backdrop, and outline.
5. **Verify** — rendered themes, states, small sizes, zoom, and clipping.

## Boundaries

- **May decide:** border, tone, or shadow when the project has no established depth language.
- **Must not:** make every region a card, apply a radius formula universally, or use shadow as the only focus/state cue.

## Checklist

- [ ] Every surface has a grouping, hierarchy, or state job
- [ ] Nested geometry and exceptional shapes checked
- [ ] Modified button/control families use project radius tokens; text/icon variants and relevant states stay geometrically and optically balanced
- [ ] Light/dark and interaction states rendered
- [ ] Heuristics and waivers identified

## Depth

Full guide: `references/design-surfaces.md`.
