# Design System Enforcer — Claude Code rules

**Chat-first.** Do not wait for `/ui`, `/design`, or `/test-ui`. Map user intent to skills automatically. Suite pillars: `docs/pillars.md`.

## Intent → skills

| Intent | Load |
|--------|------|
| Build / modify UI | `frontend-judgment` (non-trivial) → `design-tokens` → (+ shell/data/forms if needed) → `ui-components` → **`responsive-ui`** → `anti-ai-slop` → `ui-feel` → `accessibility` (+ `motion` if animating) |
| Forms / validasi | + `forms-validation` |
| API / async data | + `data-fetching` |
| App shell / routing | + `app-shell-routing` |
| Architecture | + `fe-architecture` |
| SEO / meta | + `fe-seo` |
| Feels off / micro polish | `ui-feel` (+ `anti-ai-slop` if generik) — one pass |
| Design audit / AI slop / visual review | `anti-ai-slop` → `ui-feel` → `design-tokens` → `responsive-ui` → `accessibility` → `web-performance` (`/design` or `/audit`) |
| UI tests / TDD | `frontend-testing` → `ui-components` → `accessibility` (`test-engineer`) |
| Polish until good / sampai bagus | `ui-quality-loop` (`/polish`) |
| Performance | `web-performance` |
| WebGL / Plasma bg | **`webgl` required** (Plasma / `Plasma.init`) |
| Monitoring / Sentry | `monitoring` |

## Expert judgment

Blank-canvas / ambiguous UI → 2–3 approaches + tradeoffs + recommendation **before** code (`frontend-judgment`). Skip for tiny clear fixes or “langsung saja”.

## Hard rules

1. Prefer project design system; else walk token decision tree in `references/token-preset-scoring.md`
2. **Responsive MUST** — `responsive-ui`; Conventions Responsive line
3. **Icons: MUST use [Reicon](https://reicon.dev)** unless waiver
4. WebGL/shader/plasma → load `webgl`; prefer Plasma Studio
5. No purple/indigo defaults, `rounded-2xl` everywhere, or Lorem ipsum (purple OK only via scored/hard-gated/explicit token)
6. Loading / error / empty states; keyboard accessible
7. Before DONE on UI builds → **Conventions check** (`references/compliance-gates.md`)
8. Slash commands are optional shortcuts only
9. Never fabricate design-audit scores without tokens or screenshots
10. “Rapihin sampai bagus” → `ui-quality-loop` with iteration cap
