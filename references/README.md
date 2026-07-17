# References map

Deep guides live here. **Skills** are short and triggerable; **references** hold the full checklist/examples. Agents and commands should load the skill first, then open the matching reference when depth is needed.

## Linked to a skill (v1)

| Reference | Skill | Used by |
|-----------|-------|---------|
| *(judgment — no deep ref)* | `frontend-judgment` | `/ui` / chat before blank-canvas builds |
| *(token CSS in `tokens/`)* | `design-tokens` | `/ui`, `/design`, `ui-developer` |
| `anti-patterns.md` | `anti-ai-slop` | `/ui`, `/design`, both agents, anti-slop hook |
| `component-patterns.md` | `ui-components` | `/ui`, `ui-developer`, `/design` pattern checks |
| `architecture.md` | `ui-components` (state/org section) | `/ui`, `ui-developer` |
| `accessibility-checklist.md` | `accessibility` | `/ui` light, `/design`, `/test-ui`, both agents |
| `performance.md` | `web-performance` | `/design`, deep perf work |
| `motion.md` | `motion` | `/ui` only when animating |
| `testing.md` | `frontend-testing` | `/test-ui`, `ui-developer` when testing |

## Reference-only (no skill yet)

| Reference | Topic | Promote when |
|-----------|-------|--------------|
| `webgl.md` | Three.js, R3F, shaders | 3D/shader work is common for users of this pack |
| `monitoring.md` | Sentry, OTel, analytics | Production observability is in scope for `/ship`-style flows |

## Missing on purpose

- No `design-system.md` — token rules live in skill `design-tokens` + files under `tokens/`
- No full roadmap.sh topics (SEO, Git, REST, TypeScript language) — out of pack scope

## Rule for authors

When editing a reference, update the matching skill checklist if the workflow changed. When adding a new domain, add **skill + reference** together (or document it here as reference-only). After changing commands, run `./scripts/sync-commands.sh` and `./scripts/smoke-test.sh`.
