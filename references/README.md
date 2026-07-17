# References map

Deep guides live here. **Skills** are short and triggerable; **references** hold the full checklist/examples. Agents and commands should load the skill first, then open the matching reference when depth is needed.

## Linked to a skill (v1)

| Reference | Skill | Used by |
|-----------|-------|---------|
| *(judgment — see `design-axes.md`)* | `frontend-judgment` | `/ui` / chat before blank-canvas builds |
| `design-axes.md` | `frontend-judgment` | Axes, inspiration, style inference, optional DESIGN_MEMORY |
| `ux-foundations.md` | `frontend-judgment`, `design-tokens`, `accessibility` | Nielsen/Gestalt, UI system, color theory for products |
| `fe-lifecycle.md` | `ui-quality-loop`, `frontend-judgment` | A→Z FE process + pack mapping |
| `compliance-gates.md` | `ui-components`, `ui-developer`, always-on rules | Ship checklist — Reicon/WebGL/tokens must not be silently skipped |
| *(loop controller)* | `ui-quality-loop` | `/polish` / “rapihin sampai bagus” |
| *(token CSS in `tokens/` + `tokens/README.md`)* | `design-tokens` | `/ui`, `/design`, `ui-developer` |
| `anti-patterns.md` | `anti-ai-slop` | `/ui`, `/design`, both agents, anti-slop hook |
| `ui-feel.md` | `ui-feel` | `/ui`, `/design`, `/polish`, `ui-developer`, `design-reviewer` |
| `component-patterns.md` | `ui-components` | `/ui`, `ui-developer`, `/design` pattern checks |
| `reicon-icons.md` | `ui-components` (icons) | `/ui`, `ui-developer` — default icon library |
| `architecture.md` | `ui-components` (state/org section) | `/ui`, `ui-developer` |
| `accessibility-checklist.md` | `accessibility` | `/ui` light, `/design`, `/test-ui`, both agents |
| `performance.md` | `web-performance` | `/design`, deep perf work |
| `motion.md` | `motion` | `/ui` only when animating |
| `testing.md` | `frontend-testing` | `/test-ui`, `test-engineer` |
| `webgl.md` | `webgl` | Plasma Studio shader backgrounds |
| `monitoring.md` | `monitoring` | Sentry, analytics, OTel, alerts |

## Evals

Behavioral scenarios: [`evals/`](../evals/) (purple reject, scorecard honesty, loop cap, rapihin routing).

## Missing on purpose

- No full roadmap.sh topics (SEO, Git, REST, TypeScript language) — out of pack scope
- No Design Lab browser `/explore` — optional future; judgment stays text-first

## Rule for authors

When editing a reference, update the matching skill checklist if the workflow changed. When adding a new domain, add **skill + reference** together. After changing commands, run `./scripts/sync-commands.sh` and `./scripts/smoke-test.sh`.
