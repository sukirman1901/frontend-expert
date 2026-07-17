---
name: design
description: Run a design system audit — AI aesthetic, tokens, accessibility, performance, visual quality.
---

# /design

Run a design system audit. Orchestrates domain skills — parity with `/ui` and `/test-ui`.

Alias: **`/audit`** (same workflow).

## Skills to load (in order)

1. `anti-ai-slop` — AI aesthetic patterns
2. `ui-feel` — micro craft (radius, press, tabular-nums, …)
3. `design-tokens` — token adherence (when a token file is available)
4. `accessibility` — WCAG 2.1 AA
5. `web-performance` — CWV / loading issues relevant to UI
6. `ui-components` — pattern / state / responsive checks as needed
7. `frontend-judgment` — when recommending redesign directions (2–3 options)
8. `frontend-testing` — note test gaps as Info only (do not replace `/test-ui`)

## What It Does

1. Detects framework / design system before recommending patterns
2. Scans for AI aesthetic patterns
3. Checks `ui-feel` craft (concentric radius, hit areas, transition hygiene, …)
4. Checks token adherence
5. Reviews accessibility
6. Notes performance risks (LCP / INP / CLS)
7. Validates responsive design (320 / 768 / 1024 / 1440)
8. Checks component patterns (composition, states)
9. Outputs scorecard + prioritized next moves

## Usage

```
/design                    # Full audit
/design --quick            # Major issues only
/design --token <file>     # Audit against specific token file
/design --component <name> # Audit specific component
/audit                     # Alias of /design
```

## Output

Scorecard from `design-reviewer`: Token Compliance, Visual Hierarchy, AI Aesthetic, Accessibility, Performance (UI). Mark unevaluated fields explicitly — do not fabricate visual scores without tokens or screenshots. End with **prioritized next moves** (max 5).

## Agent Invoked

`design-reviewer` with the skills listed above.
