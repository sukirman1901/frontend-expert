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

## How to run

1. Open a scratch UI project (or empty folder)
2. Ensure pack is installed (`./scripts/install.sh cursor-user` or skills CLI)
3. Paste the **Prompt** from a scenario
4. Score against **Pass criteria** (binary where possible)
5. Log date + pass/fail in your notes (optional team sheet)

Do **not** treat these as unit tests — they validate agent judgment under the pack’s skills.
