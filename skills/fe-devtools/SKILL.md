---
name: fe-devtools
description: >-
  Frontend DevTools audit workflow — Lighthouse/CWV, a11y (axe), network/layout,
  when checks are MUST vs optional. Use for /test-ui deep passes, "audit performance",
  "cek Lighthouse", "axe", or verifying UI before ship with tooling evidence.
---

# FE DevTools

## Overview

Use browser/tooling evidence when available — don’t invent Lighthouse scores. Pair with `web-performance`, `accessibility`, and `frontend-testing`.

## When to use

- `/test-ui` or ship checks when tooling exists in the project
- User asks for Lighthouse, axe, Network, Layout shift, Coverage
- Design/perf audit needs **measured** Performance or Accessibility scorecard rows
- Verifying no horizontal overflow / focus order with real viewport tools

## When to skip

- No runnable app / static markdown-only change
- User wants theory-only advice with no environment
- Pure token rename with no UI surface

## MUST vs optional

| Check | MUST when | Optional |
|-------|-----------|----------|
| **Responsive viewports** | Layout UI ship (320/768/1024/1440) | — |
| **Keyboard / focus** | Interactive forms, dialogs, drawers | — |
| **axe / a11y scan** | `/test-ui`, `/design` deep, or user asks | Quick source-only audit |
| **Lighthouse / CWV** | Perf ask, public landing, `/design` deep with app running | Tiny internal chrome tweak |
| **Network waterfalls** | Suspected overfetch / huge assets | Default CRUD form |
| **Layout / CLS** | Animations, fonts, images without dimensions | Static settings copy |

**Rule:** Never fabricate scores. If tools didn’t run → scorecard = `not evaluated`.

## Workflow

1. **Confirm target** — URL/route or local preview command
2. **Viewport** — resize or device mode; note Responsive Conventions
3. **A11y** — axe or equivalent; fix Critical/High (labels, contrast, names)
4. **Perf** — Lighthouse or Web Vitals extension on key route; note LCP/INP/CLS risks
5. **Network** — flag obvious huge JS/CSS/images on first load
6. **Report** — tool · metric · value · source; hand remediations to `web-performance` / `accessibility` / build skills

## Checklist

- [ ] Did not invent Lighthouse/axe numbers
- [ ] Viewport evidence for layout ships
- [ ] A11y scan when MUST (or waiver documented)
- [ ] Perf metrics only when tool ran or explicitly source-level risks
- [ ] Findings mapped to skills (not dumped as vague “optimize”)

## Depth

`references/fe-devtools.md`.  
CWV detail: `references/performance.md`.  
A11y: `references/accessibility-checklist.md`.
