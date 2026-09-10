# Anti-slop code

Skill entry: `skills/anti-slop-code/SKILL.md`.
Visual AI tells belong to `anti-slop-design`. Words belong to `content-design`. Query chrome belongs to `data-fetching`. Folders/state belong to `architecture`. Measured CWV belongs to `performance`. This file owns **implementation in system context**.

These patterns are **heuristics** for generated frontend code unless a row says otherwise. Prefer the project’s linter and conventions when they already decide. If retry, idempotency, conflict, or scale limits are unknown, ask or label them — do not invent.

## Catalog — local tells

| Pattern | Detection | Fix | Handoff |
|---------|-----------|-----|---------|
| Effect-derived state | `useEffect` that `setState`s from props/state already in scope | Compute during render | — |
| Effect as cache | Fetch in `useEffect` + local mirror of server data | Query/loader | `data-fetching` |
| Type lies | `any`, `as unknown as`, empty `interface {}` | Name the real type or `unknown` + narrow | — |
| Disable spray | file-level `eslint-disable` without reason | Fix the rule or keep one disable with why | — |
| Empty wrapper | component that only returns `<Other …props />` | Use `Other` at the call site | — |
| Premature util | `utils/` or `useX` with one caller | Inline until a second use | — |
| Context for one boolean | Provider wrapping a single toggle | Local state or lift one level | `architecture` if app-wide |
| Client on server-safe files | `"use client"` on a file with no hooks/events | Drop the directive | `architecture` for islands |
| Index keys on unstable lists | `key={i}` on insert/reorder collections | Stable id | — |
| Fake pending | `setTimeout` to show a spinner | Real request state | `data-fetching` |
| Comment narration | `// increment counter` above `count + 1` | Delete; keep “why” comments | — |
| Boolean/style prop bag | `showHeader`, `padding`, `shadow` | Composition + tokens | `components` |
| God module | 12 `useState`s, mixed fetch + layout + form | Split by job, not by type | `architecture` if folders move |
| Leftover generator | `console.log`, `TODO: GPT`, unused imports | Delete | — |

## Catalog — isolated vs system

Generated cleanups often pass a unit glance and fail as a product.

| Pattern | Detection | Fix |
|---------|-----------|-----|
| Isolated helper | New fetch/transform that a sibling loader or query already owns | Reuse the existing source; do not add a parallel client path |
| Cache stampede | `invalidateQueries()` with no key, or refetch every list on one mutation | Invalidate the keys this write actually changes |
| N+1 from the UI | `map` that fires a request per row | Batch, include in the parent payload, or paginate on the server |
| Client-side dump | Load the full collection to filter/sort in the browser | Use the API’s filter/page/cursor when it exists |
| Waterfall | Sequential awaits for independent data | Parallelize or lift to the existing server/loader |
| Hidden coupling | Change a shared type, session shape, or event name without listing consumers | Search callers; keep a compatibility path or update them in the same change |
| Unbounded work | Listeners, intervals, or lists with no cap or teardown | Teardown; page/window; don’t grow with traffic in one component |

```yaml
principle: Do not optimize a function in isolation from its blast radius
classification: recommendation
recommendation: name callers, shared cache keys, and server round-trips before rewriting a helper
applies_when:
  - changing fetch, cache, shared types, or modules other screens import
exceptions:
  - true leaf presentational tweaks with no shared data
verification:
  - search for callers and cache keys; no new duplicate request path
last_verified: 2026-09
```

Server load and scale here mean **what the UI causes** (chatty calls, over-fetch, stampede). Lighthouse/CWV campaigns stay on `performance`. Folder ownership stays on `architecture`.

## Catalog — field errors, not boilerplate

A standard `catch { toast("Something went wrong") }` is itself slop. Map **this** surface. Implement what product facts support; label the rest unknown.

| Mode | Typical signal | What to do |
|------|----------------|------------|
| Abort / unmount | user left, Strict Mode remount | Ignore aborted; do not toast a leftover error |
| Timeout / offline | network down, hung request | Retry only if idempotent; otherwise say so |
| Auth expired | 401 | Re-auth path; do not look like “not found” |
| Forbidden | 403 | Different copy and no retry that cannot succeed |
| Missing | 404 | Empty vs deleted vs wrong id — do not reuse one empty state |
| Empty success | 200 + `[]` | Empty state, not an error |
| Conflict / stale | 409 or version mismatch | Refresh or merge; do not blindly retry the old write |
| Rate limit | 429 | Back off; do not tight-loop Retry |
| Validation | 422 / field errors | Field messages via `forms`; not a page toast only |
| Partial success | batch with mixed results | Show what committed; don’t roll the whole UI to error |
| Double submit | double click, retry + in-flight | Disable pending; idempotency key if the API has one |

```yaml
principle: Error handling follows this integration’s failures, not a generic catch
classification: recommendation
recommendation: name abort, auth, empty vs 404, conflict, 429, and in-flight duplicate before shipping a toast
exceptions:
  - throwaway prototypes with no persistence
verification:
  - each catch path maps to a known product behavior or is marked unknown
last_verified: 2026-09
```

Swallowed `catch {}` still fails. Replacing it with one generic toast also fails. Recovery chrome (retry button, skeleton) is `data-fetching`; the **taxonomy** is this skill.

## Review output

For rewrite requests, report:

```markdown
| Tell | Before | After | Blast radius / fact |
|------|--------|-------|---------------------|
| Isolated fetch | extra useEffect GET | reuse invoice query | invoices list + detail |
| Generic catch | toast “failed” | 409 refresh; 429 labeled unknown | billing write |
```

Do not mark the pass “cleaner” without that table. Do not claim a security review or a CWV audit.

Authorship boundary: `NOTICE.md`.
