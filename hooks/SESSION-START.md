# Session Start Hook

On every new Claude Code session, reminds the agent: **chat-first** intent → skills; slash commands optional.

## Behavior

- Runs on `SessionStart` (see `hooks.json`)
- Requires `jq` on PATH
- Emits a short `IMPORTANT` message — does not dump full skill bodies
- Build chain reminder includes **`responsive-ui`** + **`motion`** (+ **`marketing-landing`** if landing; hand-roll from `motion-families.md` / `landing-sections.md`)
- Audit chain includes responsive + motion when animated + marketing-landing when landing
- Points at Conventions check (Responsive / Hierarchy / Typography / Motion / Shell / Landing)
- Shell reminders: theme in topbar; avatar → menu; custom selects
- Landing reminders: section stack hand-roll — not hero-only / not block-registry install

## Manual test

```bash
bash hooks/session-start.sh | jq .
```
