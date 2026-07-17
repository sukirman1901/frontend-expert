---
name: motion
description: >-
  Add purposeful UI motion and micro-interactions (Framer Motion, GSAP,
  prefers-reduced-motion). Use only when the user asks for animation, transition,
  hover/focus motion, stagger, or scroll effects — not for static layout or
  token-only work.
---

# Motion

## Overview

Motion should clarify hierarchy and feedback, not decorate. Prefer short, purposeful animations; always respect reduced motion.

## When to Use

- Micro-interactions (hover, focus, press)
- Enter/exit or layout transitions
- Scroll-linked or timeline animation (GSAP)

**Do not** load this skill for static token/layout-only tasks.

## Workflow

1. **Principles**
   - Short micro-interactions (~100–200ms)
   - UI transitions (~200–400ms)
   - Prefer ease-out for exits of attention; keep easing intentional
   - Stagger children sparingly

2. **Implementation**
   - Framer Motion: variants, layout, gestures when in React
   - GSAP: timelines, ScrollTrigger for complex sequences
   - Prefer `transform` / `opacity` (compositor-friendly)

3. **Accessibility**
   - Honor `prefers-reduced-motion`
   - Never convey meaning by motion alone

4. **Quality bar**
   - 2–3 intentional motions beat many noisy ones
   - No animation that delays primary task completion

## Checklist

- [ ] Motion has a purpose (feedback, hierarchy, continuity)
- [ ] Durations appropriate to interaction scale
- [ ] `prefers-reduced-motion` handled
- [ ] No layout-thrashing animations
- [ ] Anti-slop: motion is not decorative noise

## Depth

Full reference: `references/motion.md`.
