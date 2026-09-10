---
name: design-foundations
description: >-
  Use when creating or repairing the structural layout of a web screen: grid,
  spacing rhythm, alignment, hierarchy, density, composition, whitespace, or
  content grouping.   Trigger for blank layouts, inconsistent spacing, weak
  hierarchy, cluttered screens, "layout terasa berantakan", "struktur layout",
  or "rapikan struktur". Skip isolated
  color, typography, component-state, motion, and micro-polish changes.
---

# Design Foundations

## Overview

Build structural order from content priority and user tasks. This skill owns relationships and layout logic, then hands token values and domain styling to their canonical owners.

## When to use

- Creating a screen or materially restructuring its layout
- Repairing inconsistent spacing, weak hierarchy, clutter, or broken grouping
- Choosing grid, container, alignment, density, whitespace, or section cadence
- Checking whether realistic content destabilizes the composition

## When to skip

- Isolated color or theme work → `design-color`
- Type selection or type-scale work → `design-typography`
- Component states or composition without layout change → `components`
- Motion-only or micro-polish changes → `motion` / `polish`

## Ownership

| Concern | Owner / handoff |
|---|---|
| Product emphasis and primary task | `design-direction` sets intent; foundations turns it into focal composition |
| Grid, containers, cadence, alignment, grouping, density, whitespace | `design-foundations` |
| Spacing and size values | Foundations defines relationships; `tokens` supplies values |
| Type roles, scale, wrapping rules | `design-typography` |
| Palette and contrast system | `design-color` |
| Radius, border, elevation, and surface styling | `design-surfaces` |
| Reusable UI behavior and states | `components` |
| Breakpoint transformations and device verification | `responsive` |
| Optical cleanup after structure is sound | `polish` |

## MUST

| Rule | Detail |
|---|---|
| **Content before geometry** | Inventory priority, tasks, content shapes, and constraints before choosing layout |
| **Relationships before values** | Define container, grid, spacing, alignment, nesting, and focal relationships; obtain values from `tokens` |
| **Shared anchors** | Use deliberate edges, centers, or baselines; explain intentional exceptions |
| **Hierarchy through composition** | Give the primary task one clear focal path; group related content and separate unlike content |
| **Density is contextual** | Match task frequency, scan depth, and disclosure needs; never impose a universal density |
| **Stress real content** | Verify short, long, missing, repeated, localized, and stateful content before handoff |
| **No universal geometry** | Do not hardcode one column count, container width, density, or nesting formula for every screen |

## Workflow

1. **Inventory** — list user tasks, content priority, content shapes, actions, states, and constraints.
2. **Structure** — choose container and grid relationships; map groups and the primary focal path.
3. **Rhythm** — define a small set of spacing relationships and section cadence, then request token values.
4. **Align** — establish shared edges, baselines, axes, and intentional alignment breaks.
5. **Density** — tune grouping, whitespace, progressive disclosure, and scan depth for the task.
6. **Stress** — test the content stress matrix and nested/inset geometry with realistic data.
7. **Hand off** — route type, color, surfaces, components, breakpoints, and optical finishing to canonical owners.
8. **Verify** — confirm the hierarchy survives responsive transformations and realistic content.

## Agent boundaries

- **May decide:** grid/container strategy, spacing relationships, section cadence, shared anchors, focal composition, density/grouping, whitespace, nesting/inset relationships, and content-stability corrections.
- **Must coordinate:** intent with `design-direction`; values with `tokens`; type with `design-typography`; color with `design-color`; surface treatment with `design-surfaces`; behavior with `components`; breakpoint transformations with `responsive`; final optical correction with `polish`.
- **Must not:** duplicate radius, color, type, breakpoint, or motion rules; prescribe universal dimensions; treat every group as a card; polish around unresolved structural problems.

## Checklist

- [ ] Primary task and content priority are visible in the composition
- [ ] Container/grid strategy and shared anchors are explicit
- [ ] Spacing cadence is relational and mapped to project tokens
- [ ] Density, grouping, whitespace, and nesting support scanning
- [ ] Realistic-content stress cases do not collapse the structure
- [ ] Canonical owner handoffs are complete
- [ ] Responsive transformations and conventions check reported

## Depth

Full guide: `references/design-foundations.md`.
