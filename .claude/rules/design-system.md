# Design System Enforcer — Claude Code rules

**Chat-first.** Do not wait for `/ui`, `/design`, or `/test-ui`. Map user intent to skills automatically.

## Intent → skills

| Intent | Load |
|--------|------|
| Build / modify UI | `frontend-judgment` (non-trivial) → `design-tokens` → `ui-components` → `anti-ai-slop` → `ui-feel` → `accessibility` (+ `motion` if animating) |
| Feels off / micro polish | `ui-feel` (+ `anti-ai-slop` if generik) — one pass |
| Design audit / AI slop / visual review | `anti-ai-slop` → `ui-feel` → `design-tokens` → `accessibility` → `web-performance` (`/design` or `/audit`) |
| UI tests / TDD | `frontend-testing` → `ui-components` → `accessibility` (`test-engineer`) |
| Polish until good / sampai bagus | `ui-quality-loop` (`/polish`) |
| Performance | `web-performance` |
| WebGL / Plasma bg | **`webgl` required** (Plasma / `Plasma.init`) |
| Monitoring / Sentry | `monitoring` |

## Expert judgment

Blank-canvas / ambiguous UI → 2–3 approaches + tradeoffs + recommendation **before** code (`frontend-judgment`). Skip for tiny clear fixes or “langsung saja”.

## Hard rules

1. CSS variables from `tokens/` or the project's existing design system
2. **Icons: MUST use [Reicon](https://reicon.dev)** unless project icon lib exists or text-only waiver (`references/reicon-icons.md`, `references/compliance-gates.md`)
3. WebGL/shader/plasma → load `webgl`; prefer Plasma Studio — no parallel invented stack
4. No purple/indigo defaults, `rounded-2xl` everywhere, or Lorem ipsum
5. Loading / error / empty states; keyboard accessible
6. Before DONE on UI builds → **Conventions check** (`references/compliance-gates.md`)
7. Slash commands are optional shortcuts only (`/ui` `/design` `/audit` `/test-ui` `/polish`)
8. Never fabricate design-audit scores without tokens or screenshots
9. “Rapihin sampai bagus” → `ui-quality-loop` with iteration cap (no infinite loops)
