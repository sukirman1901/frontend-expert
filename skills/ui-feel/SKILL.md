---
name: ui-feel
description: >-
  Polish micro-details that make UI feel better — concentric radius, optical
  alignment, tabular nums, text-wrap, interruptible transitions, scale-on-press,
  hit areas, no transition:all. Use when building/reviewing UI polish, "feels
  off", "rapihin detail", hover/press feedback, stagger enter/exit, or after
  anti-ai-slop on /ui and /polish. Adapted from make-interfaces-feel-better.
---

# UI Feel

## Overview

Great interfaces compound from small craft details. After tokens + structure + anti-slop, apply this skill so the UI doesn’t just look correct — it **feels** right.

Adapted from [make-interfaces-feel-better](https://github.com/jakubkrehel/make-interfaces-feel-better) (MIT) for this pack.

## When to use

- Finishing `/ui` builds (after `anti-ai-slop`)
- `/polish` / “rapihin detail” / “feels off” / “make it feel better”
- Design audits that go beyond slop into craft
- Hover, press, enter/exit, icon swap micro-interactions

## When to skip

- Pure token/theme pick with no UI surface
- Backend-only or copy-only edits
- User asked for a one-line fix unrelated to feel

## Pack fit

| Skill | Job |
|-------|-----|
| `anti-ai-slop` | Kill generic AI aesthetic |
| **`ui-feel`** | Micro craft that compounds into polish |
| `motion` | Larger animation systems (Framer/GSAP timelines) |
| `accessibility` | Labels, keyboard, contrast (hit areas overlap here) |

**Conflict rules (this pack wins):**

- Prefer **subtle layered transparent shadows** — not heavy multi-layer card stacks (`anti-ai-slop`)
- Image outlines are **optional** (media cards / product shots), not mandatory on every `<img>`
- Keep project fonts; only add smoothing / wrap / tabular-nums
- Icons stay **[Reicon](https://reicon.dev)** unless project already standardized another lib

## Core principles (quick)

1. **Concentric radius** — `outer = inner + padding`
2. **Optical > geometric** alignment for icons in controls
3. **Subtle shadows over hard borders** between sections (when depth is needed)
4. **Interruptible** — CSS transitions for hover/toggle; keyframes for one-shot only
5. **Split + stagger** enters (~100ms); soft exits (small `translateY`, not full height)
6. **Icon swaps** — opacity + scale `0.25→1` + blur `4px→0` (spring bounce `0` if Motion)
7. **Font smoothing** on root (`antialiased`)
8. **`tabular-nums`** for dynamic numbers
9. **`text-wrap: balance`** headings · **`pretty`** short body
10. **Scale on press** — exactly `0.96` (never below `0.95`); disable when distracting
11. **`initial={false}`** on `AnimatePresence` for default-state UI (skip load flash)
12. **Never `transition: all`** — name properties
13. **`will-change` sparingly** — only transform/opacity/filter when first-frame stutter
14. **Hit area** — 44×44 touch/mobile; ≥40×40 dense desktop; no overlapping hit targets

## Workflow

1. Scan touched UI against the checklist below
2. Fix with tokens (`--radius`, spacing scale) — don’t invent one-off magic numbers when a token exists
3. Report changes as **Before / After tables** grouped by principle (omit empty groups)

### Review output format

```markdown
#### Concentric border radius
| Before | After |
| --- | --- |
| `rounded-xl` on card + inner (`p-2`) | Outer `rounded-2xl`, inner `rounded-lg` |

#### Scale on press
| Before | After |
| --- | --- |
| bare `<button>` | `active:scale-[0.96] transition-transform` |
```

## Checklist

- [ ] Nested radii are concentric
- [ ] Icons optically centered
- [ ] Depth via subtle transparent shadows where borders feel harsh
- [ ] Enter split/staggered; exits soft
- [ ] Dynamic numbers use `tabular-nums`
- [ ] Root font smoothing applied (or already present)
- [ ] Headings `text-balance`; short copy `text-pretty` where useful
- [ ] Press feedback `scale(0.96)` where appropriate
- [ ] No `transition: all` / Tailwind bare `transition`
- [ ] Hit areas meet 44/40 guidance without overlap
- [ ] Image outlines only where they help (pure black/white at 10% opacity)

## Depth

Full examples: `references/ui-feel.md`.  
Related: `references/motion.md`, `references/anti-patterns.md`.
