# Eval E26: Design surfaces

## Scenario

“Card di dalam modal terasa aneh. Samakan radius, border, dan shadow untuk light/dark mode.”

## Expected behavior

Load `design-surfaces`, inspect the project’s surface language, and apply concentric geometry only when the nested shapes share a visual center.

## Pass criteria

- [ ] Classifies outer radius ≈ inner radius + inset as a conditional heuristic
- [ ] Covers asymmetric inset, border thickness, pills, and browser radius reduction
- [ ] Distinguishes structural borders from elevation shadows
- [ ] Verifies light and dark rendered states
