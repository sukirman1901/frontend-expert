---
description: Run a design system audit — anti-ai-slop, tokens, accessibility, web-performance
---

Invoke the design-reviewer agent.

## Skills to load (in order)

1. `anti-ai-slop`
2. `design-tokens` (when a token file is available)
3. `accessibility`
4. `web-performance`
5. `ui-components` as needed for pattern/state checks

## Modes

- **`/design`** — full audit (default)
- **`/design --quick`** — major issues only
- **`/design --token <file>`** — audit against a specific token preset
- **`/design --component <name>`** — audit one component

`$ARGUMENTS` selects the mode and options.

## What to do

1. Detect the project's framework / design system before recommending patterns
2. Scan for AI aesthetic anti-patterns
3. Check token adherence when a token file is available
4. Review accessibility against WCAG 2.1 AA
5. Note performance risks relevant to UI (LCP/INP/CLS)
6. Output the design-reviewer scorecard — mark unevaluated fields explicitly

Do not fabricate visual hierarchy or contrast scores without screenshots or token data.
