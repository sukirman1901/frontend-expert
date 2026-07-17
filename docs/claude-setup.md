# Claude Code Setup

## Marketplace / plugin install (local)

```bash
claude --plugin-dir /path/to/Design-system-enforcer
```

Or add as a marketplace from a clone:

```
/plugin marketplace add /path/to/Design-system-enforcer
/plugin install design-system-enforcer@design-system-enforcer
```

## What you get

- Skills: `design-tokens`, `ui-components`, `anti-ai-slop`, `accessibility`, `web-performance`, `motion`, `frontend-testing`
- Agents: `design-reviewer`, `ui-developer`
- Commands: `/design`, `/ui`, `/test-ui`
- Hooks: SessionStart reminder + PostToolUse anti-slop scan
- Rules: `.claude/rules/design-system.md`

## Verify

```
/ui --token tokens/zinc-blue.css
/test-ui --tdd
/design --quick
```

From the pack root:

```bash
./scripts/smoke-test.sh
```
