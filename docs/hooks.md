# Hooks (runtime automation)

Hooks are **Claude Code** event scripts. They are not multi-platform adapters — they automate behavior inside a session.

## Enabled by default (`hooks/hooks.json`)

Claude Code loads this file automatically from the plugin’s `hooks/` directory. **Do not** add `"hooks": "./hooks/hooks.json"` to `.claude-plugin/plugin.json` — that double-loads the same file and `/reload-plugins` errors with “Duplicate hooks file detected” (PR #2).

| Event | Script | Purpose |
|-------|--------|---------|
| `SessionStart` | `session-start.sh` | Chat-first reminder: build chain includes **responsive** + **motion** (+ **marketing** if landing); Conventions (Shell / Landing); slash optional |
| `PostToolUse` (`Edit\|Write`) | `anti-slop-scan.sh` | Warn on AI aesthetic patterns + `transition: all` / bare Tailwind `transition` |

## Docs

- [SESSION-START.md](../hooks/SESSION-START.md)
- [ANTI-SLOP.md](../hooks/ANTI-SLOP.md)

## Requirements

- `bash`, `jq`, `rg` (ripgrep)

## Manual enable (without plugin)

Merge into `.claude/settings.json` or `.claude/settings.local.json` — see examples in the hook markdown docs.
