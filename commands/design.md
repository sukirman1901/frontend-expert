---
name: design
description: Run a design system audit on the current codebase. Checks for AI aesthetic patterns, token adherence, accessibility, and visual quality.
---

# /design

Run a design system audit. Orchestrates domain skills — not a single monolith.

## Skills to load (in order)

1. `anti-ai-slop` — AI aesthetic patterns
2. `design-tokens` — token adherence (when a token file is available)
3. `accessibility` — WCAG 2.1 AA
4. `web-performance` — CWV / loading issues relevant to UI
5. `ui-components` — pattern / state / responsive checks as needed

## What It Does

1. Scans for AI aesthetic patterns
2. Checks token adherence
3. Reviews accessibility
4. Validates responsive design (320 / 768 / 1024 / 1440)
5. Checks component patterns (composition, states)

## Usage

```
/design                    # Full audit
/design --quick            # Quick scan for major issues
/design --token <file>     # Audit against specific token file
/design --component <name> # Audit specific component
```

## Output

## Output

Scorecard from `design-reviewer`: Token Compliance, Visual Hierarchy, AI Aesthetic, Accessibility, Performance (UI). Mark unevaluated fields explicitly — do not fabricate visual scores without tokens or screenshots.

## Agent Invoked

`design-reviewer` with the skills listed above.
