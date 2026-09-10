---
name: polish
description: Loop build → test → audit → fix until UI quality gates pass (or hit iteration cap).
---

# /polish

Run the **UI quality loop** until Critical/High findings are cleared (max 3 fix cycles), or stop with a clear remaining list.

## Skills to load

1. `quality-loop` — controller (gates, cycles, output)
2. Then per step, as the loop requires:
   - `design-direction` (first blank-canvas only — includes Hierarchy / Typography passes)
   - `tokens` → (+ shell/data/forms) → `components` → `responsive` → **`motion`** (light shell / named families from `motion-families.md`, hand-roll) → `anti-slop-design` → `polish` → `accessibility`
   - `testing`
   - design-reviewer audit chain (`anti-slop-design`, `polish`, `motion` when animated, tokens, `responsive`, a11y, `performance`)

## Agents

- Build/fix: `ui-developer`
- Test: `test-engineer`
- Audit: `design-reviewer`

## What It Does

1. Judge (if needed) + build or take current UI
2. Test touched surfaces
3. Audit with honesty scorecard
4. Fix Critical/High → re-test → re-audit
5. Repeat until pass or cap (3)
6. Report DONE or STOP with remaining findings

## Usage

```
/polish                      # Full loop on current / in-progress UI
/polish --max 2              # Cap fix cycles at 2 (default 3)
/polish --audit-only-fix    # Skip greenfield judgment; fix from last audit
```

## Chat-first

Same workflow when user says: “rapihin sampai bagus”, “polish until audit passes”, “ulang audit sampai clean”.
