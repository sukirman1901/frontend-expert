# AGENTS.md

Guidance for AI coding agents when this pack is available.

## Chat-first (default)

**Users should not need to type slash commands.** When the request matches an intent below, load the skills automatically. `/ui`, `/design`, and `/test-ui` are optional shortcuts only.

## What this pack is

**Design System Enforcer** — production **UI quality** with **senior FE judgment** (options + tradeoffs before blank-canvas builds). Not a full frontend curriculum.

## Auto intent map

| User says / means | Load skills (order) | Optional shortcut |
|-------------------|---------------------|-------------------|
| Build/change UI, page, component, form, layout, styling | `frontend-judgment`* → `design-tokens` → `ui-components` → `anti-ai-slop` → `accessibility` | `/ui` |
| + animation / transition / motion | … + `motion` | `/ui` |
| Audit design, AI slop, UI generik, visual review | `anti-ai-slop` → `design-tokens` → `accessibility` → `web-performance` | `/design` |
| Test / TDD / coverage / regresi UI | `frontend-testing` → `ui-components` → `accessibility` | `/test-ui` |
| Slow / LCP / optimize | `web-performance` | — |

\* `frontend-judgment` for non-trivial / blank-canvas work only — see that skill’s skip rules.

Personas: build/test → `ui-developer`; audit → `design-reviewer`.

## Expert judgment (feel like a senior FE)

For ambiguous or blank-canvas UI:

1. At most 1–2 clarifying questions if blocked
2. Offer **2–3 approaches** with tradeoffs + one recommendation
3. Wait for a clear pick (or “go with recommended” / “langsung saja”)
4. Then run domain skills

Do **not** start coding a generic UI before a direction is set (unless skip rules apply).

## Skills

| Skill | Auto-triggers on |
|-------|------------------|
| `frontend-judgment` | Non-trivial / ambiguous UI before build |
| `design-tokens` | Theme, colors, spacing, styling UI |
| `ui-components` | Components, pages, layouts, states |
| `anti-ai-slop` | Build polish + design audits |
| `accessibility` | Every UI build/audit (light or full) |
| `web-performance` | Perf / CWV / slow UI |
| `motion` | Explicit animation requests only |
| `frontend-testing` | Tests / TDD / coverage |

## Composition

- **Skills** — how (auto-loaded by intent)
- **Agents** — who (persona + output); do not invoke other agents
- **Commands** — optional when
- **References** — depth (`references/README.md`)
- **Hooks** — Claude Code runtime

Full layer model: `docs/pack-layers.md`.

## Hard rules

1. Prefer CSS custom properties from `tokens/` or the project's existing design system
2. Never invent purple/indigo defaults, raw hex, or Lorem ipsum for shipping UI
3. Handle loading, error, and empty states
4. Do not fabricate visual audit scores without tokens or screenshots
5. Never block on the user typing a slash command when intent is clear
6. For blank-canvas UI, judgment before implementation
