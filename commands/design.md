---
name: design
description: Run a design system audit — AI aesthetic, tokens, accessibility, performance, visual quality.
---

# /design

Run a design system audit. Orchestrates domain skills — parity with `/ui` and `/test-ui`.

Alias: **`/audit`** (same workflow).

## Skills to load (in order)

1. `anti-slop-design` — AI aesthetic patterns
2. `polish` — micro craft (radius, press, tabular-nums, …)
3. `tokens` — token adherence (when a token file is available)
4. `design-foundations` — when diagnosing grid, spacing rhythm, alignment, density, or structural layout
5. `content-design` / `design-typography` / `design-color` / `design-surfaces` — owning domain when relevant
5. `responsive` — all-devices / breakpoint adherence
6. `accessibility` — WCAG 2.2 AA by default
7. `performance` — CWV / loading issues relevant to UI
8. `components` — pattern / state checks as needed
9. `motion` — when animated UI / marketing motion (family budget from `motion-families.md`, reduced-motion)
10. `fidelity` — when a Figma/mock/screenshot is in scope
11. `devtools` — when measuring (Lighthouse/axe); never fabricate scores
12. `marketing` — when the surface is a marketing / landing page
13. `design-direction` — when recommending redesign directions (2–3 options)
14. `testing` — note test gaps as Info only (do not replace `/test-ui`)

## What It Does

1. Detects framework / design system before recommending patterns
2. Scans for AI aesthetic patterns (incl. decorative motion spam / hero-only landing)
3. Checks `polish` craft (concentric radius, hit areas, transition hygiene, …)
4. Checks token adherence
5. Checks **foundations** (container/grid, spacing relationships, shared anchors, one focal path) when layout structure is in scope
5. Reviews accessibility
6. Notes performance risks (LCP / INP / CLS)
7. Validates **responsive** design (320 / 768 / 1024 / 1440) via `responsive`
8. Checks **shell chrome** (theme topbar, avatar menu, custom selects) on dashboards
9. Checks **marketing landing** section stack when applicable
10. Checks **motion** family budget when animation present
11. Checks component patterns (composition, states)
12. Outputs scorecard + prioritized next moves

## Usage

```
/design                    # Full audit
/design --quick            # Major issues only
/design --token <file>     # Audit against specific token file
/design --component <name> # Audit specific component
/audit                     # Alias of /design
```

## Output

Scorecard from `design-reviewer`: Token Compliance, Visual Hierarchy, **Typography**, AI Aesthetic, **UI Feel**, **Motion**, **Responsive**, Accessibility, Performance (UI). Mark unevaluated fields explicitly — do not fabricate visual scores without tokens or screenshots. End with **prioritized next moves** (max 5).

Also verify: full-width primary CTA <768; Hierarchy pass; one h1 + type ladder; motion ≤2–3 purposeful patterns when animated.

## Agent Invoked

`design-reviewer` with the skills listed above.
