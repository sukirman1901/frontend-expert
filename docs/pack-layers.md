# Pack layers

How the pieces of Design System Enforcer fit together.

```text
┌──────────────────────────────────────────────────────────┐
│  Natural chat (DEFAULT)         ← intent → skills auto   │
│  Commands (/ui,/design,/audit,/test-ui,/polish) ← OPTIONAL │
├──────────────────────────────────────────────────────────┤
│  Agents (ui-developer,              ← WHO                │
│          design-reviewer,                                │
│          test-engineer)                                  │
├──────────────────────────────────────────────────────────┤
│  Skills (12)                        ← HOW (+ feel + quality loop + webgl/monitoring)│
├──────────────────────────────────────────────────────────┤
│  References + tokens/               ← DEPTH              │
├──────────────────────────────────────────────────────────┤
│  Hooks + always-on rules            ← RUNTIME / ROUTING  │
└──────────────────────────────────────────────────────────┘
```

## Rules

1. **Chat-first** — never require a slash command when intent is clear (`AGENTS.md`, Cursor/Claude rules).
2. **Commands orchestrate** — optional; list agent + skills; do not duplicate full skill bodies.
3. **Agents do not invoke other agents** — user or command orchestrates. Agents stay slim.
4. **Skills stay short** — rich `description` for auto-match; point to `references/` for depth.
5. **References deepen skills** — `webgl` / `monitoring` are now skills; depth stays in `references/`.
6. **Hooks** — Claude Code session reminder + anti-slop scan.

## Agent ↔ command ↔ skills

| Command | Agent | Skills (order) |
|---------|-------|----------------|
| `/ui` (or chat) | `ui-developer` | frontend-judgment* → design-tokens → ui-components → anti-ai-slop → ui-feel → accessibility (+ motion if needed) |
| `/design` or `/audit` | `design-reviewer` | anti-ai-slop → ui-feel → design-tokens → accessibility → web-performance (+ ui-components / judgment / test gaps as needed) |
| `/test-ui` (or chat) | `test-engineer` | frontend-testing → ui-components → accessibility |
| `/polish` (or chat) | loop controller | `ui-quality-loop` → ui-developer + test-engineer + design-reviewer until gates pass |

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
