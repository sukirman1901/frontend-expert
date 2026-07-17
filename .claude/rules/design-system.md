# Design System Enforcer — Claude Code rules

**Chat-first.** Do not wait for `/ui`, `/design`, or `/test-ui`. Map user intent to skills automatically. Suite pillars: `docs/pillars.md`.

## Intent → skills

| Intent | Load |
|--------|------|
| Build / modify UI | `frontend-judgment` (non-trivial) → `design-tokens` → (+ shell/data/forms if needed) → `ui-components` → **`responsive-ui`** → **`motion`** (light shell; marketing = `motion-families` hand-roll) → `anti-ai-slop` → `ui-feel` → `accessibility` (+ `webgl` if needed) |
| Forms / validasi | + `forms-validation` |
| API / async data | + `data-fetching` |
| App shell / routing | + `app-shell-routing` |
| Architecture | + `fe-architecture` |
| SEO / meta | + `fe-seo` |
| Feels off / micro polish | `ui-feel` (+ `anti-ai-slop` if generik) — one pass |
| Design audit / AI slop / visual review | `anti-ai-slop` → `ui-feel` → `design-tokens` → `responsive-ui` → `motion` (if animated) → `accessibility` → `web-performance` (+ `design-fidelity` if mock; `fe-devtools` if measuring) (`/design` or `/audit`) |
| Figma / mock / fidelity | `design-fidelity` → `design-tokens` → `responsive-ui` |
| Lighthouse / axe / DevTools | `fe-devtools` → `accessibility` → `web-performance` |
| Hierarchy / typography | `frontend-judgment` Hierarchy + Typography passes |
| UI tests / TDD | `frontend-testing` → `ui-components` → `accessibility` (+ `fe-devtools`) (`test-engineer`) |
| Polish until good / sampai bagus | `ui-quality-loop` (`/polish`) |
| Performance | `web-performance` |
| Marketing landing / homepage / logo cloud | + `marketing-landing` (+ `motion` / `fe-seo`) |
| Motion / marquee / parallax / text reveal / landing animation | + `motion` (families/patterns in `motion-families.md`; hand-roll — not registry default) |
| WebGL / Plasma bg | **`webgl` required** (Plasma / `Plasma.init`) |
| Monitoring / Sentry | `monitoring` |

## Expert judgment

Blank-canvas / ambiguous UI → 2–3 approaches + tradeoffs + recommendation **before** code (`frontend-judgment`). Skip for tiny clear fixes or “langsung saja”.

## Hard rules

1. Prefer project design system; else walk token decision tree in `references/token-preset-scoring.md`
2. **Responsive MUST** — `responsive-ui`; full-width primary CTA <768; Conventions Responsive line
3. **Hierarchy + Typography** — Hierarchy pass; one h1 + type ladder on blank-canvas / layout polish
4. **Icons: MUST use [Reicon](https://reicon.dev)** unless waiver
5. Light **Motion** defaults on shell/dashboard unless waived; marketing: name families/patterns and **hand-roll** (registry install is not the pack default)
6. **Shell chrome** — theme in topbar (icon); avatar → account menu; custom selects for filters (`app-shell-routing` / `ui-components`)
7. WebGL/shader/plasma → load `webgl`; prefer Plasma Studio
8. No purple/indigo defaults, `rounded-2xl` everywhere, or Lorem ipsum (purple OK only via scored/hard-gated/explicit token)
9. Loading / error / empty states; keyboard accessible
10. Before DONE on UI builds → **Conventions check** including Shell (`references/compliance-gates.md`)
11. Slash commands are optional shortcuts only
12. Never fabricate design-audit scores without tokens or screenshots
13. “Rapihin sampai bagus” → `ui-quality-loop` with iteration cap
