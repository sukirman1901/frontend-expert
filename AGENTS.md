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
| Build/change UI, page, component, layout, styling | `frontend-judgment`* → `design-tokens` → `ui-components` → **`responsive-ui`** → **`motion`** (light shell defaults) → `anti-ai-slop` → `ui-feel` → `accessibility` | `/ui` |
| + form / validasi / wizard | … + `forms-validation` (before or with ui-components) | `/ui` |
| + list/detail API / loading data | … + `data-fetching` | `/ui` |
| + app shell / sidebar / routing / 404 | … + `app-shell-routing` | `/ui` |
| + architecture / folder structure / state choice | … + `fe-architecture` | — |
| + SEO / meta / OG / landing public | … + `fe-seo` (+ `web-performance` if CWV) | — |
| + marketing landing / homepage sections / logo cloud / testimonials | … + **`marketing-landing`** (+ `motion` / `fe-seo`) | `/ui` |
| + animation / motion / marquee / parallax / text reveal / landing motion | … + `motion` (families/patterns in `motion-families.md`; hand-roll — no registry default) | `/ui` |
| Mobile / responsive / semua device / tablet | **`responsive-ui`** (MUST on layout UI) | `/ui` |
| Audit design, AI slop, UI generik | `anti-ai-slop` → `ui-feel` → `design-tokens` → `responsive-ui` → `accessibility` → `web-performance` (+ `frontend-judgment` hierarchy/type if scores claimed) | `/design` or `/audit` |
| Match Figma / mock / pixel / fidelity | `design-fidelity` → `design-tokens` → `responsive-ui` → `ui-feel` | `/design` |
| Lighthouse / axe / DevTools / measured audit | `fe-devtools` → `accessibility` → `web-performance` → `frontend-testing` | `/test-ui` or `/design` |
| Hierarchy / visual hierarchy / primary CTA unclear | `frontend-judgment` (Hierarchy pass) → `anti-ai-slop` → `ui-feel` | `/design` |
| Typography / type scale / multi-h1 / heading ladder | `frontend-judgment` (Typography ladder) → `ui-feel` → `anti-ai-slop` | `/design` |
| Figma Auto Layout / Fill / Hug / layout from Figma | `responsive-ui` (Auto Layout ↔ CSS) → `ui-components` | `/ui` |
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
| `motion` | UI Quality | Shell defaults + family/pattern vocabulary (`motion-families.md`); hand-roll |
| `frontend-testing` | UI Quality | Tests / TDD |
| `ui-quality-loop` | UI Quality | Polish until clean |
| `webgl` | UI Quality | Plasma backgrounds |
| `monitoring` | UI Quality | Sentry / analytics |
| `app-shell-routing` | Ship FE | Shell, nav, routes |
| `data-fetching` | Ship FE | Async API UI |
| `forms-validation` | Ship FE | Forms / wizards |
| `fe-architecture` | Depth | Folders / state boundaries |
| `fe-seo` | Depth | Meta / OG / indexability |
| `marketing-landing` | UI Quality | Marketing section stack (hero→footer) |
| `design-fidelity` | UI Quality | Spec / Figma / screenshot match |
| `fe-devtools` | UI Quality | Lighthouse / axe / measured checks |

## Hard rules

1. Tokens via decision tree (`token-preset-scoring.md`) or project system — never vibe-pick
2. Icons: **MUST ship Reicon** unless waiver — `compliance-gates.md`
3. **Responsive: MUST** verify 320/768/1024/1440 on layout UI — `responsive-ui`
4. **Primary CTAs full-width below 768** (forms / toolbars / action rows) — no tiny desktop-width CTAs on phone
5. **Hierarchy pass** before DONE on blank-canvas / layout polish — one primary focus + one primary CTA (`frontend-judgment`)
6. **Typography ladder** — ≤2 families; **one h1/page**; sequential levels; token type roles
7. WebGL → `webgl` / Plasma — no parallel invented stack
8. No purple/indigo defaults / Lorem (purple only via scored/hard-gated/explicit token)
9. Loading / error / empty for interactive + async surfaces
10. Light **Motion** defaults on shell/dashboard (or waiver) — `motion`; marketing: name families/patterns from `motion-families.md` and hand-roll (registry install is **not** the default)
11. **Shell chrome** — theme in topbar (icon); profile = avatar → account menu; filters = custom select (`app-shell-routing` / `ui-components`)
12. Do not fabricate visual audit scores without tokens/screenshots
13. Never block on slash commands when intent is clear
14. Blank-canvas → judgment first
15. “Sampai bagus” → `ui-quality-loop` (cap 3)
16. Before DONE → **Conventions check** including **Responsive**, **Hierarchy**, **Typography**, **Motion**, **Shell**

Orchestration: session agent loads skills; agents do not call agents. See `docs/pack-layers.md`, `docs/pillars.md`.
