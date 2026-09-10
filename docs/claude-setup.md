# Claude Code Setup

## Marketplace / plugin install (local)

From this clone (tracks local `main`, including commits not yet on GitHub):

```bash
claude --plugin-dir /path/to/frontend-expert
claude plugin validate /path/to/frontend-expert
```

GitHub marketplace (whatever is on `origin`, which may lag local `main`):

```
/plugin marketplace add https://github.com/sukirman1901/frontend-expert.git
/plugin install frontend-expert@frontend-expert
```

## What you get

- Skills: all entries in `plugin.json` (33 — see `docs/pillars.md`)
- Agents: `design-reviewer`, `ui-developer`, `test-engineer`
- Commands: `/design`, `/audit`, `/ui`, `/test-ui`, `/polish`
- Hooks: SessionStart + PostToolUse via auto-loaded `hooks/hooks.json` (do not list it in `.claude-plugin/plugin.json`)
- Rules: `.claude/rules/design-system.md`

## Verify

```
/ui --token tokens/zinc-blue.css
/test-ui --tdd
/design --quick
/polish
/audit
```

From the pack root:

```bash
./scripts/smoke-test.sh
```
