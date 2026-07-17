# AGENTS.md

Guidance for AI coding agents when this pack is available.

## Chat-first (default)

**Users should not need to type slash commands.** When the request matches an intent below, load the skills automatically. Slash commands are optional shortcuts only.

## What this pack is

**Frontend Expert** — a **suite of pillars** for shipping product **web** UI: UI quality + responsive (all devices) + ship FE (shell/data/forms) + depth (architecture/SEO). Not a full roadmap.sh curriculum; not React Native.

Pillar map: `docs/pillars.md`.

## Auto intent map

| User says / means | Load skills (order) | Optional shortcut |
|-------------------|---------------------|-------------------|
| Build/change UI, page, component, layout, styling | `frontend-judgment`* → `design-tokens` → `ui-components` → **`responsive-ui`** → `anti-ai-slop` → `ui-feel` → `accessibility` | `/ui` |
| + form / validasi / wizard | … + `forms-validation` (before or with ui-components) | `/ui` |
| + list/detail API / loading data | … + `data-fetching` | `/ui` |
| + app shell / sidebar / routing / 404 | … + `app-shell-routing` | `/ui` |
| + architecture / folder structure / state choice | … + `fe-architecture` | — |
| + SEO / meta / OG / landing public | … + `fe-seo` (+ `web-performance` if CWV) | — |
| + animation / motion | … + `motion` | `/ui` |
| Mobile / responsive / semua device / tablet | **`responsive-ui`** (MUST on layout UI) | `/ui` |
| Audit design, AI slop, UI generik | `anti-ai-slop` → `ui-feel` → `design-tokens` → `responsive-ui` → `accessibility` → `web-performance` | `/design` or `/audit` |
| Feels off / rapihin **detail** | `ui-feel` (+ `anti-ai-slop` if generik) — **one pass** | — |
| Test / TDD / coverage | `frontend-testing` → `ui-components` → `accessibility` | `/test-ui` |
| Polish / rapihin **sampai bagus** | `ui-quality-loop` | `/polish` |
| Slow / LCP / optimize | `web-performance` | — |
| WebGL / shader / Plasma | `webgl` | — |
| Monitoring / Sentry / OTel | `monitoring` | — |

\* `frontend-judgment` for non-trivial / blank-canvas only — see skip rules.

**“Rapihin”:** alone on existing UI → `ui-feel`. Vague *new* UI → judgment. “Sampai bagus” → `ui-quality-loop`.

Personas: build → `ui-developer`; audit → `design-reviewer`; test → `test-engineer`.

## Expert judgment

1. At most 1–2 clarifying questions if blocked
2. Offer **2–3 approaches on distinct axes** with tradeoffs + one recommendation
3. Wait for a clear pick (or “langsung saja”)
4. Then run domain skills (including **responsive-ui** for layout)

## Skills (suite)

| Skill | Pillar | Triggers |
|-------|--------|----------|
| `frontend-judgment` | UI Quality | Blank-canvas / ambiguous UI |
| `design-tokens` | UI Quality | Theme — decision tree + scoring |
| `ui-components` | UI Quality | Components, states, composition |
| `responsive-ui` | Responsive MUST | Every layout UI / all devices |
| `anti-ai-slop` | UI Quality | Build + audits |
| `ui-feel` | UI Quality | Micro craft |
| `accessibility` | UI Quality | Build/audit a11y |
| `web-performance` | UI Quality | CWV / slow |
| `motion` | UI Quality | Explicit animation |
| `frontend-testing` | UI Quality | Tests / TDD |
| `ui-quality-loop` | UI Quality | Polish until clean |
| `webgl` | UI Quality | Plasma backgrounds |
| `monitoring` | UI Quality | Sentry / analytics |
| `app-shell-routing` | Ship FE | Shell, nav, routes |
| `data-fetching` | Ship FE | Async API UI |
| `forms-validation` | Ship FE | Forms / wizards |
| `fe-architecture` | Depth | Folders / state boundaries |
| `fe-seo` | Depth | Meta / OG / indexability |

## Hard rules

1. Tokens via decision tree (`token-preset-scoring.md`) or project system — never vibe-pick
2. Icons: **MUST ship Reicon** unless waiver — `compliance-gates.md`
3. **Responsive: MUST** verify 320/768/1024/1440 on layout UI — `responsive-ui`
4. WebGL → `webgl` / Plasma — no parallel invented stack
5. No purple/indigo defaults / Lorem (purple only via scored/hard-gated/explicit token)
6. Loading / error / empty for interactive + async surfaces
7. Do not fabricate visual audit scores without tokens/screenshots
8. Never block on slash commands when intent is clear
9. Blank-canvas → judgment first
10. “Sampai bagus” → `ui-quality-loop` (cap 3)
11. Before DONE → **Conventions check** including **Responsive**

Orchestration: session agent loads skills; agents do not call agents. See `docs/pack-layers.md`, `docs/pillars.md`.
