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
- Comparing rendered directions / stressing all states → `prototype`
- Nested radius / elevation language → `design-surfaces`
- Type roles, wrapping, truncation → `design-typography`
- Conformance (contrast, names, keyboard) → `accessibility`
- Motion systems / named families → `motion`
- Copy-only / “tulisan AI” / empty-state wording → `content-design`
- “Rapikan kode” / generated implementation → `anti-slop-code`
- Backend-only edits with no rendered UI change

## MUST

| Rule | Detail |
|------|--------|
| **Rendered proof** | Judge wrapping, alignment, press, and radius from the rendered UI, not source alone |
| **Tokens first** | Use `--radius`, spacing, and type tokens; do not invent one-off values when a token exists |
| **Classify recipes** | Label `0.96`, stagger ms, and similar numbers as heuristics |
| **Cheapest valid fix** | Delete decoration → native CSS → reuse project tokens → then add abstraction |
| **Mobile craft** | Full-width primary CTA <768; safe-area on sticky chrome; thumb-reachable actions |
| **No `transition: all`** | Name properties; skip Tailwind bare `transition` |
| **Control geometry proof** | Render the complete control matrix, including pending/loading and applicable LTR/RTL, before accepting optical alignment |

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

## Control geometry

- [ ] Rendered optical variants matrix: text-only, leading icon, trailing icon, icon-only, and pending/loading.

Geometric centering (`inline-flex` / `items-center` / `justify-center`) is necessary but not proof. There is no universal pixel offset: compare the rendered matrix first, then apply the smallest compensation inside the fixed icon slot or glyph.

Judge whether the combined icon-label content group and its perceived visual mass are balanced and centered across variants and states. Assess the label baseline/cap-height relationship to the icon separately; the label itself need not occupy the control center in an icon+text variant. Verify icon visual weight, token gap, symmetric token padding, focus, hit area, disabled, and pending/loading together, with no content-group or control-width shift. Include both LTR and RTL when the product supports them.

## Workflow

1. **Scope** — name the surface; skip structural or token-system work.
2. **Scan** — rendered 1x/2x, light/dark, hover/press/focus, mobile width.
3. **Control matrix** — compare text-only, leading/trailing icon, icon-only, pending/loading, and applicable LTR/RTL at rendered size.
4. **Fix** — cheapest valid change; map values to tokens; keep optical compensation inside the icon slot.
5. **Report** — Before/After tables grouped by principle; mark uninspected states `Not verified`.

## Boundaries

- **May decide:** optical nudges, named transitions, tabular-nums, wrap helpers, press feedback when the project has none.
- **Must not:** treat `0.96`, bounce `0`, or concentric radius as universal law; polish over broken layout; replace brand fonts.

## Checklist

- [ ] Nested radii verified optically (or handed to `design-surfaces`)
- [ ] Icons optically centered where they looked off
- [ ] Full rendered control matrix checked: text-only, leading/trailing icon, icon-only, pending/loading, and LTR/RTL when applicable
- [ ] Combined icon-label group/perceived visual mass centered; label baseline/cap-height relationship, icon visual weight, and token gap/padding verified
- [ ] Focus, hit area, disabled, and loading preserve geometry without label or width shift
- [ ] No `transition: all`; hover/press interruptible
- [ ] Dynamic numbers use `tabular-nums` where they would jitter
- [ ] Headings `text-balance`; short copy `text-pretty` where useful
- [ ] Hit areas meet 44/40 guidance without overlap
- [ ] Mobile craft: full-width primary <768, safe-area, thumb zone
- [ ] Heuristics labeled; untested states marked `Not verified`

## Depth

Full examples: `references/polish.md`.
Related: `design-surfaces`, `design-foundations`, `design-typography`, `motion`, `accessibility`, `references/evidence-policy.md`.
