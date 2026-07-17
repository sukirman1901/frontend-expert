---
name: design-tokens
description: >-
  Choose and apply CSS design tokens via decision tree (project system, explicit
  preset, Plasma hard-gate, or scored pack preset) — colors, spacing, radius,
  typography; no raw hex. Use whenever building or styling any user-facing UI,
  page, layout, component, theme, or brand look — including chats like "bikin
  halaman", "styling", "warna", or "design system" even if the user never types /ui.
---

# Design Tokens

## Overview

Enforce token-based styling. Use CSS custom properties from `tokens/` presets, or the project's existing design system — never invent raw hex or off-scale spacing.

## When to Use

- Starting UI work that needs a visual system
- Applying colors, spacing, radius, or typography
- `/ui --token <file>` or `/ui --custom`

## Decision tree

**Canonical tree + scoring math:** `references/token-preset-scoring.md` (follow that file; first matching branch wins).

```text
--custom / existing theme / keep palette?
  YES → CUSTOM: style-infer → project vars (no score)
  NO  ↓
--token <file> / user named a preset?
  YES → EXPLICIT: that file (no score)
  NO  ↓
Explicit Plasma brand?
  YES → HARD-GATE: plasma-landing.css
  NO  ↓
SCORE PATH: signals → score all presets → penalties → #1 (+ runner-up ≤2)
         → emit Token score → apply
```

## Workflow

1. **Walk the decision tree** (above) — do not skip to affinity-hint vibes.
2. **Custom branch** — style inference before inventing visuals:
   - Read Tailwind `theme` / `:root` CSS variables / theme provider
   - Skim 2–3 existing buttons, cards, forms (padding, radius, shadow, type)
   - Reuse those patterns; store nothing exotic outside the project language
3. **Score branch** — mandatory when tree lands on SCORE PATH:
   - Extract signals: Surface · Density · Expression · Warmth · Radius · Accent · Inspiration
   - Weighted score per preset (max 24); apply purple/Plasma penalties
   - Choose #1; runner-up if within 2 points
   - Emit **Token score**; Conventions: `Tokens: … (score n/24)`
   - Top < 8 + thin signals → one clarifying Q, then rescore once
4. **Explicit / hard-gate** — apply that file; Conventions note `(explicit)` or `(hard-gate)`
5. **Apply rules** (after source chosen)
   - **HSL presets** (`stone-emerald`, etc.): `hsl(var(--primary))`, `hsl(var(--muted))`, …
   - **OKLCH / hex presets** (`neutral-oklch*.css`, `stone-oklch.css`, `plasma-landing.css`): `var(--primary)` — do **not** wrap in `hsl()`
   - **Plasma landing** also exposes native names: `var(--bg-main)`, `var(--primary-color)`, …
   - Never invent raw hex like `#7c3aed`
   - Spacing: `0.25rem` increments only
   - Radius: match `--radius` from the token file
   - Type: h1 → h2 → h3 → body → small; one h1 per page

### Preset index (scoring hints only — not a picker)

| File | Base | Primary | Radius | Affinity hint (not a picker) |
|------|------|---------|--------|-----------------|
| `neutral-oklch.css` | neutral | mono (OKLCH) | 0 | Modern minimal / sharp UI |
| `neutral-oklch-rounded.css` | neutral | mono (OKLCH) | 0.625rem | Mono OKLCH + soft radius |
| `stone-oklch.css` | warm stone | mono warm (OKLCH) | 0 | Editorial / warm minimal |
| `plasma-landing.css` | zinc-950 | purple `#6C5CE7` | 14px | Plasma marketing landing |
| `stone-emerald.css` | stone | emerald | 0 | Clean, minimal |
| `zinc-blue.css` | zinc | blue | 0.5 | Professional dashboards |
| `neutral-purple.css` | neutral | violet | 0.75 | Creative portfolios (brand cue required) |
| `slate-cyan.css` | slate | cyan | 1 | Data-heavy interfaces |
| `rose-amber.css` | rose | amber | 1.5 | Warm, friendly products |

## Checklist

- [ ] Decision tree walked (custom / explicit / hard-gate / score)
- [ ] If score path: signals + ranked scores emitted
- [ ] Style inferred from existing components when custom
- [ ] No raw hex / RGB outside token definitions
- [ ] Spacing on 0.25rem scale
- [ ] Border radius matches token file
- [ ] Light/dark variables respected if present

## Depth

Decision tree + scoring rubric: `references/token-preset-scoring.md`.  
Token CSS files + import notes: `tokens/README.md`.  
Style inference: `references/design-axes.md`.  
Color theory + neutrals/accent/semantic recipe: `references/ux-foundations.md`.  
Component usage: `references/component-patterns.md`.
