# References map

Deep guides live here. **Skills** are short and triggerable; **references** hold the full checklist/examples. Agents and commands should load the skill first, then open the matching reference when depth is needed.

Pillars: [`docs/pillars.md`](../docs/pillars.md).

## Linked to a skill

| Reference | Skill | Used by |
|-----------|-------|---------|
| `design-axes.md` | `frontend-judgment` | Axes, inspiration, style inference |
| `ux-foundations.md` | `frontend-judgment`, `design-tokens`, `accessibility` | Nielsen/Gestalt, color |
| `fe-lifecycle.md` | `ui-quality-loop`, `frontend-judgment` | A→Z FE process |
| `compliance-gates.md` | always-on, `ui-components`, `ui-developer` | Ship checklist |
| `token-preset-scoring.md` | `design-tokens`, `frontend-judgment` | Decision tree + scoring |
| `responsive.md` | `responsive-ui` | All-devices MUST |
| `anti-patterns.md` | `anti-ai-slop` | AI aesthetic catalog |
| `ui-feel.md` | `ui-feel` | Micro craft |
| `component-patterns.md` | `ui-components` | Composition patterns |
| `reicon-icons.md` | `ui-components` | Default icons |
| `architecture.md` | `ui-components`, `fe-architecture` | State ladder |
| `fe-architecture.md` | `fe-architecture` | Feature folders / boundaries |
| `data-fetching.md` | `data-fetching` | Async UI |
| `forms-validation.md` | `forms-validation` | Forms UX |
| `app-shell-routing.md` | `app-shell-routing` | Shell / nav / routes |
| `fe-seo.md` | `fe-seo` | Technical SEO |
| `accessibility-checklist.md` | `accessibility` | WCAG checks |
| `performance.md` | `web-performance` | CWV |
| `motion.md` | `motion` | Recipes Framer/GSAP |
| `motion-families.md` | `motion` | 12 families · 144 patterns vocabulary |
| `testing.md` | `frontend-testing` | Tests |
| `webgl.md` | `webgl` | Plasma Studio |
| `monitoring.md` | `monitoring` | Observability |
| `design-fidelity.md` | `design-fidelity` | Spec vs build |
| `fe-devtools.md` | `fe-devtools` | Lighthouse / axe / tooling |
| `landing-sections.md` | `marketing-landing` | Marketing section catalog + recipes |

## Evals

[`evals/`](../evals/) — E1–E23 (slop, craft gates, fidelity, ship FE, motion families, shell chrome, marketing landing).

## Missing on purpose

- No full roadmap.sh topics (Git, CS theory) — out of pack scope
- No React Native — responsive **web** only
- No Design Lab browser `/explore` — optional future; judgment stays text-first

## Rule for authors

When editing a reference, update the matching skill checklist if the workflow changed. When adding a new domain, add **skill + reference** together. After changing commands, run `./scripts/sync-commands.sh` and `./scripts/smoke-test.sh`.
