---
name: polish
description: >-
  Polish micro-details that make UI feel better — optical alignment, tabular
  nums, text-wrap, interruptible transitions, press feedback, hit areas, no
  transition:all. Use when building/reviewing UI polish, "feels off",
  "rapihin detail", hover/press feedback, or after anti-slop-design.
  Structural layout, radius language, and WCAG conformance belong to other owners.
---

# Polish

## Overview

After tokens, structure, and anti-slop, apply micro-craft so the UI feels right in the rendered surface. Numeric recipes here are heuristics unless a standard or project token owns them.

## When to use

- Finishing `/ui` builds (after `anti-slop-design`)
- `/polish` / “rapihin detail” / “feels off”
- Hover, press, enter/exit, icon-swap micro-interactions

## When to skip

- Structural grid/spacing/hierarchy → `design-foundations`
- Nested radius / elevation language → `design-surfaces`
- Type roles, wrapping, truncation → `design-typography`
- Conformance (contrast, names, keyboard) → `accessibility`
- Motion systems / named families → `motion`
- Copy-only or backend-only edits

## MUST

| Rule | Detail |
|------|--------|
| **Rendered proof** | Judge wrapping, alignment, press, and radius from the rendered UI, not source alone |
| **Tokens first** | Use `--radius`, spacing, and type tokens; do not invent one-off values when a token exists |
| **Classify recipes** | Label `0.96`, stagger ms, and similar numbers as heuristics |
| **Cheapest valid fix** | Delete decoration → native CSS → reuse project tokens → then add abstraction |
| **Mobile craft** | Full-width primary CTA <768; safe-area on sticky chrome; thumb-reachable actions |
| **No `transition: all`** | Name properties; skip Tailwind bare `transition` |

## Craft (starting points)

| Concern | Starting point | Class | Hand off |
|---------|----------------|-------|----------|
| Nested corners | Outer ≈ inner + inset when curves share a center | Heuristic | `design-surfaces` |
| Icon in control | Optical nudge over geometric center | Recommendation | — |
| Section depth | Project border/elevation language | Project default | `design-surfaces` |
| Hover/toggle | Interruptible CSS transitions | Recommendation | `motion` if choreography |
| Press | `scale(0.96)` if press feedback is wanted | Heuristic | — |
| Dynamic numbers | `tabular-nums` | Recommendation | `design-typography` |
| Short titles | `text-wrap: balance` | Recommendation | `design-typography` |
| Hit area | 44×44 touch / ≥40 dense desktop | Recommendation | `accessibility` for WCAG 2.5.8 (24px) |

Exceptions: pills/circles, dense toolbars (disable press-scale), reduced motion, brand language that is non-concentric, images that do not need outlines.

## Workflow

1. **Scope** — name the surface; skip structural or token-system work.
2. **Scan** — rendered 1x/2x, light/dark, hover/press/focus, mobile width.
3. **Fix** — cheapest valid change; map values to tokens.
4. **Report** — Before/After tables grouped by principle; mark uninspected states `Not verified`.

## Boundaries

- **May decide:** optical nudges, named transitions, tabular-nums, wrap helpers, press feedback when the project has none.
- **Must not:** treat `0.96`, bounce `0`, or concentric radius as universal law; polish over broken layout; replace brand fonts.

## Checklist

- [ ] Nested radii verified optically (or handed to `design-surfaces`)
- [ ] Icons optically centered where they looked off
- [ ] No `transition: all`; hover/press interruptible
- [ ] Dynamic numbers use `tabular-nums` where they would jitter
- [ ] Headings `text-balance`; short copy `text-pretty` where useful
- [ ] Hit areas meet 44/40 guidance without overlap
- [ ] Mobile craft: full-width primary <768, safe-area, thumb zone
- [ ] Heuristics labeled; untested states marked `Not verified`

## Depth

Full examples: `references/polish.md`.  
Related: `design-surfaces`, `design-foundations`, `design-typography`, `motion`, `accessibility`, `references/evidence-policy.md`.
