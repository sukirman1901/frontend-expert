# Pack audit log

## 2026-07-17 — Compliance gates (Reicon / WebGL follow-through)

Problem: skills installed but agent shipped `test/` settings with **zero icons**.  
Fix: `references/compliance-gates.md` + MUST rules in Cursor/Claude + Conventions check in `ui-developer` / `ui-components` / `/ui`; stronger `webgl` skill; eval E5.

## 2026-07-17 — Phase 3 (evals, tokens README, promote webgl/monitoring)

- `evals/` — purple reject, scorecard honesty, loop cap, rapihin routing
- `tokens/README.md` — HSL vs OKLCH/hex usage + import
- Promoted `webgl` + `monitoring` to real skills (12 total)
- Smoke checks evals + tokens README

## 2026-07-17 — Phase 1+2 follow-up (lifecycle + P2 gaps)

- Added `references/fe-lifecycle.md` (A→Z process map)
- `install.sh cursor-user` — symlink personal Cursor skills (anti-drift)
- anti-slop hook: `transition: all` / `transition-all` / bare Tailwind `transition`
- session-start: lifecycle + rapihin routing reminder

## 2026-07-17 — Post-improvement workflow audit

### Verdict

**Core loop still matches spec.** Chat-first + `/polish` quality loop (`JUDGE* → BUILD → TEST → AUDIT → FIX`, max 3) is consistent across `ui-quality-loop`, commands, AGENTS, Cursor/Claude rules, and adapters. `scripts/smoke-test.sh` **PASSED** (10 skills, 3 agents, command sync).

Build chain (canonical):

`frontend-judgment*` → `design-tokens` → `ui-components` → `anti-ai-slop` → `ui-feel` → `accessibility` (+ `motion` if needed)

Polish gates include Anti-slop, **UI feel**, Tokens, A11y, States, Tests, Perf (soft).

### Layer health (current)

| Layer | Status |
|-------|--------|
| Commands `/ui` `/design` `/audit` `/test-ui` `/polish` | OK — adapters synced |
| Agents (3) | OK — ui-developer, design-reviewer, test-engineer |
| Skills (10) | OK |
| References | Grew a lot (ui-feel, design-axes, ux-foundations, reicon, webgl/Plasma); still skill-backed vs orphan map |
| Hooks | OK anti-slop (classic patterns only); session-start mentions Reicon + ui-feel path |
| Multi-platform | OK |

### Aligned with original loop spec

- Cap 3, no infinite audit
- Critical/High block; Medium/Low don’t (unless user asks)
- Agents don’t call each other; session agent is loop controller
- Judgment skip rules for tiny / “langsung saja”
- Honesty: don’t fabricate visual scores without tokens/screenshots

### Gaps / risks (ordered)

| Pri | Gap | Impact | Suggested fix |
|-----|-----|--------|----------------|
| **P0** | Intent collision: bare **“rapihin”** matches judgment *and* feel *and* polish-ish language | Wrong skill path (axes interview vs micro craft vs full loop) | Disambiguate in AGENTS/rules (done in follow-up) |
| **P0** | “Feels off” listed as `/ui` **or** `/polish` | Agent may skip test/audit loop or over-loop | One-shot → `ui-feel`; “sampai bagus / lulus audit” → `ui-quality-loop` |
| **P1** | `docs/AUDIT.md` was stale (8 skills / 2 agents) | Maintainers misread health | This entry |
| **P1** | design-reviewer finding **Area** enum omitted UI Feel | Scorecard has UI Feel but findings tags don’t | Add area tag |
| **P1** | `/audit` blurb still pre–ui-feel | Minor doc drift | Update description |
| **P2** | anti-slop **hook** doesn’t flag `transition: all` / feel craft | Runtime only catches classic AI slop | Optional hook extend |
| **P2** | Cursor install = **file copies** of skills | Drift vs repo after pull | Prefer symlink/`install.sh` refresh docs |
| **P2** | Polish **TEST** gate when project has no test runner | Agents may invent tooling or stall | Emphasize waiver path in loop skill |
| **P3** | No eval scenarios (purple reject, scorecard honesty, loop cap) | Regressions hard to catch | Add later |
| **P3** | Orphan refs: `webgl`, `monitoring` | Fine until promoted | Keep |
| **P3** | Full Design Lab browser explore | Out of scope by choice | Phase 2 only if requested |
| **P3** | `ux-foundations` theory not auto-loaded except via judgment/tokens/a11y depth links | OK for v1 | — |

### Ambiguous user phrases (routing contract)

| User says | Should load |
|-----------|-------------|
| rapihin **detail** / feels off / micro polish | `ui-feel` (+ anti-slop if generik) — **one pass**, no loop |
| rapihin **sampai bagus** / sampai lulus audit / polish until clean | `ui-quality-loop` |
| rapihin (alone) on **existing** UI | Prefer `ui-feel` + light anti-slop — **not** blank-canvas judgment |
| rapihin (alone) on **vague new** UI | `frontend-judgment` first, then build chain |
| audit saja | `design-reviewer` chain — **no** fix loop |

### Still optional later

- `tokens/README.md` import notes
- Eval scenarios
- Hook: `transition: all` / bare `transition`
- Symlink-based Cursor skill install
- Promote webgl/monitoring only if demand rises
