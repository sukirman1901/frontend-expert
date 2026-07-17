---
name: anti-ai-slop
description: >-
  Detect and fix AI aesthetic anti-patterns (purple/indigo defaults, gradients,
  rounded-2xl everywhere, generic heroes, Lorem ipsum, shadow-heavy cards). Use
  whenever building, restyling, or reviewing visual UI quality — including
  "terlalu generik", "AI slop", "rapihin UI", or design audit requests — without
  requiring /design.
---

# Anti AI Slop

## Overview

AI-generated UI has recognizable tells. Scan for them before shipping; fix with tokens and purpose-driven layout.

## When to Use

- Before finishing any `/ui` build
- During `/design` audits
- When visual output looks generic or template-like

## Workflow

1. **Scan** for the patterns below (and detail in `references/anti-patterns.md`)
2. **Fix** using design tokens and content-first layout
3. **Re-scan** before marking work done

## Pattern Table

| Pattern | Detection | Fix |
|---------|-----------|-----|
| Purple/indigo defaults | `#7c3aed`, `bg-purple-*`, `text-indigo-*` | Token colors only (via decision tree — never invent purple token file) |
| Excessive gradients | `bg-gradient-to-*`, `linear-gradient` | Flat token colors |
| Rounded everything | `rounded-2xl` / `rounded-3xl` everywhere | Token `--radius` |
| Generic hero | Template layout, no content connection | Content-first layout |
| Lorem ipsum | Placeholder copy | Realistic content |
| Oversized padding | `p-8`/`p-12` on everything | Spacing hierarchy |
| Stock card grids | Uniform grids, no priority | Purpose-driven layout |
| Shadow-heavy | Layered competing shadows | Subtle or no shadow |
| Loud nav “active bar” | Thick left/right accent stripe on selected items | Quiet fill + weight/contrast only |
| Decorative motion spam | Hero+3D+Text+Spotlight+Carousel stacked; typewriter on forms | ≤2 families / ≤2–3 motions; see `motion-families.md` |

## Checklist

- [ ] No purple/indigo outside the chosen token source (scored / explicit / hard-gate / project system — not a vibe-picked purple file)
- [ ] No loud left-accent “selected” bars on nav (prefer quiet fill + type weight)
- [ ] No unjustified gradients
- [ ] Radius consistent with tokens
- [ ] No Lorem ipsum
- [ ] Spacing hierarchy present (not equal generous padding)
- [ ] Layout serves content, not a stock template
- [ ] Motion not decorative spam (≤2–3 intentional motions / viewport)

## Depth

Full catalog and fixes: `references/anti-patterns.md`.  
Token source: `references/token-preset-scoring.md` (Plasma/`neutral-purple` only with brand cue).  
Motion vocabulary: `references/motion-families.md`.
