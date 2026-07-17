# Session Start Hook

On every new Claude Code session, reminds the agent: **chat-first** intent → skills; slash commands optional.

## Behavior

- Runs on `SessionStart` (see `hooks.json`)
- Requires `jq` on PATH
- Emits a short `IMPORTANT` message — does not dump full skill bodies

## Manual test

```bash
bash hooks/session-start.sh | jq .
```
