## 2026-07-17 — Frontend Expert suite + responsive MUST

Implemented suite pillars (UI Quality · Responsive · Ship FE · Depth):

- Skills: `responsive-ui`, `data-fetching`, `forms-validation`, `app-shell-routing`, `fe-architecture`, `fe-seo` (**18** total)
- Conventions: **Responsive** line required
- Docs: `docs/pillars.md`, AGENTS/README/pack-layers suite framing
- Evals: E7–E11 including ship-feature e2e

---

## 2026-07-17 — Post token-scoring gap audit

**Trigger:** Many improvements (scoring, decision tree, compliance) — fear of adapter/doc drift.

**Smoke:** `./scripts/smoke-test.sh` (after fixes) must PASS; asserts `token-preset-scoring.md` + E6.

### Verdict

Canonical tree in `references/token-preset-scoring.md` was solid, but **always-on surfaces still said “pick `tokens/*.css`”**, so agents could bypass scoring. `webgl` also nudged `plasma-landing` for any shader bg (wrong vs Plasma hard-gate).

### Fixed this pass (Critical / High)

| Gap | Fix |
|-----|-----|
| Cursor / Claude / AGENTS / session-start vibe-pick | Decision tree one-liners |
| `webgl` auto `plasma-landing` | Chrome follows token tree; Plasma only on brand/hard-gate/explicit |
| `ui-developer` “Token mode = pick preset” | Modes = custom / explicit / hard-gate / score |
| Gemini `ui.toml` | Tree + Token score |
| `CLAUDE.md` | Tree after judgment |
| anti-slop / anti-patterns “create purple token file” | Forbid inventing purple; tree only |
| E1 purple-reject | Expect score path, not vibe preset |
| `ui-quality-loop` Tokens gate | Require tree + Conventions token line |
| Smoke | Assert scoring ref + E6 + compliance-gates |

### Remaining (intentionally deferred)

| Pri | Gap | Notes |
|-----|-----|--------|
| L | Design Lab browser `/explore` | Out of scope by choice |
| L | Historical AUDIT rows below | Superseded — leave as history |

### Closed this pass (was Medium/Low)

| Gap | Fix |
|-----|-----|
| design-reviewer missing Token score check | Greenfield Token source check (High if missing) |
| “Best for” reads as picker | Renamed → **Affinity hint** (docs + CSS headers) |
| install `tokens/` not linked | `cursor` rsync + `cursor-user` symlink `tokens/` |
| sync-commands no tree assert | ui adapters must mention decision tree / scoring |
| fe-lifecycle anti-patterns | Tree + no purple token invent |

### Layer health (current)

| Layer | Status |
|-------|--------|
| Skills | **12** |
| Agents | 3 |
| Commands | 5 (+ adapters) |
| Token presets | 9 + scoring tree |
| Evals | E1–E6 |
| Hooks | session-start + anti-slop |
| Always-on rules | Aligned with decision tree (this pass) |

### Canonical token tree (do not regress)

```text
custom / existing / keep palette → CUSTOM
--token / named preset           → EXPLICIT
Plasma brand                     → HARD-GATE plasma-landing
else                             → SCORE (n/24)
```

---

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
