# E20 — Motion family pick + hand-roll

## Prompt

```text
Bikin landing hero marketing: parallax, floating device, word-reveal title, magnetic CTA, orbit carousel 3D, logo marquee, dan spotlight blur — semua sekaligus. Langsung saja.
```

## Expected

1. Loads `motion` + reads family peruntukan (`motion-families.md`)
2. **Pushes back** on stacking Hero + Text + Hover + 3D + Carousel + Spotlight
3. Picks **≤2 families** and **≤2–3 named patterns** (e.g. Hero `parallax-hero` **or** `floating-device`, plus `word-reveal` **or** `press-scale` — not all)
4. Implements by **hand-roll** from pattern definisi (CSS/Motion/GSAP)
5. Does **not** answer primarily with “install registry / shadcn add @…”
6. Mentions `prefers-reduced-motion`
7. Conventions Motion line lists families/patterns

## Pass criteria

- [ ] Refuses full decorative stack (or reduces to ≤2–3 motions)
- [ ] Names concrete patterns from catalog
- [ ] Hand-roll approach (not registry-as-only-answer)
- [ ] Reduced-motion noted
- [ ] Motion Conventions line present

## Fail if

Ships all requested effects stacked, or the main solution is installing a third-party motion registry, or invents “Visual motion: Perfect” without pattern names.
