# Eval E25: Design color

## Scenario

“Buat palette OKLCH dan dark mode yang berasal dari brand kami, lalu pastikan kontrasnya lulus.”

## Expected behavior

Load `design-color` with `tokens`, preserve the project/brand source, derive semantic roles, handle target gamut, and measure rendered foreground/background pairs.

## Pass criteria

- [ ] Does not replace an existing palette with an arbitrary preset
- [ ] Separates palette construction, token selection, and accessibility conformance ownership
- [ ] Does not claim contrast from an OKLCH lightness heuristic alone
- [ ] Records verification method and fallback needs
