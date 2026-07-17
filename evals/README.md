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

## How to run

1. Open a scratch UI project (or empty folder)
2. Ensure pack is installed (`./scripts/install.sh cursor-user` or skills CLI)
3. Paste the **Prompt** from a scenario
4. Score against **Pass criteria** (binary where possible)
5. Log date + pass/fail in your notes (optional team sheet)

Do **not** treat these as unit tests — they validate agent judgment under the pack’s skills.
