---
name: design-color
description: >-
  Use when creating or repairing a palette, semantic color roles, OKLCH scales,
  dark mode, contrast pairs, gamut fallbacks, “buat palet”, “warna brand”,
  “dark theme”, or color that must measurably pass accessibility requirements.
---

# Design Color

## Overview

Build color from product meaning and measured pairs. OKLCH is a useful working space, not proof that contrast or gamut requirements pass.

## When to use

- Palette, semantic roles, theme derivation, or color migration
- OKLCH, Display P3, gamut mapping, or fallback work
- Contrast, status colors, charts, or dark-mode complaints

## When to skip

- Selecting which existing token preset applies → `design-tokens`
- Accessibility audit without palette changes → `accessibility`
- Surface depth without color-system work → `design-surfaces`

## MUST

| Rule | Detail |
|---|---|
| **Preserve source** | Existing brand/project palette wins unless change is requested |
| **Semantic roles** | Name by purpose, not raw hue or component instance |
| **Measured contrast** | Test rendered foreground/background pairs; lightness heuristics are not proof |
| **Gamut safety** | Provide target-browser fallback for colors outside supported gamut |
| **Theme derivation** | Rebalance hierarchy and chroma; do not mechanically invert |
| **No color-only meaning** | Pair status with text, icon, shape, or pattern |

## Workflow

1. **Inventory** — brand colors, tokens, themes, semantics, targets, and failing pairs.
2. **Model** — choose a working space and build neutral, accent, and semantic roles.
3. **Derive** — create states and themes while preserving meaning and hierarchy.
4. **Measure** — contrast, gamut, forced-colors, and color-vision risks.
5. **Integrate** — hand final values to `design-tokens`; document method and waivers.

## Boundaries

- **May decide:** OKLCH working values and closest token mapping when no brand values exist.
- **Must not:** claim conformance from L alone, replace an existing palette casually, or treat APCA as WCAG conformance.

## Checklist

- [ ] Project/brand source and semantic roles identified
- [ ] Light/dark states and target gamut checked
- [ ] Rendered contrast pairs measured
- [ ] Method, evidence class, and fallbacks recorded

## Depth

Full guide: `references/design-color.md`.
