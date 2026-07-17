# Getting Started

Install **Design System Enforcer** for your coding agent. Shared content: domain `skills/`, `tokens/`, `agents/`, `references/`. Platform folders are adapters.

**Chat-first + judgment:** talk normally — blank-canvas UI gets 2–3 approaches before code.  
**Entry shortcuts (optional):** `/ui` · `/design` · `/audit` · `/test-ui`  
**Agents:** `ui-developer` · `design-reviewer` · `test-engineer`  
**Skills:** `frontend-judgment`, `design-tokens`, `ui-components`, `anti-ai-slop`, `accessibility`, `web-performance`, `motion`, `frontend-testing`


## Universal (skills CLI)

```bash
npx skills add sukirman1901/frontend-expert
```

## By platform

| Platform | Guide |
|----------|-------|
| Claude Code | [claude-setup.md](./claude-setup.md) |
| Cursor | [cursor-setup.md](./cursor-setup.md) |
| Codex | [codex-setup.md](./codex-setup.md) |
| Gemini CLI | [gemini-setup.md](./gemini-setup.md) |
| OpenCode | [opencode-setup.md](./opencode-setup.md) |
| Antigravity | Use `.agents/plugins/marketplace.json` — `agy plugin install ./Design-system-enforcer` |
| Hooks (runtime) | [hooks.md](./hooks.md) |
| Pack layers (commands/agents/skills/refs) | [pack-layers.md](./pack-layers.md) |
| Latest pack audit | [AUDIT.md](./AUDIT.md) |

## Quick helper

```bash
./scripts/install.sh --help
./scripts/smoke-test.sh
```
