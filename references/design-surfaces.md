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

## Control-family radius consistency

Buttons and related controls use the project's radius tokens. Review the family together—text-only, leading-icon, trailing-icon, and icon-only variants—at the sizes and states that changed. A shared token is the baseline; rendered optical balance remains the proof because glyph bounds, label length, border thickness, and control size can change the perceived curve and centering.

For a control nested inside another control surface, use `outer ≈ inner + inset` only when the two curves share a visual center. This is a conditional relationship, not a universal radius value or formula. Preserve explicit exceptions: pills, circles, segmented controls, asymmetric inset, and deliberate brand geometry. Document intentional exceptions rather than forcing them back onto the default control radius.

Check pending, disabled, hover/pressed, and focus treatments as relevant. Added spinners, borders, rings, or icon swaps must not change the control's content-box dimensions, radius, or alignment.

### Control geometry checklist

- [ ] Buttons and controls use existing project radius tokens; no universal radius was introduced
- [ ] Text-only, leading-icon, trailing-icon, and icon-only variants were compared when relevant
- [ ] Pending, disabled, focus, hover, and pressed states preserve geometry when relevant
- [ ] Nested curves use the concentric heuristic only when they share a visual center
- [ ] Pills, circles, segmented controls, asymmetric inset, and deliberate brand geometry remain explicit exceptions

## Depth language

| Need | Prefer |
|---|---|
| Structural boundary | Border, divider, spacing, or tonal change |
| Elevated temporary layer | Shadow plus backdrop/tone, following project tokens |
| Selected/focus state | Explicit state token and accessible cue |
| Nested content grouping | Spacing first; add a surface only if the level matters |

Dark-mode shadows often lose definition or become harsh. Tune surface lightness, border alpha, and shadow opacity together; do not merely invert a light shadow. Verify against the real canvas and adjacent layers.

Authorship boundary: `NOTICE.md`.
