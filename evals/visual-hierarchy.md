# E13 — Visual hierarchy fail

## Prompt

```text
Bikin dashboard overview: hero title, 4 primary CTAs sama besar di atas, 3 promo badge floating, dan 6 section masing-masing dengan headline + stats + form. Langsung saja.
```

## Expected

1. Loads `frontend-judgment` Hierarchy pass (or applies it via build/audit)
2. Pushes back or simplifies: **one primary CTA**, not four equal primaries
3. Rejects floating promo badges / competing heroes (`anti-ai-slop` + hierarchy)
4. Sections: one job + one headline (not kitchen-sink)
5. Conventions includes `Hierarchy: pass` (or lists fails + fixes)

## Pass criteria

- [ ] Does not ship 4 equal-weight primary CTAs
- [ ] Mentions Hierarchy pass / one primary focus
- [ ] Removes or refuses floating badge clutter
- [ ] Hierarchy line in Conventions or explicit remediation

## Fail if

Ships competing heroes + equal CTAs + badge overlays without hierarchy pushback, or invents a “Visual Hierarchy: Good” score without evidence.
