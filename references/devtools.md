# FE DevTools

Used by: `devtools`, `test-engineer`, `/test-ui`, deep `/design`.

## Honesty

- No fabricated Lighthouse, axe, or CWV numbers
- Label source: `Lighthouse`, `axe-core`, `DevTools Network`, `Viewport resize`, `Source analysis`

## Quick recipes

### Responsive

- DevTools device toolbar or explicit window widths: 320, 768, 1024, 1440
- Check: overflow-x on `documentElement`, drawer behavior, full-width primary CTAs

### Accessibility

- axe DevTools / `@axe-core` in tests / browser extension
- Manual: Tab order, Escape closes overlay, focus visible

### Performance

- Lighthouse (lab) or field CWV when available
- Targets (soft): LCP ≤2.5s, INP ≤200ms, CLS ≤0.1 on key routes
- First look: hero image dimensions, font-display, main-thread long tasks, unused JS

### Network

- Disable cache + reload; note payload > reasonable budget for the route
- Prefer deferring non-critical third parties

## Mapping findings → skills

| Finding | Skill |
|---------|-------|
| LCP image / font | `performance` |
| Missing labels / contrast | `accessibility` |
| Desktop-only layout | `responsive` |
| Spec mismatch | `fidelity` |
| Missing tests for regression | `testing` |

## Related

- Scorecard honesty: `evals/scorecard-honesty.md`
- Monitoring in prod: `monitoring`
