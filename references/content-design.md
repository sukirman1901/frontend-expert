# Content design

Skill entry: `skills/content-design/SKILL.md`.
Visual AI tells belong to `anti-slop-design`. This file owns **words**.

## Core patterns

| Surface | Pattern |
|---|---|
| Button | Verb + specific object when context is not obvious |
| Empty state | What is absent + why it matters + available action |
| Error | What happened in user terms + retained state + recovery/next step |
| Destructive dialog | Action, named object, consequence, reversibility |
| Helper text | Information needed before action, not a restatement of the label |
| Success | Confirm outcome; next action only when it is actually next |

## Before and after

| Before | After | Why |
|---|---|---|
| “Something went wrong.” | “We couldn’t save this draft. Your changes are still here—try again.” | Names outcome, retained state, and recovery |
| “Are you sure?” | “Delete ‘Q3 forecast’? This removes it for everyone and can’t be undone.” | Names object and consequence |
| “Unlock the power of seamless productivity.” | “Review approvals, owners, and due dates in one queue.” | Replaces hype with a verifiable product job |
| “No data yet.” | “No invoices this month. Create one or change the date range.” | Empty state with a path forward |
| “Submit” on a destructive form | “Delete invoice” | Button names the irreversible act |

Adapt wording to **actual** product behavior. If retry, retained state, scope, or reversibility is unknown, ask or state the uncertainty; never invent it.

```yaml
principle: Do not invent product facts
classification: product requirement
recommendation: unknown recovery/reversibility is asked or disclosed, not guessed
verification: [every new claim maps to a known behavior or is marked unknown]
last_verified: 2026-09
```

## AI-writing catalog

These are **heuristics** for generic generated prose, not a ban on strong product language.

| Pattern | Detection | Fix |
|---------|-----------|-----|
| Hype verbs | unlock, elevate, supercharge, seamless, next-gen, robust, cutting-edge | Name the job the screen actually does |
| Throat-clearing | “In today’s fast-paced world…”, “It’s important to note…” | Delete; start with the action or fact |
| Stacked adjectives | three modifiers, no noun precision | One concrete phrase |
| False dichotomy | “Not just X — Y” with no real contrast | State the actual difference or drop it |
| Fake proof | invented % , customer quotes, logo names | Remove; only sourced facts stay |
| Generic error | “Something went wrong”, “Error occurred” | What + next step |
| Generic confirm | “Are you sure?” | Object + consequence + reversibility |
| Echo conclusion | last paragraph restates the intro | Cut |
| Layout-tied language | “click the button on the right” | Name the control, not its geography |
| Concatenated i18n | `"Hello, " + name` | One interpolatable sentence |

Lorem ipsum in a **layout** is also an `anti-slop-design` tell. Replacing it is this skill’s job: realistic product language, or an explicit placeholder labeled as such.

## Localization and accessibility

- Keep sentences whole; do not concatenate translated fragments.
- Allow expansion and different word order; avoid directional language tied to layout.
- Accessible names must still make sense without surrounding visual context.
- Live-region wording is content; live-region **mechanics** belong to `accessibility`.

## Review output

For rewrite requests, report:

```markdown
| Surface | Before | After | Fact source |
|---------|--------|-------|-------------|
| Error | … | … | known retry / unknown |
```

Do not mark writing “done” with only adjectives (“clearer, more friendly”).

Authorship boundary: `NOTICE.md`.
