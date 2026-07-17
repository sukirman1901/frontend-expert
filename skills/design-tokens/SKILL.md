---
name: design-tokens
description: >-
  Pick and apply curated CSS design tokens or an existing project design system
  (colors, spacing, radius, typography; no raw hex). Use whenever building or
  styling any user-facing UI, page, layout, component, theme, or brand look —
  including chats like "bikin halaman", "styling", "warna", or "design system"
  even if the user never types /ui.
---

# Design Tokens

## Overview

Enforce token-based styling. Use CSS custom properties from `tokens/` presets, or the project's existing design system — never invent raw hex or off-scale spacing.

## When to Use

- Starting UI work that needs a visual system
- Applying colors, spacing, radius, or typography
- `/ui --token <file>` or `/ui --custom`

## Workflow

1. **Detect existing system** — if the project already has tokens/theme CSS, use that (custom mode). Do not force a preset.
2. **Style inference** (custom / existing system) — before inventing visuals:
   - Read Tailwind `theme` / `:root` CSS variables / theme provider
   - Skim 2–3 existing buttons, cards, forms (padding, radius, shadow, type)
   - Reuse those patterns; store nothing exotic outside the project language
3. **Otherwise pick a preset** from `tokens/`:

| File | Base | Primary | Radius | Best for |
|------|------|---------|--------|----------|
| `neutral-oklch.css` | neutral | mono (OKLCH) | 0 | Modern minimal / sharp UI |
| `neutral-oklch-rounded.css` | neutral | mono (OKLCH) | 0.625rem | Mono OKLCH + soft radius |
| `stone-oklch.css` | warm stone | mono warm (OKLCH) | 0 | Editorial / warm minimal |
| `plasma-landing.css` | zinc-950 | purple `#6C5CE7` | 14px | Plasma marketing landing |
| `stone-emerald.css` | stone | emerald | 0 | Clean, minimal |
| `zinc-blue.css` | zinc | blue | 0.5 | Professional dashboards |
| `neutral-purple.css` | neutral | violet | 0.75 | Creative portfolios |
| `slate-cyan.css` | slate | cyan | 1 | Data-heavy interfaces |
| `rose-amber.css` | rose | amber | 1.5 | Warm, friendly products |

4. **Apply rules**
   - **HSL presets** (`stone-emerald`, etc.): `hsl(var(--primary))`, `hsl(var(--muted))`, …
   - **OKLCH / hex presets** (`neutral-oklch*.css`, `stone-oklch.css`, `plasma-landing.css`): `var(--primary)` — do **not** wrap in `hsl()`
   - **Plasma landing** also exposes native names: `var(--bg-main)`, `var(--primary-color)`, …
   - Never invent raw hex like `#7c3aed`
   - Spacing: `0.25rem` increments only
   - Radius: match `--radius` from the token file
   - Type: h1 → h2 → h3 → body → small; one h1 per page

## Checklist

- [ ] Token source chosen (preset or project system)
- [ ] Style inferred from existing components when custom
- [ ] No raw hex / RGB outside token definitions
- [ ] Spacing on 0.25rem scale
- [ ] Border radius matches token file
- [ ] Light/dark variables respected if present

## Depth

Token CSS files + import notes: `tokens/README.md`.  
Style inference: `references/design-axes.md`.  
Color theory + neutrals/accent/semantic recipe: `references/ux-foundations.md`.  
Component usage: `references/component-patterns.md`.
