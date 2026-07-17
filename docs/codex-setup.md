# Codex Setup

Requires Codex CLI with plugin support.

## Install

```bash
codex plugin marketplace add /path/to/Design-system-enforcer
```

Codex reads `skills/` via `.codex-plugin/plugin.json`.

## Usage

Invoke skills with `@`, for example:

```
@design-tokens
@ui-components
@anti-ai-slop
@accessibility
@frontend-testing
```

## Notes

Hooks in this pack target Claude Code's hook protocol. Codex plugin hooks are declared empty in `.codex-plugin/plugin.json` — use skills directly.
