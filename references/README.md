# References map

Deep guides live here. **Skills** are short and triggerable; **references** hold the full checklist/examples. Agents and commands should load the skill first, then open the matching reference when depth is needed.

Pillars: [`docs/pillars.md`](../docs/pillars.md).

## Linked to a skill

| Reference | Skill | Used by |
|-----------|-------|---------|
| `design-axes.md` | `design-direction` | Axes, inspiration, style inference |
| `design-foundations.md` | `design-foundations` | Grid, spacing rhythm, alignment, density, composition |
| `ux-foundations.md` | `design-direction`, `tokens`, `accessibility` | Nielsen/Gestalt, color |
| `fe-lifecycle.md` | `quality-loop`, `design-direction` | A→Z FE process |
| `compliance-gates.md` | always-on, `components`, `ui-developer` | Ship checklist |
| `token-preset-scoring.md` | `tokens`, `design-direction` | Decision tree + scoring |
| `responsive.md` | `responsive` | All-devices MUST |
| `anti-patterns.md` | `anti-slop-design` | AI aesthetic catalog |
| `polish.md` | `polish` | Micro craft |
| `component-patterns.md` | `components` | Composition patterns |
| `reicon-icons.md` | `components` | Default icons |
| `architecture.md` | `components`, `architecture` | State ladder |
| `fe-architecture.md` | `architecture` | Feature folders / boundaries |
| `data-fetching.md` | `data-fetching` | Async UI |
| `forms.md` | `forms` | Forms UX |
| `app-shell.md` | `app-shell` | Shell / nav / routes |
| `seo.md` | `seo` | Technical SEO |
| `accessibility-checklist.md` | `accessibility` | WCAG checks |
| `performance.md` | `performance` | CWV |
| `motion.md` | `motion` | Recipes Framer/GSAP |
| `motion-families.md` | `motion` | 12 families · 144 patterns vocabulary |
| `testing.md` | `testing` | Tests |
| `webgl.md` | `webgl` | Plasma Studio |
| `monitoring.md` | `monitoring` | Observability |
| `fidelity.md` | `fidelity` | Spec vs build |
| `devtools.md` | `devtools` | Lighthouse / axe / tooling |
| `landing-sections.md` | `marketing` | Marketing section catalog + recipes |
| `design-typography.md` | `design-typography` | Type roles, font behavior, wrapping, truncation |
| `design-color.md` | `design-color` | OKLCH, palettes, themes, contrast, gamut |
| `design-surfaces.md` | `design-surfaces` | Radius, borders, elevation, overlays |
| `content-design.md` | `content-design` | UI copy, recovery, voice, AI-writing scan |

## Evidence and provenance

- `evidence-policy.md` — source precedence and rule classifications
- `skill-aliases.md` — legacy-to-canonical migration map
- `../NOTICE.md` — pack authorship and external-research boundary

## Evals

[`evals/`](../evals/) — E1–E29 (slop, craft gates, fidelity, ship FE, motion, shell, marketing, typography, color, surfaces, content, foundations, component API).

## Missing on purpose

- No full roadmap.sh topics (Git, CS theory) — out of pack scope
- No React Native — responsive **web** only
- No Design Lab browser `/explore` — optional future; judgment stays text-first

## Rule for authors

When editing a reference, update the matching skill checklist if the workflow changed. Classify normative-looking claims via `evidence-policy.md` and preserve required attribution for material actually included. When adding a domain, add **skill + reference + eval** together. After changing commands, run `./scripts/sync-commands.sh` and `./scripts/smoke-test.sh`.
