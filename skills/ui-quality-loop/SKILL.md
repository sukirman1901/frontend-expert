---
name: ui-quality-loop
description: >-
  Loop UI work until quality gates pass — judge/build, test, audit, fix, repeat.
  Use when the user wants polished UI, "rapihin sampai bagus", polish until audit
  passes, fix Critical/High design findings, or /polish. Orchestrates
  frontend-judgment, design-tokens, ui-components, responsive-ui, motion,
  anti-ai-slop, ui-feel, accessibility, frontend-testing, and design-reviewer
  scorecard. Do not use for one-shot tiny tweaks unless the user asked to keep
  iterating.
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
| **UI feel** | No Critical/High craft issues on touched UI (concentric radius, hit overlap, `transition: all`, broken press/enter) |
| **Tokens** | No Critical/High raw-hex / off-token issues; greenfield pack preset used decision tree + Token score / `(explicit)` / `(hard-gate)` / project system in Conventions check |
| **Responsive** | Conventions Responsive line present; full-width primary CTA <768; no Critical/High desktop-only layout on greenfield (320–1440) |
| **Hierarchy** | Hierarchy pass (one primary focus + one primary CTA) or waiver for tiny tweaks |
| **Typography** | One h1/page + sequential ladder (or waiver) |
| **Motion** | Shell light defaults **or** named families/patterns from `motion-families.md`; no decorative spam; reduced-motion; hand-roll (not registry default) |
| **A11y** | No Critical keyboard/label/contrast findings (potential or measured) |
| **States** | Loading/error/empty handled for interactive surfaces touched |
| **Tests** | Planned critical cases green, or **explicit waiver** if no test runner / out of scope (document why) |
| **Perf (soft)** | No Critical obvious LCP/CLS footguns in touched UI; else note as remaining |

**Loop continues** while any **Critical** or **High** remains on touched UI.  
**Medium/Low** do not block DONE unless the user asked for zero findings.

Do **not** invent a test stack just to satisfy the Tests gate — waive and list residual risk.

## Iteration cap

- Default **max 3** full AUDIT→FIX cycles after the first build
- On cap: stop, ship best effort, list remaining findings + what would need another round
- Never infinite-loop

## Workflow

### Round 0 — Direction + build

1. Load `frontend-judgment` if non-trivial / blank-canvas
2. After direction: `design-tokens` → (+ `app-shell-routing` / `data-fetching` / `forms-validation` if needed) → `ui-components` → **`responsive-ui`** → **`motion`** (light shell; marketing = families/patterns from `motion-families.md`, hand-roll) → `anti-ai-slop` → `ui-feel` → `accessibility` (+ `webgl` / `fe-seo` if needed)
3. Produce UI + **Conventions check** (`references/compliance-gates.md`)

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

## Checklist

- [ ] Judgment only when blank-canvas / first pass (skip rules honored)
- [ ] Build chain includes **responsive-ui** + **motion** (or waivers)
- [ ] Gates table evaluated each cycle (Anti-slop, Feel, Tokens, Responsive, Hierarchy, Typography, Motion, Shell, A11y, States, Tests)
- [ ] Shell chrome: theme topbar + avatar menu + custom selects (or waivers)
- [ ] Conventions check filled before DONE
- [ ] Cap ≤3 fix cycles; STOP lists remaining Critical/High if any
- [ ] No fabricated audit scores

## Depth

- Lifecycle A→Z: `references/fe-lifecycle.md`  
- Judgment: `frontend-judgment`  
- Build: `design-tokens`, `ui-components`, **`responsive-ui`**, **`motion`** (`motion-families.md`), `anti-ai-slop`, `ui-feel`, `accessibility`  
- Test: `frontend-testing` (+ `fe-devtools` when measuring)  
- Audit: `design-reviewer` + `references/anti-patterns.md` / `references/ui-feel.md` / a11y / performance as needed  
