# Changelog

All notable changes to the **Frontend Expert** pack will be documented in this file.

## [2.4.3] — 2026-09-10

### Fixed

- Re-applied GitHub PR #2: omit `hooks` from `.claude-plugin/plugin.json` so Claude Code does not double-load `hooks/hooks.json`
- README / getting-started: current skill count (33), pack name Frontend Expert, `/ui` chain includes `anti-slop-code`

## [2.4.2] — 2026-09-10

### Changed

- `install.sh` loads all `plugin.json` skills (was a stale 21-skill subset) and unlinks retired aliases
- CSS presets install to `token-presets` so they no longer overwrite the `tokens` skill
- Platform setup docs use `/path/to/frontend-expert`; OpenCode canonical symlink is `frontend-expert`

## [2.4.1] — 2026-09-10

### Changed

- Eval routing: bare “rapihin” no longer opens `quality-loop`; “tulisan AI” / empty-state wording stays on `content-design`
- Added `evals/PASTE.md`, desk scorecard `evals/runs/2026-09-10-desk.md`, and `scripts/eval-routing-contract.sh` (wired into smoke-test)
- Live evals remain **Not verified** until pasted in a fresh chat

## [2.4.0] — 2026-09-10

### Added

- `motion-inspection` — playback of start/mid/end/interrupt/reduced-motion; reverse-engineer unnamed transitions into catalog patterns
- Reference `references/motion-inspection.md` and behavioral eval E32
- Implementing motion stays on `motion`; source-only “smooth” fails this skill

### Changed

- Canonical skill count is 33

## [2.3.0] — 2026-09-10

### Added

- `prototype` — rendered 2–3 axis variants side by side, then state stress before the production build
- Reference `references/prototype.md` and behavioral eval E31
- Frame-by-frame motion inspection stays deferred (`motion-inspection`)

### Changed

- Canonical skill count is 32
- `design-direction` hands coded comparison to `prototype`; it stays prose axes only

## [2.2.1] — 2026-09-10

### Changed

- `anti-slop-code` now requires a blast-radius pass (callers, cache, server load) instead of isolated-function cleanup
- Generic catch/toast is slop; field failure modes are named, unknowns labeled
- E30 requires cross-module impact and non-boilerplate errors

## [2.2.0] — 2026-09-10

### Added

- `anti-slop-code` — generated frontend implementation tells (effects, type lies, wrappers, premature abstraction)
- Reference `references/anti-slop-code.md` and behavioral eval E30
- Writing slop stays on `content-design`; visual slop stays on `anti-slop-design`; hardening stays deferred

### Changed

- Canonical skill count is 31
- Build routing places a code-slop scan after `components` and before `responsive`

## [2.1.3] — 2026-09-10

### Changed

- `content-design` now includes an AI-writing scan, unknown-fact rule, and review before/after table
- Writing slop stays on `content-design`; no separate `anti-slop-writing` skill (visual slop remains `anti-slop-design`)
- E27 requires unknowns to be labeled instead of invented

## [2.1.2] — 2026-09-10

### Changed

- `components` now owns a small public props/API contract: composition over boolean/style soup
- Added behavioral eval E29

## [2.1.1] — 2026-09-10

### Changed

- `polish` and `accessibility` now classify numeric craft recipes vs WCAG standards
- Concentric radius and press-scale are heuristics; 2.5.8 target size is 24px, not 44px
- Cursor/Claude always-on rules on this branch stay aligned with canonical skill names

## [2.1.0] — 2026-09-10

### Added

- `design-foundations` — grid, spacing rhythm, alignment, hierarchy, density, composition, and whitespace
- Structural reference `references/design-foundations.md` and behavioral eval E28

### Changed

- Build routing places foundations after optional `design-direction` and before `tokens`
- Canonical skill count is 30
- Always-on Cursor and Claude rules now use canonical identifiers instead of removed aliases

## [2.0.0] — 2026-09-10

### Changed

- Removed 17 deprecated compatibility alias folders and registrations
- Exposed exactly 29 canonical skill identifiers to prevent duplicate discovery
- Retained the legacy-to-canonical map as migration documentation only

## [1.2.0] — 2026-09-10

### Added
- `design-typography`, `design-color`, `design-surfaces`, and `content-design`
- Evidence classification policy, internal principle format, and authorship notice
- Behavioral evals E24–E27

### Changed
- Added three-entry “Start here” guidance without breaking existing skill identifiers
- Accessibility defaults to WCAG 2.2 AA while honoring explicit project/legal targets
- Monitoring examples use INP instead of retired FID and avoid raw user email examples
- Pack documentation and plugin registration now reflect 29 skills

### Compatibility
- Seventeen pre-1.2 names remain as deprecated compatibility aliases until v2.0
- Canonical identifiers now follow the approved concise taxonomy (`design-direction`, `tokens`, `components`, `responsive`, and peers)
- Slash commands remain unchanged
- Numeric craft recipes are labeled recommendations or heuristics unless a standard/project owns them

## [1.1.0] — 2026-07-31

### Added
- **`design-vocabulary`** skill — reverse-lookup table (70+ entries) mapping loose UI descriptions to proper design terms
- **`engineering-vocabulary`** skill — reverse-lookup table (60+ entries) mapping informal engineering descriptions to technical terms
- **`writing-skills`** skill — meta-skill for authoring new skills following pack conventions
- **`CHANGELOG.md`** — this file

### Changed
- **Root `SKILL.md`** — rewritten from generic best-practices doc to proper pack entry point describing the suite, pillars, auto-loading, and links to depth docs
- **`accessibility/SKILL.md`** — expanded from 56 to ~130 lines with inline recipes (focus trap, skip link, live region, dialog a11y, color-blind patterns, touch targets, quick audit method)
- **`web-performance/SKILL.md`** — expanded from 57 to ~150 lines with decision trees (image format, font loading, LCP priority), INP/CLS tables, code recipes, performance budget, quick audit
- **`plugin.json`** — expanded with skills, agents, hooks, and commands registration
- **`AGENTS.md`** — updated intent map and skill table with new vocabulary + writing skills

### Fixed
- Root `SKILL.md` no longer mentions Print/PDF layout (was leftover from pre-suite era)

## [1.0.0] — Initial release

### Skills (22)
- Suite root: `frontend-expert`
- UI Quality: `frontend-judgment`, `design-tokens`, `ui-components`, `anti-ai-slop`, `ui-feel`, `accessibility`, `web-performance`, `frontend-testing`, `ui-quality-loop`, `webgl`, `monitoring`, `motion`, `marketing-landing`, `design-fidelity`, `fe-devtools`
- Responsive: `responsive-ui`
- Ship FE: `app-shell-routing`, `data-fetching`, `forms-validation`
- Depth: `fe-architecture`, `fe-seo`

### Infrastructure
- 27 reference documents
- 9 CSS token presets
- 3 agent personas (ui-developer, design-reviewer, test-engineer)
- 5 commands (ui, design, audit, test-ui, polish)
- 2 hooks (session-start, anti-slop)
- 24 eval cases
