---
name: design-fidelity
description: >-
  Spec vs implementation fidelity — Figma/Dev Mode/screenshot compare, spacing
  tolerance, token remap, close-enough rules. Use when matching a design file,
  "pixel perfect", "mirip Figma", design QA, or /design with a provided mock.
---

# Design Fidelity

## Overview

When a **design source** exists (Figma, screenshot, Spec), compare build to source and close gaps — without inventing a parallel visual system. Prefer **project tokens** over copying raw hex from the file.

## When to use

- User provides Figma / mock / screenshot and wants implementation match
- Design QA / “pixel perfect” / “mirip desain”
- `/design` audit when a reference image or file is available
- Remapping Dev Mode values onto the project token scale

## When to skip

- No design source (blank-canvas → `frontend-judgment` only)
- Pure copy/token tweak with no layout compare
- User waived fidelity (“approximate is fine”)

## Workflow

1. **Source** — note file/frame/screenshot; capture key frames at target breakpoints
2. **Structure first** — layout model, hierarchy, type ladder, Auto Layout Fill/Hug (`responsive-ui`) before pixel nits
3. **Token remap** — map Figma fills/strokes/radii/type to **project tokens** (or scored preset). Do not paste foreign hex into production CSS unless the project has no system and the tree allows it
4. **Compare** — spacing, type size/weight, radius, alignment, states (hover/focus if specified)
5. **Tolerance** — see checklist; flag only meaningful deltas
6. **Report** — Before/After or Spec vs Build table; mark remaining intentional differences

## Close-enough rules (do not bikeshed)

| Property | Usually OK | Fix |
|----------|------------|-----|
| Spacing | ±4px on dense chrome | >8px section rhythm drift |
| Type size | Nearest token step | Wrong weight / wrong role (title vs body) |
| Radius | Nearest token | Mixing 3+ one-off radii |
| Color | Token semantic match | Off-token brand / purple slop |
| Alignment | Optical nudge | Broken grid / uneven columns |

**Never** claim “100% pixel perfect” without side-by-side evidence.

## Checklist

- [ ] Design source identified (link / frame / screenshot)
- [ ] Hierarchy + Auto Layout sizing mapped before polish
- [ ] Colors/type/radius remapped to tokens (or explicit waiver)
- [ ] Primary breakpoints compared (at least phone + desktop when layout differs)
- [ ] States covered if in spec (default / hover / disabled / error)
- [ ] Remaining deltas listed (intentional vs TODO)

## Depth

Full compare workflow: `references/design-fidelity.md`.  
Layout map: `references/responsive.md` (Auto Layout ↔ CSS).  
Audit persona: `design-reviewer`.
