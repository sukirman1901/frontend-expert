---
name: motion
description: >-
  Purposeful UI motion by family/pattern — shell defaults (fade, drawer, press)
  plus marketing vocabulary (reveal, scroll, text, carousel, hero, …). Hand-roll
  CSS/Motion/GSAP from named patterns. Use for animation requests, landings,
  marquees, parallax, text reveal, and light defaults on /ui shells — not token-only tweaks.
---

# Motion

## Overview

Motion clarifies hierarchy and feedback — it does not decorate. Pick **families/patterns by name**, then **hand-roll** (CSS / Motion / GSAP). Do **not** default to third-party registry installs.

Full catalog: `references/motion-families.md` (12 families · 144 patterns).

## When to Use

- Micro-interactions (hover, focus, press)
- Enter/exit or layout transitions (section swaps, drawers, modals)
- Scroll-linked, text, carousel, hero, or other named patterns
- **Default (light):** app shell / dashboard / multi-section `/ui` — section fade + drawer slide + smooth scroll (unless user forbids)

## When to skip

- Static token/color-only tweaks
- User asked for zero animation / “tanpa animasi”
- Prefers-reduced-motion (still ship CSS that disables)

## Lanes

| Lane | Peruntukan | Defaults |
|------|------------|----------|
| **Product / shell** | App chrome, settings, dashboards | `fade-up` / `page-crossfade`, `drawer-slide`, `press-scale`, `lift-hover` |
| **Marketing / expressive** | Landing, campaigns | Choose **1–2 families** + **1–2 patterns** from catalog — budget 2–3 motions / viewport |

## Family peruntukan (quick)

| Family | Untuk | Bukan untuk |
|--------|-------|-------------|
| Micro Interaction | Toggle, toast, like, progress | Hero / scroll story |
| Hover & Interaction | Lift, press, magnetic, tilt | Page enter |
| Scroll-based | Sticky, horizontal, scroll-zoom | Button-only micro |
| Reveal & Wipe | Enter fades, split, mask, drawer | Endless loops as only motion |
| Text Motion | Word reveal, typewriter, marquee type | Forms / dense settings |
| Carousel & Continuous Flow | Marquee, filmstrip, snap | Single CTA focus pages |
| Grid Motion | Bento, flip grid, reflow | One-button chrome |
| Spotlight & Focus | Center stage, dim siblings | Whole-page noise |
| Stack & Scatter | Deck, fan, swipe deck | Admin tables |
| Hero Section Motion | Parallax / float device / aurora | App shell (max **1** signature) |
| Morph & Transform | Shared element, FAB morph | Every navigation |
| 3D & Perspective | Orbit, coverflow | Default product UI |

## Workflow

1. **Lane** — product shell vs marketing
2. **Family** — match peruntukan (max 2 families)
3. **Patterns** — name 1–2 from `motion-families.md`; read definisi + hand-roll hint
4. **Implement** — CSS / Framer Motion / GSAP from definisi; project tokens; `transform`/`opacity`
5. **Budget** — ≤2–3 intentional motions per viewport
6. **A11y** — `prefers-reduced-motion: reduce` (opacity/instant fallbacks); never meaning-by-motion-alone
7. **Report** — Conventions: `Motion: light shell | families: Hover+Reveal | patterns: lift-hover, fade-up`

### Shell defaults (product)

- Section enter: `fade-up` ~250–300ms
- Mobile drawer: `drawer-slide` + backdrop fade
- Controls: `press-scale` (0.96)
- `scroll-behavior: smooth` (disabled under reduced-motion)

### Hard rules

- **Hand-roll** from pattern names — registry install is **not** the pack default
- Do not stack Hero + 3D + Text + Spotlight + Carousel in one viewport
- Marketing: max one Hero signature pattern

## Checklist

- [ ] Lane chosen (product vs marketing)
- [ ] Family peruntukan matches the ask (≤2 families)
- [ ] Named patterns listed (≤2–3 motions in viewport)
- [ ] Hand-rolled from definisi (not registry-as-answer)
- [ ] `prefers-reduced-motion` handled
- [ ] No layout-thrashing / decorative spam
- [ ] Conventions Motion line filled

## Depth

- Vocabulary: `references/motion-families.md`
- Recipes: `references/motion.md`
- Micro craft overlap: `ui-feel`
- Demo shell: `test/` (section fade + drawer)
