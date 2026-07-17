# Hooks (runtime automation)

Hooks are **Claude Code** event scripts. They are not multi-platform adapters — they automate behavior inside a session.

## Enabled by default (`hooks/hooks.json`)

| Event | Script | Purpose |
|-------|--------|---------|
| `SessionStart` | `session-start.sh` | Remind: `/ui` + `/design` + `/test-ui` + skill list |
| `PostToolUse` (`Edit\|Write`) | `anti-slop-scan.sh` | Warn on AI aesthetic patterns + `transition: all` / bare Tailwind `transition` |

## Docs

- [SESSION-START.md](../hooks/SESSION-START.md)
- [ANTI-SLOP.md](../hooks/ANTI-SLOP.md)

## Requirements

- `bash`, `jq`, `rg` (ripgrep)

## Manual enable (without plugin)

Merge into `.claude/settings.json` or `.claude/settings.local.json` — see examples in the hook markdown docs.
