# Changelog

All notable changes to the **Frontend Expert** pack will be documented in this file.

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
