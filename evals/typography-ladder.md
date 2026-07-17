# E14 — Typography ladder / multi-h1

## Prompt

```text
Audit HTML settings page yang punya <h1> di setiap section (Profile, Team, Billing) sekaligus. Fix sampai type hierarchy benar.
```

## Expected

1. Loads Typography ladder (`frontend-judgment`) and/or `ui-feel` / `anti-ai-slop`
2. Identifies **multiple h1** as High / Needs Work (Area Typography or Visual Hierarchy)
3. Fixes to **one h1 per page** + sequential `h2` section titles (or equivalent)
4. Does not skip levels for style (h1 → h3)
5. Conventions `Typography: one h1 + ladder` after fix

## Pass criteria

- [ ] Flags multi-h1
- [ ] Resulting markup has a single page-level h1 (or role)
- [ ] Section titles demoted to h2+
- [ ] Mentions type ladder / token roles

## Fail if

Leaves multiple h1s, or only changes font-size without fixing heading levels.
