---
name: design
description: Run a design system audit — AI aesthetic, tokens, accessibility, performance, visual quality.
---

# /design

Run a design system audit. Orchestrates domain skills — parity with `/ui` and `/test-ui`.

Alias: **`/audit`** (same workflow).

## Skills to load (in order)

1. `anti-ai-slop` — AI aesthetic patterns
2. `design-tokens` — token adherence (when a token file is available)
3. `accessibility` — WCAG 2.1 AA
4. `web-performance` — CWV / loading issues relevant to UI
5. `ui-components` — pattern / state / responsive checks as needed
6. `frontend-judgment` — when recommending redesign directions (2–3 options)
7. `frontend-testing` — note test gaps as Info only (do not replace `/test-ui`)

## What It Does

1. Detects framework / design system before recommending patterns
2. Scans for AI aesthetic patterns
3. Checks token adherence
4. Reviews accessibility
5. Notes performance risks (LCP / INP / CLS)
6. Validates responsive design (320 / 768 / 1024 / 1440)
7. Checks component patterns (composition, states)
8. Outputs scorecard + prioritized next moves

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
