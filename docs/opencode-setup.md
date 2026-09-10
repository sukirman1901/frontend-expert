# OpenCode Setup

OpenCode uses agent-driven skill execution via `AGENTS.md` and the `skill` tool.

## Install

1. Clone or symlink this repo into the workspace (or copy `skills/` + `AGENTS.md`)
2. Ensure `AGENTS.md` and `skills/` are visible to OpenCode
3. Optional:

```bash
ln -s /path/to/Design-system-enforcer ~/.config/opencode/skills/design-system-enforcer
```

## Behavior

- UI work → `/ui` mapping: `tokens` + `components` + `anti-slop-design` + `polish` + `accessibility`
- Design audit → `anti-slop-design` + `polish` + `accessibility` + `performance`
- Tests → `testing` (`/test-ui`)
- Motion / perf only when the task needs them

OpenCode does not run Claude Code hooks; skill discipline comes from `AGENTS.md`.
