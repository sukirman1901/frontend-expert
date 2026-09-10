# OpenCode Setup

OpenCode uses agent-driven skill execution via `AGENTS.md` and the `skill` tool.

## Install

From this clone:

```bash
./scripts/install.sh opencode
```

That symlinks the pack to `~/.config/opencode/skills/frontend-expert` (and keeps a `design-system-enforcer` alias for older docs).

Manual equivalent:

```bash
ln -sfn /path/to/frontend-expert ~/.config/opencode/skills/frontend-expert
```

## Behavior

- UI work → `/ui` mapping: foundations → tokens → components → anti-slop → polish → accessibility
- Design audit → `anti-slop-design` + `polish` + `accessibility` + `performance`
- Tests → `testing` (`/test-ui`)
- Motion / perf only when the task needs them

OpenCode does not run Claude Code hooks; skill discipline comes from `AGENTS.md`.
