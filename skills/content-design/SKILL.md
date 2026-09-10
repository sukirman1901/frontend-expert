---
name: content-design
description: >-
  Write and repair UI copy: labels, CTAs, errors, empty states, confirmations,
  onboarding, product voice, localization-ready strings, and AI-sounding prose.
  Trigger for “copy terasa AI”, “pesan error”, “teks tombol”, “empty state”,
  “tulisan generik”, or docs/changelog that read like filler. Visual slop stays
  on anti-slop-design; this skill owns words.
---

# Content Design

## Overview

Copy helps someone understand, act, and recover. Product facts beat generic enthusiasm. AI-sounding prose is a content defect, not a separate pack domain.

## When to use

- Labels, buttons, help, empty/error/success, confirmations, onboarding
- Terminology, voice, or localization-ready strings
- README, changelog, docs, or marketing sentences that read like filler

## When to skip

- Visual rendering, wrapping, truncation → `design-typography`
- Validation mechanics → `forms`
- Landing section stack / IA → `marketing`
- Purple/gradients/Lorem-as-layout → `anti-slop-design` (then replace Lorem here)

## MUST

| Rule | Detail |
|------|--------|
| **Preserve facts** | Never invent capabilities, metrics, quotes, logos, or guarantees |
| **Unknown ≠ fiction** | If retry, reversibility, or scope is unknown, ask or say so |
| **Action-led** | Buttons name the action; errors name what happened and the next step |
| **Consequence-first** | Destructive copy names object, outcome, and whether it can be undone |
| **One term** | One concept keeps one name across the flow |
| **Localization-ready** | Whole sentences; no concatenated fragments; don’t depend on layout direction |
| **Before/after** | Review work shows concrete rewrites, not vibe notes |

## AI-writing scan

| Pattern | Fix |
|---------|-----|
| Unlock / elevate / seamless / next-gen | Name the actual job |
| “Something went wrong.” | What failed + retained state + recovery |
| “Are you sure?” | Named object + consequence |
| Stacked adjectives | One concrete noun phrase |
| Fake metrics or testimonials | Delete, or use a real sourced fact |
| Throat-clearing intros | Start at the action |
| Repeated summary conclusions | Cut the echo |

## Workflow

1. **Inventory** — audience, task, known facts, terms, tone, states.
2. **Scan** — hype, missing recovery, inconsistency, translation risk.
3. **Rewrite** — meaning, action, consequence, or recovery first.
4. **Fit** — realistic length and expansion; don’t truncate away meaning.
5. **Verify** — before/after; no invented facts; flow still complete.

## Boundaries

- **May decide:** concise wording in the product’s existing voice.
- **Must not:** fabricate proof, hide consequences, or treat visual truncation as a copy fix.

## Checklist

- [ ] Facts inventoried; unknowns labeled
- [ ] CTA / error / empty / destructive copy is specific
- [ ] AI-writing scan clean
- [ ] Before/after shown for review work
- [ ] Strings survive expansion

## Depth

Full guide: `references/content-design.md`.
Visual slop catalog: `references/anti-patterns.md`.
