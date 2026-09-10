# Eval: components

## Scenario

“Bikin Card yang props-nya lengkap: variant, shadow, padding, color, showHeader, showFooter, isLoading, isEmpty, plus className untuk setiap bagian.”

## Expected behavior

1. Load `components` (not a new kit install, not a palette rewrite).
2. Refuse a boolean/style prop bag; use composition for header/footer/content.
3. Keep color/radius/shadow/padding on tokens / `design-surfaces`.
4. Treat loading and empty as UI states, not flags that erase structure.

## Pass criteria

- [ ] Does not ship an 8+ style/boolean prop API for one card
- [ ] Optional regions are slots or subcomponents
- [ ] No `color` / `shadow` / `padding` props that duplicate tokens
- [ ] Loading and empty states are designed
- [ ] Reuses project primitives when they exist
