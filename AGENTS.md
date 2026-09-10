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
| Build/change UI, page, component, layout, styling | `design-direction`* → (+ **`prototype`** if comparing/stressing) → **`design-foundations`**** → `tokens` → (+ **`marketing`** if landing) → `components` → **`anti-slop-code`** → **`responsive`** → **`motion`** (light shell defaults) → `anti-slop-design` → `polish` → `accessibility` | `/ui` |
| + form / validasi / wizard | … + `forms` (before or with components) | `/ui` |
| + list/detail API / loading data | … + `data-fetching` | `/ui` |
| + app shell / sidebar / routing / 404 | … + `app-shell` | `/ui` |
| + architecture / folder structure / state choice | … + `architecture` | — |
| + SEO / meta / OG / landing public | … + `seo` (+ `performance` if CWV) | — |
| + marketing landing / homepage sections / logo cloud / testimonials | … + **`marketing`** (+ `motion` / `seo`) | `/ui` |
| + animation / motion / marquee / parallax / text reveal / landing motion | … + `motion` (families/patterns in `motion-families.md`; hand-roll — no registry default) | `/ui` |
| Mobile / responsive / semua device / tablet | **`responsive`** (MUST on layout UI) | `/ui` |
| Audit design, AI slop, UI generik | `anti-slop-design` → `polish` → `tokens` → `responsive` → `accessibility` → `performance` (+ `motion` if animated; **`marketing`** if landing; + `design-direction` hierarchy/type if scores claimed) | `/design` or `/audit` |
| Match Figma / mock / pixel / fidelity | `fidelity` → `tokens` → `responsive` → `polish` | `/design` |
| Lighthouse / axe / DevTools / measured audit | `devtools` → `accessibility` → `performance` → `testing` | `/test-ui` or `/design` |
| Hierarchy / visual hierarchy / primary CTA unclear | `design-direction` (Hierarchy pass) → `design-foundations` → `anti-slop-design` → `polish` | `/design` |
| Grid / spacing / alignment / density / cluttered layout / "layout berantakan" / "struktur layout" / "rapikan struktur" | `design-foundations` → `tokens` → `responsive` | `/ui` |
| Typography / type scale / multi-h1 / heading ladder | `design-direction` (Typography ladder) → `design-typography` → `polish` → `anti-slop-design` | `/design` |
| Font choice / type scale / wrapping / truncation / variable fonts | `design-typography` → `responsive` → `accessibility` | — |
| Palette / OKLCH / dark mode / contrast / gamut | `tokens` → `design-color` → `accessibility` | — |
| Card / modal / radius / border / shadow / elevation | `tokens` → `design-surfaces` → `polish` | — |
| Component props / API / “prop terlalu banyak” / composition | `components` | `/ui` |
| Prototype / varian / side-by-side / bandingkan arah / cek semua state | `design-direction` (if axes unnamed) → **`prototype`** — then foundations → tokens → components | `/ui` |
| Kode terasa AI / rapikan kode / dampak ke modul lain / error handling generik / edge case | `anti-slop-code` (not `anti-slop-design`, not `polish`) | `/ui` |
| UI copy / CTA / error / empty state / confirmation / AI writing | `content-design` (+ `forms` / `marketing` as relevant) | — |
| Figma Auto Layout / Fill / Hug / layout from Figma | `responsive` (Auto Layout ↔ CSS) → `components` | `/ui` |
| Feels off / rapihin **detail** | `polish` (+ `anti-slop-design` if generik) — **one pass** | — |
| Test / TDD / coverage | `testing` → `components` → `accessibility` | `/test-ui` |
| Polish / rapihin **sampai bagus** | `quality-loop` | `/polish` |
| Slow / LCP / optimize | `performance` | — |
| WebGL / shader / Plasma | `webgl` | — |
| Monitoring / Sentry / OTel | `monitoring` | — |
| "What's the name for…" / loose UI description / design term lookup | `design-vocabulary` | — |
| "What pattern is…" / loose engineering description / FE term lookup | `engineering-vocabulary` | — |
| Create/add new skill / extend the pack / "buat skill baru" | `skill-authoring` | — |

\* `design-direction` for non-trivial / blank-canvas only — see skip rules.
\*\* `design-foundations` for new layouts and structural redesigns. Skip isolated color, typography, copy, token, component-state, motion, and micro-polish changes.
`prototype` when the user wants rendered comparison or state stress — not on every tiny `/ui`.

**“Rapihin”:** alone on existing UI → `polish`. Vague *new* UI → judgment. “Rapikan struktur” / layout berantakan → `design-foundations`. “Rapikan kode” / kode terasa AI → `anti-slop-code`. “Sampai bagus” → `quality-loop`.

Personas: build → `ui-developer`; audit → `design-reviewer`; test → `test-engineer`.

## Expert judgment

1. At most 1–2 clarifying questions if blocked
2. Offer **2–3 approaches on distinct axes** with tradeoffs + one recommendation
3. Wait for a clear pick (or “langsung saja”)
4. Then run domain skills (including **responsive** for layout)

## Skills (suite)

| Skill | Pillar | Triggers |
|-------|--------|----------|
| `frontend-expert` | Suite root | Catalog / install entry — routes into pillars |
| `design-direction` | UI Quality | Blank-canvas / ambiguous UI |
| `prototype` | UI Quality | Rendered variants + state stress |
| `design-foundations` | UI Quality | Grid, spacing rhythm, alignment, density, composition |
| `tokens` | UI Quality | Theme — decision tree + scoring |
| `components` | UI Quality | Components, states, composition, public props/API |
| `responsive` | Responsive MUST | Every layout UI / all devices |
| `anti-slop-design` | UI Quality | Build + visual audits |
| `anti-slop-code` | UI Quality | Generated implementation tells, blast radius, field errors |
| `polish` | UI Quality | Micro craft |
| `accessibility` | UI Quality | Build/audit a11y |
| `performance` | UI Quality | CWV / slow |
| `motion` | UI Quality | Shell defaults + family/pattern vocabulary (`motion-families.md`); hand-roll |
| `testing` | UI Quality | Tests / TDD |
| `quality-loop` | UI Quality | Polish until clean |
| `webgl` | UI Quality | Plasma backgrounds |
| `monitoring` | UI Quality | Sentry / analytics |
| `app-shell` | Ship FE | Shell, nav, routes |
| `data-fetching` | Ship FE | Async API UI |
| `forms` | Ship FE | Forms / wizards |
| `architecture` | Depth | Folders / state boundaries |
| `seo` | Depth | Meta / OG / indexability |
| `marketing` | UI Quality | Marketing section stack (hero→footer); **hand-roll** — not registry install |
| `fidelity` | UI Quality | Spec / Figma / screenshot match |
| `devtools` | UI Quality | Lighthouse / axe / measured checks |
| `design-vocabulary` | UI Quality | Reverse-lookup: loose description → design term |
| `engineering-vocabulary` | Depth | Reverse-lookup: loose description → FE engineering term |
| `skill-authoring` | Suite root | Author new pack skills following conventions |
| `design-typography` | UI Quality | Font choice, type roles/scales, wrapping, truncation, numerics, bidi |
| `design-color` | UI Quality | Palette construction, OKLCH, themes, contrast, gamut |
| `design-surfaces` | UI Quality | Radius, borders, elevation, shadows, overlays |
| `content-design` | UI Quality | UI copy, recovery language, voice, localization, AI-sounding prose |

## Hard rules

1. Tokens via decision tree (`token-preset-scoring.md`) or project system — never vibe-pick
2. Icons: **MUST ship Reicon** unless waiver — `compliance-gates.md`
3. **Responsive: MUST** verify 320/768/1024/1440 on layout UI — `responsive`
4. **Primary CTAs full-width below 768** (forms / toolbars / action rows) — no tiny desktop-width CTAs on phone
5. **Hierarchy pass** before DONE on blank-canvas / layout polish — one primary focus + one primary CTA (`design-direction`)
6. **Typography ladder** — ≤2 families; **one h1/page**; sequential levels; token type roles
7. WebGL → `webgl` / Plasma — no parallel invented stack
8. No purple/indigo defaults / Lorem (purple only via scored/hard-gated/explicit token)
9. Loading / error / empty for interactive + async surfaces
10. Light **Motion** defaults on shell/dashboard (or waiver) — `motion`; marketing: name families/patterns from `motion-families.md` and hand-roll (registry install is **not** the default)
11. **Shell chrome** — theme in topbar (icon); profile = avatar → account menu; filters = custom select (`app-shell` / `components`)
12. **Marketing landing** — section stack via `marketing` / `landing-sections.md`; hero-only fails; hand-roll (registry install is **not** the default)
13. Do not fabricate visual audit scores without tokens/screenshots
14. Never block on slash commands when intent is clear
15. Blank-canvas → judgment first
16. “Sampai bagus” → `quality-loop` (cap 3)
17. Before DONE → **Conventions check** including **Responsive**, **Hierarchy**, **Typography**, **Motion**, **Shell**, **Landing**
18. Evidence before taste — classify standards, project defaults, enterprise patterns, recommendations, heuristics, and inspiration (`evidence-policy.md`)
19. Structural layout → `design-foundations`: relationships before values; no universal column count, width, or density

Orchestration: session agent loads skills; agents do not call agents. See `docs/pack-layers.md`, `docs/pillars.md`.
