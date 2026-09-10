# Design typography

## Ownership

This reference owns how text renders. `content-design` owns the words; `accessibility` owns semantic headings and accessible names; `design-color` owns measured text/background pairs.

## Decision order

1. Preserve the project’s licensed type system.
2. Identify roles: display, page title, section title, body, label, caption, code, numeric.
3. Add only missing roles; avoid one-off sizes.
4. Verify in the browser with real lengths, languages, zoom, and fallback fonts.

## Recommendations, not universal laws

- Long-form measure around 60–75 characters is a useful reading default; density, language, typeface, and task may change it.
- Body text commonly starts near 16px; dense professional tools may justify smaller UI labels when zoom and legibility remain sound.
- Headings usually need tighter leading than prose; wrapped display text needs more leading than a single line.
- Prefer `woff2`; preload only fonts proven critical to first render.
- Prefer CSS properties such as `font-optical-sizing` and `font-variant-numeric` over raw feature settings when equivalent.

## Robust rendering

| Problem | Response |
|---|---|
| Changing prices/timers shift | `font-variant-numeric: tabular-nums` |
| Heading wraps poorly | Test `text-wrap: balance`; verify language and width |
| Prose leaves a short final word | Test `text-wrap: pretty`; avoid on large bodies without measuring cost |
| Long URL/ID escapes | `overflow-wrap: anywhere` or project-safe break strategy |
| Truncation hides meaning | Tooltip, disclosure, detail view, or accessible full value |
| Mixed direction corrupts order | Correct `lang`/`dir`, logical properties, and `<bdi>` boundaries |

Mobile Safari has historically zoomed focused inputs with small text. Treat 16px input text as a compatibility recommendation and verify against the project’s supported browser matrix; do not use transform hacks without explicit design need.

## Verification

- Render minimum, typical, and maximum realistic content.
- Check 320/768/1024/1440 and 200% zoom.
- Throttle font loading and inspect fallback shift.
- Verify heading semantics separately with `accessibility`.

Sources: `references/source-ledger.md`. Adapted craft guidance attribution: `NOTICE.md`.
