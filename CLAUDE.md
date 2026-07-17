# CLAUDE.md

Claude Code entry point for **Design System Enforcer**.

## Plugin assets

- Skills: `skills/` (12 skills including `frontend-judgment`, `ui-feel`, `ui-quality-loop`, `webgl`, `monitoring`)
- Agents: `agents/design-reviewer.md`, `agents/ui-developer.md`, `agents/test-engineer.md`
- Commands: `/design`, `/audit`, `/ui`, `/test-ui`, `/polish` — **optional**
- Rules: `.claude/rules/design-system.md` (chat-first + judgment)
- Hooks: `hooks/hooks.json` (SessionStart + PostToolUse anti-slop scan)
- Tokens: `tokens/*.css` (+ `tokens/README.md`)
- Evals: `evals/`

## Default behavior (chat-first + judgment)

1. **Do not wait for slash commands.** Map intent → skills via `AGENTS.md` + rules
2. Blank-canvas / ambiguous UI → `frontend-judgment` (2–3 approaches) **before** coding
3. Then → `design-tokens` → `ui-components` → `anti-ai-slop` → `ui-feel` → `accessibility`
4. Tests when asked → `test-engineer` + `frontend-testing`
5. Audit when asked → `design-reviewer` skill chain (`/design` or `/audit`); never fabricate visual scores
6. “Rapihin / polish sampai bagus” → `ui-quality-loop` (`/polish`), capped iterations
7. Honor hook advisories from `anti-slop-scan.sh`
8. If the project already has a design system, use custom mode (do not override with presets)
9. Icons: prefer [Reicon](https://reicon.dev) (`references/reicon-icons.md`) unless the project already has an icon standard

## References

See `AGENTS.md` for the auto intent map, `docs/pack-layers.md` for layers, and `docs/` for install guides.

## Verify

```bash
./scripts/smoke-test.sh
```
