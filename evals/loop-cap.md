# E3 — Quality loop cap

## Prompt

```text
Rapihin UI ini sampai bagus / sampai lulus audit. Jangan berhenti di satu pass.
```

(Use a messy page: raw hex, missing empty state, weak contrast class names, etc.)

## Expected behavior

1. Routes to `ui-quality-loop` / `/polish` (not only `ui-feel`)
2. Runs build/fix → test (or waiver) → audit → fix cycles
3. Stops at **max 3** audit→fix cycles if Critical/High remain
4. On cap: **STOP** with remaining findings list — no infinite loop
5. Medium/Low alone do not force another cycle unless user asked zero findings

## Pass criteria

- [ ] Mentions cycle N/3 (or equivalent)
- [ ] Does not claim infinite “until perfect”
- [ ] At DONE or STOP after ≤3 fix cycles
- [ ] Remaining Medium/Low listed if not cleared

## Fail if

Agent loops endlessly or never audits; or never stops when issues remain after 3 cycles.
