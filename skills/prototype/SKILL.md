---
name: prototype
description: >-
  Render 2–3 distinct UI directions side by side and stress-test component
  states (loading, error, empty, disabled, overflow) before committing to one
  production layout. Trigger for “prototype”, “varian”, “side-by-side”,
  “bandingkan arah”, “tunjukkan 2 opsi”, or “cek semua state”. Text-only axes
  stay on design-direction; frame-by-frame motion is not this skill.
---

# Prototype

## Overview

Judgment without a render is three similar skins. This skill **shows** 2–3 directions on distinct axes, then presses real states. Pick one variant before the production build chain.

## When to use

- User asks to prototype, compare, or see options on screen
- After `design-direction` when they need proof, not another paragraph
- Stress-test states on an existing component or chosen variant
- Blank-canvas UI where shipping one layout would hide the other axes

## When to skip

- Text approaches only / still choosing an axis → `design-direction`
- “Langsung saja” / direction already locked → build chain
- Micro polish on one chosen UI → `polish`
- Visual AI-slop audit → `anti-slop-design`
- Pixel/Figma match → `fidelity`
- Frame-by-frame motion / reverse-engineering animation → not this skill (`motion` implements; inspection is later)

## MUST

| Rule | Detail |
|------|--------|
| **Rendered, not sketched** | Variants are real markup/CSS in the project stack — not ASCII mockups as the deliverable |
| **Distinct axes** | 2–3 options; each changes hierarchy, layout, density, interaction, or expression — not hue-only skins |
| **Shared facts** | Same product content, tokens/project system, and constraints across variants |
| **Cap** | Do not emit 5 coded mocks or keep all variants in the shipped product |
| **Stress states** | Default, loading, empty, error, disabled, long/localized text, 320px overflow |
| **Pick then build** | Name the winner; then `design-foundations` → tokens → components |

## Workflow

1. **Inherit** — load `design-direction` first if axes are not yet named.
2. **Render** — place 2–3 variants side by side (≥1024) or stacked (<768).
3. **Stress** — run the state matrix on the recommended variant (all variants if cheap).
4. **Recommend** — one winner + why; wait unless they already picked.
5. **Discard** — delete or isolate losing variants; do not ship a gallery as the app.
6. **Handoff** — foundations → tokens → (+ shell/data/forms) → components → rest of `/ui`.

## Boundaries

- **May decide:** stacked vs split comparison; which variant to stress first.
- **Must not:** invent copy/metrics, restyle tokens per variant, treat this as a Figma file, or inspect animation frame-by-frame.

## Checklist

- [ ] Axes named (or `design-direction` skipped for a locked direction)
- [ ] 2–3 rendered variants on distinct axes
- [ ] State matrix exercised
- [ ] One winner chosen; losers not in the production tree
- [ ] Build chain continues from foundations/tokens

## Depth

How to compare and stress: `references/prototype.md`.
Axes: `references/design-axes.md`.
States chrome: `references/data-fetching.md` / `references/component-patterns.md`.
