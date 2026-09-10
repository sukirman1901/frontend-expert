# Anti-slop code

Skill entry: `skills/anti-slop-code/SKILL.md`.
Visual AI tells belong to `anti-slop-design`. Words belong to `content-design`. This file owns **implementation**.

These patterns are **heuristics** for generated frontend code unless a row says otherwise. Prefer the project’s linter and conventions when they already decide.

## Catalog

| Pattern | Detection | Fix | Handoff |
|---------|-----------|-----|---------|
| Effect-derived state | `useEffect` that `setState`s from props/state already in scope | Compute during render | — |
| Effect as cache | Fetch in `useEffect` + local mirror of server data | Query/loader | `data-fetching` |
| Type lies | `any`, `as unknown as`, empty `interface {}` | Name the real type or `unknown` + narrow | — |
| Disable spray | file-level `eslint-disable`, `eslint-disable-next-line` without reason | Fix the rule or keep one disable with why | — |
| Empty wrapper | component that only returns `<Other …props />` | Use `Other` at the call site | — |
| Premature util | `utils/` or `useX` with one caller | Inline until a second use | — |
| Context for one boolean | Provider wrapping a single toggle | Local state or lift one level | `architecture` if it becomes app-wide |
| Client on server-safe files | `"use client"` on a file with no hooks/events | Drop the directive | `architecture` for island boundaries |
| Index keys on unstable lists | `key={i}` on insert/reorder collections | Stable id | — |
| Swallowed failure | empty `catch`, `.catch(() => {})` | Surface error UI | `data-fetching` / `forms` |
| Fake pending | `setTimeout` to show a spinner | Real request state | `data-fetching` |
| Comment narration | `// increment counter` above `count + 1` | Delete; keep “why” comments | — |
| Boolean/style prop bag | `showHeader`, `padding`, `shadow` on one component | Composition + tokens | `components` |
| God module | 12 `useState`s, mixed fetch + layout + form | Split by job, not by type | `architecture` if folders move |
| Leftover generator | `console.log`, `TODO: GPT`, unused imports | Delete | — |

```yaml
principle: Do not use effects to derive render values
classification: recommendation
recommendation: compute from current props/state during render; effects synchronize with external systems
applies_when:
  - React function components
exceptions:
  - subscriptions, timers, imperative APIs, browser storage, non-React widgets
verification:
  - removing the effect does not require a second render to show the value
basis: current React docs (You Might Not Need an Effect)
last_verified: 2026-09
```

```yaml
principle: Extract on the second use
classification: heuristic
recommendation: keep a helper local until a second call site exists
exceptions:
  - project-required shared primitives
  - tested public API
verification:
  - search for other callers before adding utils/hooks/context
last_verified: 2026-09
```

## Review output

For rewrite requests, report:

```markdown
| Tell | Before | After | Owner |
|------|--------|-------|-------|
| Effect-derived | useEffect setFullName | `${first} ${last}` in render | anti-slop-code |
```

Do not mark the pass “cleaner” without a table. Do not claim a security review.

Authorship boundary: `NOTICE.md`.
