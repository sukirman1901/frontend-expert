# Pack audit log

## 2026-07-17 — Test + audit parity with /ui

- Added `test-engineer` agent (dedicated, not reuse ui-developer)
- Enriched `/test-ui` (plan + coverage checklist + `--gaps`)
- Added `/audit` alias of `/design`; enriched audit skill list + prioritized moves
- Fixed duplicate Output header in design command

## 2026-07-17 — Expert judgment layer (A)

- Added `frontend-judgment` skill (2–3 approaches + tradeoffs before blank-canvas builds)
- Wired into ui-developer, rules, AGENTS, `/ui` adapters, session-start
- design-reviewer: prioritized next moves + optional redesign approaches

## 2026-07-17 — Chat-first auto-routing

- Strengthened all skill `description`s for natural-language match
- Always-on Cursor + Claude rules: intent → skills, slash optional
- AGENTS.md / README / session-start / pack-layers: chat-first default

## 2026-07-17 — P0 + frontend-testing

### Done

- Slimmed agents to persona + skills + output (removed duplicated rule encyclopedias)
- Added `frontend-testing` skill + `/test-ui` (commands / Claude / Gemini)
- Added `scripts/sync-commands.sh` + `scripts/smoke-test.sh` (PASSED)
- Updated README, AGENTS, pack-layers, references map, session-start

### Layer health

| Layer | Status |
|-------|--------|
| Commands `/ui` `/design` `/test-ui` | OK |
| Agents (2, slim) | OK |
| Skills (8) | OK |
| References map | testing linked; webgl/monitoring still ref-only |
| Hooks / multi-platform | OK |

### Still optional later

- `tokens/README.md` (import notes)
- Eval scenarios (purple rejection, scorecard honesty)
- Promote `webgl` / `monitoring` only if needed
- Publish to GitHub + `npx skills add`
