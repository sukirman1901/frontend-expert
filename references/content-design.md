# Content design

## Core patterns

| Surface | Pattern |
|---|---|
| Button | Verb + specific object when context is not obvious |
| Empty state | What is absent + why it matters + available action |
| Error | What happened in user terms + retained state + recovery/next step |
| Destructive dialog | Action, named object, consequence, reversibility |
| Helper text | Information needed before action, not a restatement of the label |
| Success | Confirm outcome; point to the next meaningful action only when useful |

## Before and after

| Before | After | Why |
|---|---|---|
| “Something went wrong.” | “We couldn’t save this draft. Your changes are still here—try again.” | Names outcome, retained state, and recovery |
| “Are you sure?” | “Delete ‘Q3 forecast’? This removes it for everyone and can’t be undone.” | Names object and consequence |
| “Unlock the power of seamless productivity.” | “Review approvals, owners, and due dates in one queue.” | Replaces hype with a verifiable product job |

Adapt wording to actual product behavior. If retry, retained state, scope, or reversibility is unknown, ask or state the uncertainty; never invent it.

## Localization and accessibility

- Keep sentences whole; do not concatenate translated fragments.
- Allow expansion and different word order; avoid directional language tied to layout.
- Accessible names must still make sense without surrounding visual context.
- Use live-region announcements only for state changes that need them; accessibility owns mechanics.

## AI-writing scan

Remove throat-clearing, stacked adjectives, false dichotomies, generic “elevate/unlock/seamless” claims, fake quotations, and repetitive summary conclusions. Preserve necessary domain terminology and the author’s natural voice.

Authorship boundary: `NOTICE.md`.
