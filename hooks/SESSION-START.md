# Session Start Hook

On every new Claude Code session, reminds the agent: **chat-first** intent → skills; slash commands optional.

## Behavior

- Runs on `SessionStart` (see `hooks.json`)
- Requires `jq` on PATH
- Emits a short `IMPORTANT` message — does not dump full skill bodies
- Build chain reminder includes **`responsive-ui`** + **`motion`** (hand-roll from `motion-families.md` for marketing)
- Audit chain includes responsive + motion when animated
- Points at Conventions check (Responsive / Hierarchy / Typography / Motion / Shell)
- Shell reminders: theme in topbar; avatar → menu; custom selects

## Manual test

```bash
bash hooks/session-start.sh | jq .
```
