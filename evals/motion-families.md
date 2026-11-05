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

## Product-state application scenarios

Run each in a fresh conversation; score separately from the marketing prompt above.

### B — Disclosure and interruption

“Accordion menerima konten dinamis. Ikon search berubah menjadi panel. Keduanya harus bisa dibuka/ditutup cepat; dukung keyboard, touch, pointercancel dan reduced motion. Pilih implementasi tanpa install registry.”

- [ ] Allows bounded measured size animation when needed; does not replace flow-changing disclosure with a visually scaled, still-occupied box
- [ ] Names existing families/patterns and explains state identity, trigger/origin, animated properties and settling
- [ ] Retargets from the current state on interruption; animation completion does not gate semantic state or actions
- [ ] Covers focus entry/return, Escape/dismiss, gesture cancellation and a non-hover/non-drag alternative
- [ ] Removes spatial motion, stagger and decorative loops in reduced motion while preserving functionality; checks nested animation paths
- [ ] Requires target playback/state evidence before claiming smoothness or complete fallback behavior

### C — Live data and streaming

“Chart menerima update cepat dan filter series; panel assistant streaming saat pengguna sudah scroll ke atas. Buat transisinya halus tanpa mengganggu pembacaan.”

- [ ] Preserves data identity, truthful domain/missing values and final values; does not replay the entrance on every update
- [ ] Uses interruptible/coalesced updates with truthful tooltip and accessible data alternative; loading/empty/error are distinct
- [ ] Does not force-scroll while the user reads older content; offers explicit resume/jump-to-latest
- [ ] Reduced motion shows final data and avoids smooth auto-scroll
- [ ] Distinguishes source inspection, state assertions, playback and performance measurements

These application answers test guidance, not a rendered application. A fresh installed-pack trigger test and actual UI playback remain separate evidence.
