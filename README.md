# Design System Enforcer

**Production UI quality for AI coding agents** — curated tokens, domain skills, anti-AI-slop enforcement.

**Chat-first + judgment:** talk normally. For blank-canvas UI the agent offers **2–3 approaches** before coding. Slash commands are **optional**.

Not a full frontend curriculum (see [roadmap.sh/frontend](https://roadmap.sh/frontend)). This pack covers **UI quality** with **senior FE judgment**: tokens, components, anti-slop, accessibility, performance, motion, testing.

```
  Chat (default)                         Optional shortcuts
 ┌──────────────────────────────┐        /ui · /design · /test-ui
 │ judgment (if non-trivial)    │
 │ → tokens → components →      │
 │   anti-slop → a11y …         │
 └──────────────────────────────┘
```

---

## What This Pack Does

- **Chat-first auto-routing** — no slash required; rules + skill `description`s match intent
- **Senior FE judgment** — 2–3 approaches + tradeoffs before blank-canvas builds (`frontend-judgment`)
- **Prevents AI slop** — no random purple gradients, inconsistent spacing, or generic heroes
- **Curated tokens** — 5 shadcn/ui presets with light/dark mode
- **Domain skills** — agents load only what the task needs
- **Optional shortcuts** — `/ui`, `/design`, `/test-ui` when you want to pin a workflow
- **Multi-platform** — Claude Code, Cursor, Codex, Gemini, OpenCode, Antigravity
- **Runtime hooks** — SessionStart reminder + PostToolUse anti-slop warnings (Claude Code)

### Out of scope (v1)

SEO, Git basics, REST/API teaching, TypeScript language courses, framework deep-dives.

---

## Quick Start

```bash
# Universal
npx skills add sukirman1901/frontend-expert

# Claude Code
claude --plugin-dir /path/to/frontend-expert
# or: /plugin marketplace add https://github.com/sukirman1901/frontend-expert.git

# Cursor / OpenCode helpers (from a clone)
./scripts/install.sh --help
./scripts/install.sh cursor /path/to/your-app
./scripts/smoke-test.sh
```

Repo: https://github.com/sukirman1901/frontend-expert  

Full guides: [docs/getting-started.md](docs/getting-started.md)

---

## Commands (optional)

Prefer natural chat. Use these only to pin a workflow:

| Command | Purpose | Skills loaded |
|---------|---------|---------------|
| `/ui` | Build UI | judgment* → tokens → components → anti-slop → a11y (+ motion if needed) |
| `/design` | Audit | anti-slop → tokens → a11y → web-performance |
| `/test-ui` | Prove UI | frontend-testing → components → a11y |

```
# optional
/design --quick
/ui --token tokens/zinc-blue.css
/test-ui --component Button
```

Auto map (no slash): see [AGENTS.md](AGENTS.md) and [docs/pack-layers.md](docs/pack-layers.md).

---

## Skills

| Skill | Use when |
|-------|----------|
| `frontend-judgment` | Non-trivial / blank-canvas UI — options before code |
| `design-tokens` | Choosing/applying theme CSS variables |
| `ui-components` | Implementing components, layouts, states |
| `anti-ai-slop` | Detecting/fixing AI aesthetic patterns |
| `accessibility` | WCAG 2.1 AA checks and fixes |
| `web-performance` | Core Web Vitals / loading optimization |
| `motion` | Animations and micro-interactions only |
| `frontend-testing` | Component tests, TDD, a11y in tests |

\* Skip judgment for tiny clear fixes or “just implement”.

Depth lives in `references/` — skills stay short and triggerable.

---

## Directory Structure

```
Design-system-enforcer/
├── skills/                 # Domain skills (6)
├── agents/                 # design-reviewer, ui-developer
├── tokens/                 # 5 CSS presets
├── references/             # Deep guides
├── commands/               # Portable /ui /design
├── hooks/                  # Claude Code runtime
├── .claude-plugin/ .claude/ .codex-plugin/ .agents/
├── .gemini/ .opencode/ .cursor/
├── plugin.json · AGENTS.md · CLAUDE.md
├── scripts/install.sh · docs/
└── README.md
```

---

## Token Presets

| Preset | Base | Primary | Best for |
|--------|------|---------|----------|
| `stone-emerald` | Stone | Emerald | Clean, minimal |
| `zinc-blue` | Zinc | Blue | Professional dashboards |
| `neutral-purple` | Neutral | Purple | Creative portfolios |
| `slate-cyan` | Slate | Cyan | Data-heavy interfaces |
| `rose-amber` | Rose | Amber | Warm, friendly products |

---

## Agents

| Agent | Role | Command |
|-------|------|---------|
| `ui-developer` | Build production UI (+ tests via `/test-ui`) | `/ui`, `/test-ui` |
| `design-reviewer` | Audit with honesty scorecard (no fabricated metrics) | `/design` |

Agents are **personas + output format**. They load **skills** for how-to; they do not call each other. Layer model: [docs/pack-layers.md](docs/pack-layers.md).

## References

Deep guides under `references/`. Map to skills: [references/README.md](references/README.md).

- **Skill-backed:** anti-patterns, component-patterns, architecture, accessibility, performance, motion, testing (+ `tokens/`)
- **Reference-only (v1):** webgl, monitoring — cite when needed; not separate skills yet

## Verify pack health

```bash
./scripts/smoke-test.sh      # skills, agents, hooks, plugin paths
./scripts/sync-commands.sh   # ui / design / test-ui adapter parity
```

---

## Runtime Hooks (Claude Code)

| Hook | Event | What it does |
|------|-------|----------------|
| `session-start.sh` | `SessionStart` | Reminds: `/ui` + `/design` + skill list |
| `anti-slop-scan.sh` | `PostToolUse` Edit/Write | Warns on purple/indigo, gradients, `rounded-2xl`, Lorem, raw hex |

See [docs/hooks.md](docs/hooks.md). Requires `jq` + `rg`.

---

## Platform Install

| Platform | Guide |
|----------|-------|
| Claude Code | [docs/claude-setup.md](docs/claude-setup.md) |
| Cursor | [docs/cursor-setup.md](docs/cursor-setup.md) |
| Codex | [docs/codex-setup.md](docs/codex-setup.md) |
| Gemini CLI | [docs/gemini-setup.md](docs/gemini-setup.md) |
| OpenCode | [docs/opencode-setup.md](docs/opencode-setup.md) |
| Antigravity | `agy plugin install ./Design-system-enforcer` |

---

## Credits

- [shadcn/ui](https://ui.shadcn.com/) — design tokens and components
- [Addy Osmani agent-skills](https://github.com/addyosmani/agent-skills) — multi-platform plugin + hooks pattern
- [Tailwind CSS](https://tailwindcss.com/) — utility-first CSS

## License

MIT
