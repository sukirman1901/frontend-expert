# Eval scenarios

Manual / agent pressure tests for this pack. Run with a fresh chat that has the pack loaded; compare behavior to **Expected**.

```bash
# Pack integrity (not behavioral)
./scripts/smoke-test.sh
```

| ID | Scenario | File |
|----|----------|------|
| E1 | Purple / AI-slop rejection | [purple-reject.md](./purple-reject.md) |
| E2 | Scorecard honesty | [scorecard-honesty.md](./scorecard-honesty.md) |
| E3 | Quality loop cap | [loop-cap.md](./loop-cap.md) |
| E4 | Rapihin routing | [rapihin-routing.md](./rapihin-routing.md) |
| E5 | Reicon + WebGL compliance | [reicon-webgl-compliance.md](./reicon-webgl-compliance.md) |
| E6 | Token preset scoring | [token-preset-scoring.md](./token-preset-scoring.md) |
| E7 | Responsive all devices | [responsive-all-devices.md](./responsive-all-devices.md) |
| E8 | Data fetching states | [data-fetching.md](./data-fetching.md) |
| E9 | Forms validation | [forms-validation.md](./forms-validation.md) |
| E10 | App shell routing | [app-shell-routing.md](./app-shell-routing.md) |
| E11 | Ship feature end-to-end | [ship-feature-e2e.md](./ship-feature-e2e.md) |
| E12 | Modern dashboard shell | [dashboard-shell.md](./dashboard-shell.md) |
| E13 | Visual hierarchy fail | [visual-hierarchy.md](./visual-hierarchy.md) |
| E14 | Typography ladder / multi-h1 | [typography-ladder.md](./typography-ladder.md) |
| E15 | Auto Layout Fill → full-width CTA | [auto-layout-fill-cta.md](./auto-layout-fill-cta.md) |
| E16 | Design fidelity mismatch | [design-fidelity.md](./design-fidelity.md) |
| E17 | FE SEO minimum | [fe-seo.md](./fe-seo.md) |
| E18 | FE architecture boundaries | [fe-architecture.md](./fe-architecture.md) |
| E19 | Monitoring signals | [monitoring.md](./monitoring.md) |
| E20 | Motion family pick + hand-roll | [motion-families.md](./motion-families.md) |
| E21 | Frontend testing + DevTools | [frontend-testing-devtools.md](./frontend-testing-devtools.md) |
| E22 | Shell chrome: theme, avatar menu, custom select | [frontend-shell-chrome.md](./frontend-shell-chrome.md) |
| E23 | Marketing landing section stack | [marketing-landing.md](./marketing-landing.md) |
| E24 | Design typography | [design-typography.md](./design-typography.md) |
| E25 | Design color | [design-color.md](./design-color.md) |
| E26 | Design surfaces | [design-surfaces.md](./design-surfaces.md) |
| E27 | Content design | [content-design.md](./content-design.md) |
| E28 | Structural design foundations | [design-foundations.md](./design-foundations.md) |
| E29 | Component props / API | [components.md](./components.md) |
| E30 | Anti-slop code | [anti-slop-code.md](./anti-slop-code.md) |
| E31 | Prototype | [prototype.md](./prototype.md) |
| E32 | Motion inspection | [motion-inspection.md](./motion-inspection.md) |

## Desk vs live

| Kind | What it proves | Where |
|------|----------------|-------|
| Desk contract | Trigger phrases still map to the right skill files | `./scripts/eval-routing-contract.sh` (also in smoke-test) |
| Live | Fresh chat actually loads those skills | Paste [PASTE.md](./PASTE.md) — **do not** mark Live pass from desk-review |

Scorecards from a machine (`evals/runs/`) stay local and gitignored.

## How to run (live)

1. Open a **fresh** chat with this pack loaded (not the pack-authoring thread)
2. Paste one prompt from [PASTE.md](./PASTE.md)
3. Score against **Pass criteria** in the matching `evals/*.md`
4. Log the result under `evals/runs/` with Live = pass/fail

Do **not** treat the routing script as a behavioral unit test — it only guards phrase drift.
