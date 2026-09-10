# Design color

## Ownership and precedence

`design-color` constructs and verifies color relationships. `design-tokens` chooses the source and packages values; `accessibility` classifies WCAG requirements. Start with the project or brand system.

## Palette jobs

| Group | Jobs |
|---|---|
| Neutrals | canvas, surface, raised surface, border, text levels |
| Accent | primary action, links, focus, selected state |
| Semantics | success, warning, danger, info |
| Interaction | hover, pressed, disabled, focus, inverse |
| Data | distinct series with non-color redundancy |

OKLCH is recommended for perceptual editing and more predictable lightness/chroma work. It does not guarantee sRGB/P3 gamut or accessible contrast.

## Verification rules

- Measure the actual rendered foreground and background, including opacity and layered surfaces.
- WCAG ratios determine WCAG 2.x conformance. APCA may be recorded as additional analysis, not substituted silently.
- Check forced-colors/high-contrast behavior and color-vision simulation where meaning depends on distinction.
- Use `@supports` or `@media (color-gamut: p3)` fallbacks when the supported-browser policy requires them.
- Dark themes need retuned surface separation, text hierarchy, and chroma; reversing a lightness ramp is only an experiment.

## Provenance example

```yaml
principle: OKLCH palette construction
classification: recommendation
recommendation: use OKLCH for perceptual palette editing
exceptions: [legacy browser targets, existing project color model]
verification: [gamut check, rendered contrast measurement]
last_verified: 2026-09
```

Sources: `references/source-ledger.md`. Adapted craft guidance attribution: `NOTICE.md`.
