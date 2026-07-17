# CLAUDE.md

Claude Code entry point for **Frontend Expert**.

## Plugin assets

- Skills: `skills/` (**20** skills — UI quality + responsive + ship FE + depth + fidelity/devtools; see `docs/pillars.md`)
- Agents: `agents/design-reviewer.md`, `agents/ui-developer.md`, `agents/test-engineer.md`
- Commands: `/design`, `/audit`, `/ui`, `/test-ui`, `/polish` — **optional**
- Rules: `.claude/rules/design-system.md` (chat-first + judgment)
- Hooks: `hooks/hooks.json` (SessionStart + PostToolUse anti-slop scan)
- Tokens: `tokens/*.css` + decision tree / scoring in `references/token-preset-scoring.md` (+ `tokens/README.md`)
- Evals: `evals/` (E1–E20)

## Default behavior (chat-first + judgment)

1. **Do not wait for slash commands.** Map intent → skills via `AGENTS.md` + rules
2. Blank-canvas / ambiguous UI → `frontend-judgment` (2–3 approaches) **before** coding
3. Then → `design-tokens` (decision tree) → (+ shell/data/forms) → `ui-components` → **`responsive-ui`** → **`motion`** (light shell; marketing = families/patterns from `motion-families.md`, hand-roll) → `anti-ai-slop` → `ui-feel` → `accessibility`
4. Tests when asked → `test-engineer` + `frontend-testing`
5. Audit when asked → `design-reviewer` skill chain (`/design` or `/audit`); never fabricate visual scores
6. “Rapihin / polish sampai bagus” → `ui-quality-loop` (`/polish`), capped iterations
7. Honor hook advisories from `anti-slop-scan.sh`
8. If the project already has a design system, use custom mode (do not override with presets)
9. Icons: prefer [Reicon](https://reicon.dev) (`references/reicon-icons.md`) unless the project already has an icon standard
10. Before DONE on UI builds → **Conventions check** including **Responsive**, **Hierarchy**, **Typography**, **Motion** (`references/compliance-gates.md`)

## References

See `AGENTS.md` for the auto intent map, `docs/pillars.md` for suite pillars, `docs/pack-layers.md` for layers.

## Verify

```bash
./scripts/smoke-test.sh
```
