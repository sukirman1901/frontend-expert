# References map

Deep guides live here. **Skills** are short and triggerable; **references** hold the full checklist/examples. Agents and commands should load the skill first, then open the matching reference when depth is needed.

## Linked to a skill (v1)

| Reference | Skill | Used by |
|-----------|-------|---------|
| *(judgment — see `design-axes.md`)* | `frontend-judgment` | `/ui` / chat before blank-canvas builds |
| `design-axes.md` | `frontend-judgment` | Axes, inspiration, style inference, optional DESIGN_MEMORY |
| *(loop controller)* | `ui-quality-loop` | `/polish` / “rapihin sampai bagus” |
| *(token CSS in `tokens/`)* | `design-tokens` | `/ui`, `/design`, `ui-developer` |
| `anti-patterns.md` | `anti-ai-slop` | `/ui`, `/design`, both agents, anti-slop hook |
| `ui-feel.md` | `ui-feel` | `/ui`, `/design`, `/polish`, `ui-developer`, `design-reviewer` |
| `component-patterns.md` | `ui-components` | `/ui`, `ui-developer`, `/design` pattern checks |
| `reicon-icons.md` | `ui-components` (icons) | `/ui`, `ui-developer` — default icon library |
| `architecture.md` | `ui-components` (state/org section) | `/ui`, `ui-developer` |
| `accessibility-checklist.md` | `accessibility` | `/ui` light, `/design`, `/test-ui`, both agents |
| `performance.md` | `web-performance` | `/design`, deep perf work |
| `motion.md` | `motion` | `/ui` only when animating |
| `testing.md` | `frontend-testing` | `/test-ui`, `test-engineer` |

## Reference-only (no skill yet)

| Reference | Topic | Promote when |
|-----------|-------|--------------|
| `webgl.md` | **Plasma Studio** pure WebGL backgrounds ([studio](https://plasma.nusaiba.dev/app/)); Three.js only if scene graph needed | Shader/background work is a common ask |
| `monitoring.md` | Sentry, OTel, analytics | Production observability is in scope for `/ship`-style flows |

## Missing on purpose

- No `design-system.md` — token rules live in skill `design-tokens` + files under `tokens/`
- No full roadmap.sh topics (SEO, Git, REST, TypeScript language) — out of pack scope

## Rule for authors

When editing a reference, update the matching skill checklist if the workflow changed. When adding a new domain, add **skill + reference** together (or document it here as reference-only). After changing commands, run `./scripts/sync-commands.sh` and `./scripts/smoke-test.sh`.
