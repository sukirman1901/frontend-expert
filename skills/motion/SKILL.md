---
name: motion
description: >-
  Purposeful UI motion — section enter/exit fade, drawer slides, smooth scroll,
  micro press/hover (Framer Motion, GSAP, CSS). Use for animation requests AND
  as a light default when shipping app shells, dashboards, multi-section pages,
  or /ui layout work — not for pure token-color tweaks.
---

# Motion

## Overview

Motion should clarify hierarchy and feedback, not decorate. Prefer short, purposeful animations; always respect reduced motion.

## When to Use

- Micro-interactions (hover, focus, press)
- Enter/exit or layout transitions (section swaps, drawers, modals)
- Scroll-linked or timeline animation (GSAP)
- **Default (light):** app shell / dashboard / multi-panel settings when building with `/ui` — at least section fade + drawer slide + `scroll-behavior: smooth` (unless user forbids motion)

## When to skip

- Static token/color-only tweaks
- User asked for zero animation / “tanpa animasi”
- Prefers-reduced-motion environments (still ship CSS that disables)

## Workflow

1. **Principles**
   - Short micro-interactions (~100–200ms)
   - UI transitions (~200–400ms)
   - Prefer ease-out; keep easing intentional
   - Stagger children sparingly
   - **2–3 intentional motions** beat many noisy ones

2. **Layout defaults (dashboard / shell)**
   - Section/panel enter: opacity + slight `translateY` (~250–300ms)
   - Mobile drawer: `transform` slide + backdrop fade
   - `html { scroll-behavior: smooth }` for in-panel scroll (honor reduced motion)
   - Do **not** delay primary task completion

3. **Implementation**
   - CSS transitions/animations fine for shell defaults
   - Framer Motion / GSAP when in React or complex timelines
   - Prefer `transform` / `opacity` (compositor-friendly)

4. **Accessibility**
   - Honor `prefers-reduced-motion: reduce` (disable enter animations + smooth scroll)
   - Never convey meaning by motion alone

## Checklist

- [ ] Motion has a purpose (feedback, hierarchy, continuity)
- [ ] Shell/dashboard includes light enter + drawer motion (or waiver)
- [ ] Durations appropriate to interaction scale
- [ ] `prefers-reduced-motion` handled
- [ ] No layout-thrashing animations
- [ ] Anti-slop: motion is not decorative noise

## Depth

Full reference: `references/motion.md`.  
Micro press/hover/stagger craft: also load `ui-feel` (`references/ui-feel.md`).  
Demo: `test/` settings (section fade + drawer).
