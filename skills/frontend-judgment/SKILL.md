---
name: frontend-judgment
description: >-
  Senior frontend judgment before building UI — offer 2–3 approaches with
  tradeoffs, ask at most 1–2 clarifying questions when ambiguous, then proceed.
  Use at the start of non-trivial UI work (new page, flow, blank-canvas layout,
  navigation tradeoffs) and whenever the user has not specified a clear direction.
  Skip for obvious bugfixes, single-token tweaks, or when the user says to just
  implement. Does not replace domain skills; runs before them.
---

# Frontend Judgment

## Overview

Feel like a senior frontend engineer: **decide with the user, then build**. Do not dump a generic UI for blank-canvas work. This skill is a short gate before `design-tokens` / `ui-components` / etc.

## When to use (mandatory gate)

Run this **before** domain skills when any of these apply:

- New page, screen, flow, or blank-canvas layout
- Unspecified information architecture / navigation / density
- Multiple reasonable visual or interaction directions
- User ask is vague (“bikin dashboard”, “UI modern”, “rapihin”)

## When to skip

- Clear bugfix with known expected behavior
- Tiny change (one component prop, one token color, copy tweak)
- User already chose a direction or said “langsung saja” / “just implement”
- Pure `/design` audit with no implementation request
- Follow-up turn continuing an already-approved plan

## Workflow

### 1. Clarify only if blocked (max 1–2 questions)

Ask only what changes the design. Prefer multiple choice. Do **not** interview for everything.

Examples worth asking: primary user job, desktop-only vs mobile-first, density (spacious vs compact).

### 2. Offer 2–3 approaches

For each option:

- **Name** (short)
- **What it looks/behaves like** (1–2 sentences)
- **Tradeoff** (speed, clarity, density, a11y, implementation cost)
- Mark **one recommendation** and why (1 sentence)

Keep the whole offer scannable — no essays.

### 3. Wait for a clear choice

- Affirmative on one option → proceed to domain skills
- Hedged (“maybe”, “whatever”) → pick the recommended option **and state that**, or ask one tight confirming question
- “Langsung saja” → pick recommendation and build

### 4. Hand off

After a direction is set, load in order (unless the task is narrower):

`design-tokens` → `ui-components` → `anti-ai-slop` → `accessibility` (+ `motion` / `frontend-testing` if in scope)

Do not re-litigate the approach mid-build unless new constraints appear.

## Expert voice (do / don't)

**Do:**

- Push back on AI-slop defaults with a better alternative
- Prefer content and hierarchy over decoration
- Name the tradeoff honestly (“lebih cepat ship, kurang scalable”)

**Don't:**

- Block on slash commands
- Ask more than 2 questions up front
- Offer 5+ options
- Start coding a blank-canvas UI before a direction is set (unless skip rules apply)

## Output template (before build)

```markdown
## Approaches
**A — …** … Tradeoff: … 
**B — …** … Tradeoff: …  ← recommended: …
**C — …** (optional) …

## Recommendation
…

## Need from you
Pick A/B/C (or say “go with recommended”).
```

## Depth

Domain how-to stays in the other skills. Visual anti-patterns: `anti-ai-slop` + `references/anti-patterns.md`.
