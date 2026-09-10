# Design surfaces

## Concentric nested corners

```yaml
principle: Concentric nested radius
classification: heuristic
recommendation: outer radius approximately equals inner radius plus inset
applies_when: [nested surfaces share a visual center]
exceptions: [pills, circles, asymmetric insets, contrasting shape language]
verification: [render light and dark at actual component size]
last_verified: 2026-09
```

```css
.outer {
  --inner-radius: 0.75rem;
  --inset: 0.5rem;
  padding: var(--inset);
  border-radius: calc(var(--inner-radius) + var(--inset));
}

.inner { border-radius: var(--inner-radius); }
```

This follows concentric geometry for uniform inset. CSS itself calculates a box’s inner border curve by subtracting border thickness from the outer curve. Separate nested elements are a design relationship, so verify optically rather than calling the formula a browser rule.

For asymmetric inset, reason per axis/corner. For pills and circles, preserve the intended shape. Account for border thickness, clipping, and the browser’s proportional radius reduction when adjacent radii exceed box dimensions.

## Depth language

| Need | Prefer |
|---|---|
| Structural boundary | Border, divider, spacing, or tonal change |
| Elevated temporary layer | Shadow plus backdrop/tone, following project tokens |
| Selected/focus state | Explicit state token and accessible cue |
| Nested content grouping | Spacing first; add a surface only if the level matters |

Dark-mode shadows often lose definition or become harsh. Tune surface lightness, border alpha, and shadow opacity together; do not merely invert a light shadow. Verify against the real canvas and adjacent layers.

Sources: `references/source-ledger.md`. Adapted craft guidance attribution: `NOTICE.md`.
