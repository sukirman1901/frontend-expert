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

## Security (Socket / skills.sh)

Claude Code runs these two **pack-owned** scripts on session start and after Edit/Write. They do not download code, do not change files, and do not bypass security scanners.

| Script | What it actually does |
|--------|------------------------|
| `session-start.sh` | Prints a JSON reminder (skill routing). Needs `jq`. |
| `anti-slop-scan.sh` | **UI** lint: warns if a written CSS/JSX file looks like purple-gradient AI slop. Advisory only. |

The Socket “Anomaly” on `hooks/hooks.json` is the normal Claude hook pattern (`bash` + `${CLAUDE_PLUGIN_ROOT}`). `anti-slop-scan` is an aesthetic check, not an antivirus. The public skills.sh audit is pinned to an **old snapshot** (commit `9226153`, 5 Sep) until they re-index — see [vercel-labs/skills#2200](https://github.com/vercel-labs/skills/issues/2200).

Merge into `.claude/settings.json` or `.claude/settings.local.json` — see examples in the hook markdown docs.
