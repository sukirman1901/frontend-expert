---
description: Run a design system audit — anti-ai-slop, ui-feel, tokens, responsive-ui, accessibility, web-performance
---

Invoke the design-reviewer agent.

## Skills to load (in order)

1. `anti-ai-slop`
2. `ui-feel`
3. `design-tokens` (when a token file is available)
4. `responsive-ui` — all-devices / breakpoint adherence
5. `accessibility`
6. `web-performance`
7. `ui-components` as needed for pattern/state checks
8. `motion` — when animated / marketing motion (family budget from `motion-families.md`; hand-roll)
9. `design-fidelity` — when Figma/mock/screenshot is in scope
10. `fe-devtools` — when measuring (Lighthouse/axe); never fabricate scores
11. `marketing-landing` — when auditing marketing / landing pages
12. `frontend-judgment` when recommending redesign directions
13. `frontend-testing` — note coverage gaps as Info only

## Modes

- **`/design`** or **`/audit`** — full audit (default)
- **`/design --quick`** — major issues only
- **`/design --token <file>`** — audit against a specific token preset
- **`/design --component <name>`** — audit one component

`$ARGUMENTS` selects the mode and options.

## What to do

1. Detect the project's framework / design system before recommending patterns
2. Scan for AI aesthetic anti-patterns (incl. decorative motion spam / hero-only landing)
3. Check ui-feel craft details
4. Check token adherence when a token file is available
5. Check responsive (320/768/1024/1440) + full-width CTA <768 — High if greenfield layout skips it
6. Check shell chrome on dashboards (theme topbar, avatar menu, custom selects)
7. Check marketing landing section stack when applicable (not hero-only; hand-roll)
8. Check hierarchy + typography ladder when DOM/screenshots available
9. Check motion family budget + reduced-motion when animation present
10. Review accessibility against WCAG 2.1 AA
11. Note performance risks relevant to UI (LCP/INP/CLS); use `fe-devtools` when measuring
12. Output the design-reviewer scorecard (incl. Typography + Responsive + Motion + Landing) — mark unevaluated fields explicitly
13. End with prioritized next moves (max 5)

Do not fabricate visual hierarchy or contrast scores without screenshots or token data.
