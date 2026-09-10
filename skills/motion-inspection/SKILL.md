---
name: motion-inspection
description: >-
  Inspect rendered UI motion frame by frame: start, mid, end, interrupt, and
  reduced-motion. Reverse-engineer unnamed animation into families/patterns from
  motion-families.md. Trigger for “inspeksi animasi”, “frame by frame”, “kenapa
  animasinya aneh”, “jelaskan transisi”, or reverse-engineer motion. Implementing
  new motion stays on motion; decorative spam stays on anti-slop-design.
---

# Motion Inspection

## Overview

Source duration is not proof. Play the animation (or mark **Not verified**). Name what it actually does at start / mid / end, whether it can be interrupted, and whether reduced-motion was observed. Then map it to catalog families/patterns.

## When to use

- Explain, debug, or audit existing transitions
- “Kenapa animasinya aneh” / frame-by-frame / reverse-engineer motion
- `/design` on animated UI when claims depend on how it *plays*
- Naming a mystery transition before changing it

## When to skip

- Implementing new motion from a named pattern → `motion`
- Decorative stack / motion spam as a visual tell → `anti-slop-design` (then inspect leftovers here)
- Press-scale / duration heuristics on a new control → `polish` + `motion`
- Comparing layout directions → `prototype`
- WCAG classification of the target → `accessibility`

## MUST

| Rule | Detail |
|------|--------|
| **Rendered** | Play or step the motion; do not pass from CSS/`transition` text alone |
| **Not verified** | If it was not played, say so — never “smooth” / “perfect” |
| **Beats** | Record start, mid, end, interrupt (click/focus/route away), reduced-motion |
| **Name it** | Map to ≤2 families and named patterns in `motion-families.md` |
| **Meaning** | If the only cue is motion, that is a defect — hand copy/a11y owners |
| **Fix via `motion`** | Inspection does not ship a new stack; implementation follows `motion` |

## Workflow

1. **Scope** — which transition, trigger, and viewport.
2. **Play** — full run, mid-interrupt, reduced-motion (or Not verified).
3. **Name** — family/pattern from the catalog; flag unnamed one-offs.
4. **Budget** — count intentional motions in the viewport (≤2–3 is the pack default).
5. **Handoff** — spam → `anti-slop-design`; implement/fix → `motion`; conformance → `accessibility`.

## Boundaries

- **May decide:** whether a shell default is enough vs a named marketing pattern.
- **Must not:** invent pattern names, claim scores without playback, or replace `motion` with a registry install.

## Checklist

- [ ] Playback (or Not verified) for start / mid / end
- [ ] Interrupt and reduced-motion checked or labeled
- [ ] Families/patterns named from the catalog
- [ ] Viewport motion budget noted
- [ ] Fixes routed to `motion` / `anti-slop-design` / `accessibility`

## Depth

Inspection protocol: `references/motion-inspection.md`.
Vocabulary: `references/motion-families.md`.
Implementation: `skills/motion/SKILL.md`.
