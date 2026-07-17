# AGENTS.md

Guidance for AI coding agents when this pack is available.

## Chat-first (default)

**Users should not need to type slash commands.** When the request matches an intent below, load the skills automatically. `/ui`, `/design`, and `/test-ui` are optional shortcuts only.

## What this pack is

**Design System Enforcer** — production **UI quality** with **senior FE judgment** (options + tradeoffs before blank-canvas builds). Not a full frontend curriculum.

## Auto intent map

| User says / means | Load skills (order) | Optional shortcut |
|-------------------|---------------------|-------------------|
| Build/change UI, page, component, form, layout, styling | `frontend-judgment`* → `design-tokens` → `ui-components` → `anti-ai-slop` → `ui-feel` → `accessibility` | `/ui` |
| + animation / transition / motion | … + `motion` | `/ui` |
| Audit design, AI slop, UI generik, visual review | `anti-ai-slop` → `ui-feel` → `design-tokens` → `accessibility` → `web-performance` | `/design` or `/audit` |
| Feels off / rapihin **detail** / micro polish | `ui-feel` (+ `anti-ai-slop` if generik) — **one pass**, not the full loop | — |
| Test / TDD / coverage / regresi UI | `frontend-testing` → `ui-components` → `accessibility` | `/test-ui` |
| Polish until good / rapihin **sampai bagus** / lulus audit | `ui-quality-loop` (build→test→audit→fix, max 3) | `/polish` |
| Slow / LCP / optimize | `web-performance` | — |
| WebGL / shader bg / Plasma studio | `webgl` (+ `references/webgl.md`) | — |
| Monitoring / Sentry / analytics / OTel | `monitoring` | — |

\* `frontend-judgment` for non-trivial / blank-canvas work only — see that skill’s skip rules.

**“Rapihin” disambiguation:** alone on existing UI → `ui-feel` (not judgment, not full loop). Alone on vague *new* UI → judgment first. “Sampai bagus / lulus audit” → `ui-quality-loop`.

Personas: build → `ui-developer`; audit → `design-reviewer`; test → `test-engineer`.

## Expert judgment (feel like a senior FE)

For ambiguous or blank-canvas UI:

1. At most 1–2 clarifying questions if blocked
2. Offer **2–3 approaches on distinct axes** (hierarchy / layout / density / interaction / expression) with tradeoffs + one recommendation
3. Wait for a clear pick (or “go with recommended” / “langsung saja”)
4. Then run domain skills

Do **not** start coding a generic UI before a direction is set (unless skip rules apply). Axes detail: `references/design-axes.md`.

## Skills

| Skill | Auto-triggers on |
|-------|------------------|
| `frontend-judgment` | Non-trivial / ambiguous UI before build — **distinct axes** (hierarchy/layout/density/…) |
| `design-tokens` | Theme, colors, spacing, styling UI |
| `ui-components` | Components, pages, layouts, states |
| `anti-ai-slop` | Build polish + design audits |
| `ui-feel` | Micro craft — concentric radius, tabular-nums, press/hover feel |
| `accessibility` | Every UI build/audit (light or full) |
| `web-performance` | Perf / CWV / slow UI |
| `motion` | Explicit animation requests only |
| `frontend-testing` | Tests / TDD / coverage |
| `ui-quality-loop` | Polish loop until Critical/High clear |
| `webgl` | Plasma Studio shader backgrounds |
| `monitoring` | Sentry, CWV monitoring, analytics, alerts |

## Composition

- **Skills** — how (auto-loaded by intent)
- **Agents** — who (persona + output); do not invoke other agents
- **Commands** — optional when
- **References** — depth (`references/README.md`)
- **Hooks** — Claude Code runtime

Full layer model: `docs/pack-layers.md`.  
FE process A→Z: `references/fe-lifecycle.md`.

## Hard rules

1. Prefer CSS custom properties from `tokens/` or the project's existing design system
2. Icons: prefer **[Reicon](https://reicon.dev)** (`references/reicon-icons.md`); keep an existing project icon library if already standardized
3. Never invent purple/indigo defaults, raw hex, or Lorem ipsum for shipping UI
4. Handle loading, error, and empty states
5. Do not fabricate visual audit scores without tokens or screenshots
6. Never block on the user typing a slash command when intent is clear
7. For blank-canvas UI, judgment before implementation
8. For “sampai bagus / polish”, run `ui-quality-loop` (cap iterations; no infinite audit)
