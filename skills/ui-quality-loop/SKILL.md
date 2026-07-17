---
name: ui-quality-loop
description: >-
  Loop UI work until quality gates pass — judge/build, test, audit, fix, repeat.
  Use when the user wants polished UI, "rapihin sampai bagus", polish until audit
  passes, fix Critical/High design findings, or /polish. Orchestrates
  frontend-judgment, design-tokens, ui-components, anti-ai-slop, accessibility,
  frontend-testing, and design-reviewer scorecard. Do not use for one-shot tiny
  tweaks unless the user asked to keep iterating.
---

# UI Quality Loop

## Overview

Run a **tight quality loop** until the UI clears gates (or hit the iteration cap). This is the pack’s mini lifecycle — not full `/spec`→`/ship`, but **build → prove → audit → fix** until it’s good.

```text
JUDGE* → BUILD → TEST → AUDIT ──Critical/High──▶ FIX ──▶ TEST → AUDIT …
                         │
                       PASS → DONE
```

\* Judgment only on blank-canvas / first pass (see `frontend-judgment` skip rules).

## When to use

- User asks to polish, rapihin, “sampai lulus audit”, “UI bagus dulu baru selesai”
- `/polish` or natural language equivalent
- After a `/design`/`/audit` with Critical/High findings and user wants them cleared

## When to skip

- Single-line copy/token tweak with no quality ask
- Pure audit with no fix permission (“audit saja”)
- User said stop / “cukup” / accepted remaining Medium/Low

## Agents (orchestrate — do not nest personas forever)

| Step | Agent |
|------|--------|
| Judgment + build + fix | `ui-developer` |
| Test | `test-engineer` |
| Audit | `design-reviewer` |

You (the session agent) are the **loop controller**. Personas do not call each other; you invoke their workflows in sequence.

## Gates (pass / fail)

| Gate | Pass when |
|------|-----------|
| **Anti-slop** | No Critical/High AI-aesthetic findings |
| **Tokens** | No Critical/High raw-hex / off-token color-radius issues (or custom system honored) |
| **A11y** | No Critical keyboard/label/contrast findings (potential or measured) |
| **States** | Loading/error/empty handled for interactive surfaces touched |
| **Tests** | Planned critical cases green, or explicit waiver documented |
| **Perf (soft)** | No Critical obvious LCP/CLS footguns in touched UI; else note as remaining |

**Loop continues** while any **Critical** or **High** remains on touched UI.  
**Medium/Low** do not block DONE unless the user asked for zero findings.

## Iteration cap

- Default **max 3** full AUDIT→FIX cycles after the first build
- On cap: stop, ship best effort, list remaining findings + what would need another round
- Never infinite-loop

## Workflow

### Round 0 — Direction + build

1. Load `frontend-judgment` if non-trivial / blank-canvas
2. After direction: `design-tokens` → `ui-components` → `anti-ai-slop` → `accessibility` (+ `motion` if needed)
3. Produce UI

### Each cycle — Prove + audit + fix

1. **TEST** — `frontend-testing` via `test-engineer` (/test-ui workflow) for touched surfaces  
2. **AUDIT** — `design-reviewer` scorecard (/design or /audit). Mark unevaluated honestly.  
3. **DECIDE**
   - All Critical/High clear → **DONE** (report scorecard + remaining Medium/Low)
   - Else if iterations left → **FIX** with `ui-developer` (only findings that block gates)
   - Else → **STOP** at cap with remaining list

### Fix discipline

- Fix highest severity first
- Prefer token/system fixes over one-off hacks
- Re-run TEST for behavior you changed
- Do not expand scope to unrelated pages

## Output template (every cycle)

```markdown
## Quality loop — cycle N/3

### Test
- … pass/fail …

### Audit scorecard
| Metric | Status | Notes |
|--------|--------|-------|
| … | … | … |

### Blocking (Critical/High)
1. …

### Action
FIX … | DONE | STOP (cap)
```

## Final output (DONE or STOP)

1. What shipped / changed  
2. Final scorecard  
3. Remaining Medium/Low (if any)  
4. Cycles used  

## Depth

- Judgment: `frontend-judgment`  
- Build: `design-tokens`, `ui-components`, `anti-ai-slop`, `accessibility`  
- Test: `frontend-testing`  
- Audit: `design-reviewer` + `references/anti-patterns.md` / a11y / performance as needed  
