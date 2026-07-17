# Design System Enforcer — Claude Code rules

**Chat-first.** Do not wait for `/ui`, `/design`, or `/test-ui`. Map user intent to skills automatically.

## Intent → skills

| Intent | Load |
|--------|------|
| Build / modify UI | `frontend-judgment` (non-trivial) → `design-tokens` → `ui-components` → `anti-ai-slop` → `accessibility` (+ `motion` if animating) |
| Design audit / AI slop / visual review | `anti-ai-slop` → `design-tokens` → `accessibility` → `web-performance` (`/design` or `/audit`) |
| UI tests / TDD | `frontend-testing` → `ui-components` → `accessibility` (`test-engineer`) |
| Polish until good | `ui-quality-loop` (`/polish`) |
| Performance | `web-performance` |

## Expert judgment

Blank-canvas / ambiguous UI → 2–3 approaches + tradeoffs + recommendation **before** code (`frontend-judgment`). Skip for tiny clear fixes or “langsung saja”.

## Hard rules

1. CSS variables from `tokens/` or the project's existing design system
2. No purple/indigo defaults, `rounded-2xl` everywhere, or Lorem ipsum
3. Loading / error / empty states; keyboard accessible
4. Slash commands are optional shortcuts only (`/ui` `/design` `/audit` `/test-ui` `/polish`)
5. Never fabricate design-audit scores without tokens or screenshots
6. “Rapihin sampai bagus” → `ui-quality-loop` with iteration cap (no infinite loops)
