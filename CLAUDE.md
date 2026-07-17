# CLAUDE.md

Claude Code entry point for **Design System Enforcer**.

## Plugin assets

- Skills: `skills/` (8 skills including `frontend-judgment`)
- Agents: `agents/design-reviewer.md`, `agents/ui-developer.md`, `agents/test-engineer.md`
- Commands: `/design`, `/audit`, `/ui`, `/test-ui` — **optional** (see `.claude/commands/`)
- Rules: `.claude/rules/design-system.md` (chat-first + judgment)
- Hooks: `hooks/hooks.json` (SessionStart + PostToolUse anti-slop scan)
- Tokens: `tokens/*.css`

## Default behavior (chat-first + judgment)

1. **Do not wait for slash commands.** Map intent → skills via `AGENTS.md` + rules
2. Blank-canvas / ambiguous UI → `frontend-judgment` (2–3 approaches) **before** coding
3. Then → `design-tokens` → `ui-components` → `anti-ai-slop` → `accessibility`
4. Tests when asked → `test-engineer` + `frontend-testing`
5. Audit when asked → `design-reviewer` skill chain (`/design` or `/audit`); never fabricate visual scores
6. Honor hook advisories from `anti-slop-scan.sh`
7. If the project already has a design system, use custom mode (do not override with presets)

## References

See `AGENTS.md` for the auto intent map, `docs/pack-layers.md` for layers, and `docs/` for install guides.

## Verify

```bash
./scripts/smoke-test.sh
```
