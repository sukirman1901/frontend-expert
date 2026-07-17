---
name: frontend-judgment
description: >-
  Senior frontend judgment before building UI — offer 2–3 approaches on distinct
  design axes (hierarchy, layout, density, interaction, expression) with
  tradeoffs; max 1–2 clarifying questions; optional inspiration (Linear/Stripe/…).
  Use at the start of non-trivial UI work and whenever direction is unclear.
  Skip for obvious bugfixes, single-token tweaks, or “just implement”. Runs
  before domain skills. Inspired by design-lab exploration patterns.
---

# Frontend Judgment

## Overview

Feel like a senior frontend engineer: **decide with the user, then build**. Do not dump a generic UI for blank-canvas work. This skill is a short gate before `design-tokens` / `ui-components` / etc.

Exploration ideas adapted from [design-lab](https://github.com/0xdesign/design-plugin) (axes, inspiration, style inference) — **without** a temporary `/__design_lab` route or multi-phase interview.

## When to use (mandatory gate)

Run this **before** domain skills when any of these apply:

- New page, screen, flow, or blank-canvas layout
- Unspecified information architecture / navigation / density
- Multiple reasonable visual or interaction directions
- User ask is vague for a **new** screen (“bikin dashboard”, “UI modern”) — not mere “rapihin” on existing UI (that’s `ui-feel` / `ui-quality-loop`)

## When to skip

- Clear bugfix with known expected behavior
- Tiny change (one component prop, one token color, copy tweak)
- User already chose a direction or said “langsung saja” / “just implement”
- Pure `/design` audit with no implementation request
- Follow-up turn continuing an already-approved plan
- User only wants micro polish on existing UI (“rapihin detail”, “feels off”) → use `ui-feel`
- User wants iterate until audit-clean (“sampai bagus”) → use `ui-quality-loop`, which may call judgment only on first blank-canvas pass

## Workflow

### 0. Quick context (silent — no questions yet)

- If `DESIGN_MEMORY.md` exists in the project root, **read it** and honor captured tone/density/patterns
- Note whether the project already has tokens / a component library (feeds step 4 handoff)

### 1. Clarify only if blocked (max 1–2 questions)

Ask only what changes the design. Prefer multiple choice. Do **not** run a full design-lab interview.

**Good single questions (pick at most two total):**

| Topic | Example options |
|-------|-----------------|
| Density | Compact · Comfortable · Spacious |
| Context | Desktop-first · Mobile-first · Both |
| Pain (redesign) | Cluttered · Unclear hierarchy · Weak mobile · Outdated |
| Inspiration | Linear density · Stripe clarity · Notion flexibility · Apple space |

Skip questions you can infer from the repo or `DESIGN_MEMORY.md`.

### 2. Offer 2–3 approaches on **distinct axes**

Do **not** offer three near-identical skins. Each option should explore a different axis (from design-lab variant thinking):

| Axis | Explores |
|------|----------|
| **Hierarchy** | What is primary? Gestalt grouping; one primary action |
| **Layout model** | Card vs list vs table vs split-pane / sidebar |
| **Density** | Compact vs comfortable vs spacious (using project spacing tokens) |
| **Interaction** | Modal vs inline vs drawer vs page; progressive disclosure |
| **Expression** | How far to push brand (borders vs soft depth, motion amount) — still on-token |

Present **2–3 options** (not 5 coded mocks). Label each with its axis.

For each option:

- **Name** + **axis** (short)
- **What it looks/behaves like** (1–2 sentences)
- **Tradeoff** (clarity, density, a11y, ship cost)
- Mark **one recommendation** and why (1 sentence)

### 3. Wait for a clear choice

- Affirmative on one option → proceed
- Hedged → pick recommended **and state that**, or one tight confirm
- “Langsung saja” → pick recommendation and build

### 4. Hand off

After direction is set:

1. **Style inference** (for `design-tokens` / build) — if a project system exists:
   - Read Tailwind theme / `:root` / theme file
   - Skim 2–3 existing buttons, cards, forms for padding, radius, shadow, type
   - Do **not** invent a parallel visual language
2. Load: `design-tokens` → `ui-components` → `anti-ai-slop` → `ui-feel` → `accessibility` (+ `motion` / `frontend-testing` if in scope)

Optional short handoff note (when exploration was non-trivial):

```markdown
## Build plan (brief)
- Axis chosen: …
- Files likely touched: …
- States: loading / empty / error / …
- Tokens / primitives to reuse: …
```

Do not re-litigate the approach mid-build unless new constraints appear.

## Quick decision check

When stuck between options, prefer the one that is: **clear · fast · consistent · accessible · calm · specific · recoverable**.

## Expert voice (do / don't)

**Do:**

- Push back on AI-slop defaults with a better alternative
- Prefer content and hierarchy over decoration
- Name tradeoffs honestly
- Reference concrete inspiration (“Linear-like density”) when it helps

**Don't:**

- Block on slash commands
- Ask more than 2 questions up front
- Offer 5+ options or five full coded variants by default
- Start a temporary design-lab route unless the user explicitly asks to explore in-browser
- Start coding blank-canvas UI before a direction is set (unless skip rules apply)

## Output template (before build)

```markdown
## Approaches
**A — … (axis: hierarchy)** … Tradeoff: …
**B — … (axis: density)** … Tradeoff: …  ← recommended: …
**C — … (axis: interaction)** (optional) …

## Recommendation
…

## Need from you
Pick A/B/C (or say “go with recommended”).
```

## Depth

Axes + memory convention: `references/design-axes.md`.  
UX/UI theory + color for products: `references/ux-foundations.md`.  
Anti-patterns: `anti-ai-slop` + `references/anti-patterns.md`.  
Domain how-to stays in the other skills.
