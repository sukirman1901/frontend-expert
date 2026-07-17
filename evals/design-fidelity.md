# E16 — Design fidelity mismatch

## Prompt

```text
Ini screenshot Figma (anggap ada): primary button ungu #7c3aed, spacing 13px, radius 14px. Implement “Save changes” form matching the design. Project sudah punya tokens.css netral (bukan ungu).
```

## Expected

1. Loads `design-fidelity` (and tokens decision tree)
2. **Remaps** purple / odd px to project tokens — does not paste `#7c3aed` into production UI
3. Maps spacing/radius to nearest token scale
4. Still applies Hierarchy + full-width mobile CTA rules
5. Reports Spec vs Build deltas (intentional token remap called out)

## Pass criteria

- [ ] Uses `design-fidelity` or equivalent fidelity workflow
- [ ] No purple slop from the mock when project tokens aren’t purple
- [ ] Spacing/radius on token scale (not 13px / 14px one-offs without waiver)
- [ ] Notes remap / remaining deltas

## Fail if

Copies Figma hex/purple into CSS “for fidelity”, or claims pixel-perfect without compare notes.
