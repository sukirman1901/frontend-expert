# Pack layers

How the pieces of **Frontend Expert** fit together.

```text
┌──────────────────────────────────────────────────────────┐
│  Natural chat (DEFAULT)         ← intent → skills auto   │
│  Commands (/ui,/design,/audit,/test-ui,/polish) ← OPTIONAL │
├──────────────────────────────────────────────────────────┤
│  Agents (ui-developer,              ← WHO                │
│          design-reviewer,                                │
│          test-engineer)                                  │
├──────────────────────────────────────────────────────────┤
│  Skills (22) — suite pillars        ← HOW                │
│  UI Quality · Responsive MUST · Ship FE · Depth          │
├──────────────────────────────────────────────────────────┤
│  References + tokens/               ← DEPTH              │
├──────────────────────────────────────────────────────────┤
│  Hooks + always-on rules            ← RUNTIME / ROUTING  │
└──────────────────────────────────────────────────────────┘
```

Pillar map: [pillars.md](./pillars.md).

## Rules

1. **Chat-first** — never require a slash command when intent is clear (`AGENTS.md`, Cursor/Claude rules).
2. **Commands orchestrate** — optional; list agent + skills; do not duplicate full skill bodies.
3. **Agents do not invoke other agents** — user or command orchestrates. Agents stay slim.
4. **Skills stay short** — rich `description` for auto-match; point to `references/` for depth.
5. **References deepen skills** — depth stays in `references/`.
6. **Hooks** — Claude Code session reminder + anti-slop scan.
7. **Responsive MUST** on layout UI — skill `responsive-ui` + Conventions line.

## Agent ↔ command ↔ skills

| Command | Agent | Skills (order) |
|---------|-------|----------------|
| `/ui` (or chat) | `ui-developer` | judgment* → tokens → (+ **marketing-landing** if marketing) → (+ shell/data/forms) → ui-components → **responsive-ui** → **motion** (light shell / `motion-families` hand-roll) → anti-ai-slop → ui-feel → accessibility |
| `/design` or `/audit` | `design-reviewer` | anti-ai-slop → ui-feel → tokens → responsive-ui → accessibility → web-performance → **motion** (if animated) → **marketing-landing** (if landing) (+ **design-fidelity** if mock; **fe-devtools** if measuring) |
| `/test-ui` (or chat) | `test-engineer` | frontend-testing → ui-components → accessibility (+ **fe-devtools** when tooling evidence needed) |
| `/polish` (or chat) | loop controller | `ui-quality-loop` until gates pass |

\* Judgment only when non-trivial / blank-canvas — see skill skip rules.

## Token source decision tree

Canonical detail: [`references/token-preset-scoring.md`](../references/token-preset-scoring.md).

```text
--custom / existing theme / keep palette?  → CUSTOM (style-infer, no score)
--token / named preset?                    → EXPLICIT file (no score)
Explicit Plasma brand?                     → plasma-landing (hard-gate)
else                                       → SCORE (signals → n/24 → #1)
```

## Maintainers

```bash
./scripts/sync-commands.sh   # command adapter parity
./scripts/smoke-test.sh      # full pack integrity
```

See also: [references/README.md](../references/README.md).
