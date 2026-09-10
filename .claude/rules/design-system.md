# Design System Enforcer — Claude Code rules

**Chat-first.** Do not wait for `/ui`, `/design`, or `/test-ui`. Map user intent to skills automatically. Suite pillars: `docs/pillars.md`.

## Intent → skills

| Intent | Load |
|--------|------|
| Build / modify UI | `design-direction` (non-trivial) → `design-foundations` → `tokens` → (+ **`marketing`** if landing) → (+ shell/data/forms if needed) → `components` → **`anti-slop-code`** → **`responsive`** → **`motion`** (light shell; marketing = `motion-families` hand-roll) → `anti-slop-design` → `polish` → `accessibility` (+ `webgl` if needed) |
| Forms / validasi | + `forms` |
| API / async data | + `data-fetching` |
| App shell / routing | + `app-shell` |
| Architecture | + `architecture` |
| SEO / meta | + `seo` |
| UI copy / CTA / error / empty / AI writing | `content-design` (not `anti-slop-design`) |
| Kode terasa AI / rapikan kode / over-engineered / error handling generik / edge case | `anti-slop-code` (not `anti-slop-design`, not `polish`) |
| Feels off / micro polish | `polish` (+ `anti-slop-design` if generik) — one pass |
| Layout berantakan / struktur layout / rapikan struktur / grid / spacing / alignment | `design-foundations` → `tokens` → `responsive` |
| Hierarchy / typography / type scale | `design-direction` Hierarchy + Typography passes → `design-typography` → `polish` |
| Design audit / AI slop / visual review | `anti-slop-design` → `polish` → `tokens` → `design-foundations` (if structural) → `responsive` → `motion` (if animated) → **`marketing`** (if landing) → `accessibility` → `performance` (+ `fidelity` if mock; `devtools` if measuring) (`/design` or `/audit`) |
| Figma / mock / fidelity | `fidelity` → `tokens` → `responsive` |
| Lighthouse / axe / DevTools | `devtools` → `accessibility` → `performance` |
| UI tests / TDD | `testing` → `components` → `accessibility` (+ `devtools`) (`test-engineer`) |
| Polish until good / sampai bagus | `quality-loop` (`/polish`) |
| Performance | `performance` |
| Marketing landing / homepage / logo cloud | + `marketing` (section stack **hand-roll** — not registry) (+ `motion` / `seo`) |
| Motion / marquee / parallax / text reveal / landing animation | + `motion` (families/patterns in `motion-families.md`; hand-roll — not registry default) |
| WebGL / Plasma bg | **`webgl` required** (Plasma / `Plasma.init`) |
| Monitoring / Sentry | `monitoring` |

Skip `design-foundations` for isolated color, typography, copy, token, component-state, motion, and micro-polish changes.

## Expert judgment

Blank-canvas / ambiguous UI → 2–3 approaches + tradeoffs + recommendation **before** code (`design-direction`). Skip for tiny clear fixes or “langsung saja”.

## Hard rules

1. Prefer project design system; else walk token decision tree in `references/token-preset-scoring.md`
2. **Responsive MUST** — `responsive`; full-width primary CTA <768; Conventions Responsive line
3. **Hierarchy + Typography** — Hierarchy pass; one h1 + type ladder on blank-canvas / layout polish
4. **Foundations** — coherent container/grid, spacing relationships, shared anchors, one focal path (`design-foundations`)
5. **Icons: MUST use [Reicon](https://reicon.dev)** unless waiver
6. Light **Motion** defaults on shell/dashboard unless waived; marketing: name families/patterns and **hand-roll** (registry install is not the pack default)
7. **Shell chrome** — theme in topbar (icon); avatar → account menu; custom selects for filters (`app-shell` / `components`)
8. **Marketing landing** — section stack via `marketing`; hero-only fails; hand-roll (not `@tailark`/block registry)
9. WebGL/shader/plasma → load `webgl`; prefer Plasma Studio
10. No purple/indigo defaults, `rounded-2xl` everywhere, or Lorem ipsum (purple OK only via scored/hard-gated/explicit token)
11. Loading / error / empty states; keyboard accessible
12. Before DONE on UI builds → **Conventions check** including Shell + Landing (`references/compliance-gates.md`)
13. Slash commands are optional shortcuts only
14. Never fabricate design-audit scores without tokens or screenshots
15. “Rapihin sampai bagus” → `quality-loop` with iteration cap
