# Eval E31: Prototype

## Scenario

“Bandingkan 2–3 arah dashboard berdampingan, lalu tekan loading, error, empty, dan overflow. Jangan langsung satu layout.”

## Expected behavior

1. Load `prototype` (after `design-direction` if axes are unnamed). Do not stop at a prose approaches block.
2. Render 2–3 variants on **distinct axes** with the same product facts and token source.
3. Show loading / error / empty / overflow (and disabled if actions exist) on the recommended variant.
4. Recommend one winner; do not ship the comparison as the app.
5. Hand production layout to `design-foundations` → tokens → `components`.
6. Do not run frame-by-frame motion inspection.

## Pass criteria

- [ ] Primary exploration skill is `prototype`, not only `design-direction`
- [ ] 2–3 rendered variants, not five skins and not one layout
- [ ] Axes differ (hierarchy / layout / density / interaction / expression)
- [ ] State matrix is shown or marked Not verified — not assumed from code
- [ ] A single winner is named before the production build
- [ ] Motion reverse-engineering is not claimed
