# Eval E33: Button optical alignment

## Scenario

“Empat varian button—text-only, leading icon, trailing icon, dan icon-only—semuanya sudah memakai `inline-flex items-center justify-center`, tetapi leading icon memakai glyph asimetris sehingga masih terlihat berat ke kiri. Padding visual kiri/kanan berbeda, spinner saat pending mengubah lebar, dan radius antarvarian tidak konsisten. Perbaiki tanpa global magic offset.”

## Expected behavior

Load `components`, `polish`, and `design-surfaces`. Treat centering as a rendered control-geometry problem: preserve stable outer geometry, assign radius ownership to the control family, and compensate only the proven glyph inside its icon slot. Inspect the user's actual rendered target; do not substitute an invented fixture. Finish with the canonical `- Control geometry:` conventions field, populated with traceable render evidence rather than its schema placeholder.

## Pass criteria

- [ ] Recognizes that geometric centering with `inline-flex`, `items-center`, and `justify-center` can still be optically unbalanced
- [ ] Audits the full matrix: text-only, leading icon, trailing icon, icon-only × default, hover, pressed, focus-visible, disabled, and pending
- [ ] Keeps outer inline padding symmetric and tokenized instead of tuning each side around one glyph
- [ ] Uses a fixed-size icon slot so icon bounds do not change label spacing or control width
- [ ] Applies glyph-local compensation only when rendered evidence proves it is needed
- [ ] Uses logical start/end placement and verifies RTL when the interface supports it
- [ ] Keeps pending geometry stable and preserves an accessible name plus `aria-busy`; any status announcement is separate
- [ ] Assigns radius ownership to project/control-family tokens and documents intentional pill, circle, segmented, asymmetric, or brand exceptions
- [ ] Rejects a universal/global magic offset across icons, sizes, or variants
- [ ] Identifies the actual inspected target by component path/name and URL when one is available
- [ ] Records render provenance: browser plus screenshot/DOM artifact, or a documented real render method that another reviewer can reproduce
- [ ] Treats prose simulation or a stand-in fixture as invalid, not target evidence; either may explain the method but cannot make E33 pass
- [ ] Reports a populated `- Control geometry:` line containing the actual project radius token, rendered text-only/leading-icon/trailing-icon/icon-only variants and relevant states, plus the observed optical-balance outcome and target provenance
- [ ] Treats the literal schema placeholder and `n/a` as failures for this scenario; a waiver is valid only when it names the explicit exception and supporting rendered evidence
- [ ] When no actual target render is available, reports optical balance as `not evaluated`, marks live E33 incomplete/fail, and cannot pass until real render evidence exists

## Fail signals

- “Fixes” the problem by changing only `gap`, adding asymmetric outer padding, or translating every icon
- Checks a single static button instead of the variant/state matrix
- Replaces the label with a spinner and allows width, accessible name, or alignment to shift
- Hardcodes a new radius without checking the project surface/control language
- Copies the conventions schema placeholder, reports `n/a`, or claims “passed” without naming the token and rendered evidence
- Uses a prose simulation or stand-in fixture as proof for the user's target
- Reports `not evaluated` but marks E33 pass or complete
