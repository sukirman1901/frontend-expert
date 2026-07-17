# Frontend Expert

**Production UI quality for AI coding agents** — senior FE judgment, curated tokens, anti-AI-slop enforcement.

**Chat-first:** talk normally. For blank-canvas UI the agent offers **2–3 approaches** before coding. Slash commands are **optional**.

Repo: [sukirman1901/frontend-expert](https://github.com/sukirman1901/frontend-expert)

---

## Installation

**Fastest (any agent that supports the skills CLI):**

```bash
npx skills add sukirman1901/frontend-expert
```

### Claude Code

```bash
# Marketplace
/plugin marketplace add https://github.com/sukirman1901/frontend-expert.git
/plugin install frontend-expert@frontend-expert

# Or local clone
git clone https://github.com/sukirman1901/frontend-expert.git
claude --plugin-dir ./frontend-expert
```

### Cursor

```bash
git clone https://github.com/sukirman1901/frontend-expert.git
cd frontend-expert
./scripts/install.sh cursor /path/to/your-app
```

### OpenCode / Codex / Gemini

```bash
git clone https://github.com/sukirman1901/frontend-expert.git
./scripts/install.sh opencode          # OpenCode symlink
./scripts/install.sh gemini            # copy Gemini commands
# Codex: see docs/codex-setup.md
```

More detail: [docs/getting-started.md](docs/getting-started.md) · per-platform guides under [docs/](docs/).

Verify a clone:

```bash
./scripts/smoke-test.sh
```

---

## What This Pack Does

Not a full frontend curriculum (see [roadmap.sh/frontend](https://roadmap.sh/frontend)). This pack covers **UI quality** with **senior FE judgment**.

```
  Chat (default)                         Optional shortcuts
 ┌──────────────────────────────┐        /ui · /test-ui · /design|/audit · /polish
 │ judgment → build → test →    │
 │ audit → fix (loop) …         │
 └──────────────────────────────┘
```

- **Chat-first auto-routing** — no slash required; rules + skill `description`s match intent
- **Senior FE judgment** — 2–3 approaches + tradeoffs before blank-canvas builds (`frontend-judgment`)
- **Prevents AI slop** — no random purple gradients, inconsistent spacing, or generic heroes
- **Curated tokens** — 5 shadcn/ui presets with light/dark mode
- **Domain skills** — agents load only what the task needs
- **Optional shortcuts** — `/ui`, `/test-ui`, `/design`, `/audit`, `/polish`
- **Quality loop** — `/polish` / “rapihin sampai bagus” runs build→test→audit→fix until Critical/High clear (max 3)
- **Multi-platform** — Claude Code, Cursor, Codex, Gemini, OpenCode, Antigravity
- **Runtime hooks** — SessionStart reminder + PostToolUse anti-slop warnings (Claude Code)

### Out of scope (v1)

SEO, Git basics, REST/API teaching, TypeScript language courses, framework deep-dives.

---

## Commands (optional)

Prefer natural chat. Use these only to pin a workflow:

| Command | Purpose | Skills loaded |
|---------|---------|---------------|
| `/ui` | Build UI | judgment* → tokens → components → anti-slop → a11y (+ motion if needed) |
| `/design` | Audit | anti-slop → tokens → a11y → web-performance (+ judgment for redesigns) |
| `/audit` | Alias of `/design` | same |
| `/test-ui` | Prove UI | frontend-testing → components → a11y |
| `/polish` | Quality loop | build → test → audit → fix until gates pass (max 3) |

```
# optional
/design --quick
/audit
/ui --token tokens/zinc-blue.css
/test-ui --component Button
/test-ui --tdd
/polish
/polish --max 2
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
| `ui-quality-loop` | Polish until Critical/High clear (capped loop) |

\* Skip judgment for tiny clear fixes or “just implement”.

Depth lives in `references/` — skills stay short and triggerable.

---

## Directory Structure

```
frontend-expert/
├── skills/                 # 9 skills (judgment + domains + quality loop)
├── agents/                 # ui-developer, design-reviewer, test-engineer
├── tokens/                 # 9 CSS presets (incl. plasma-landing)
├── references/             # Deep guides
├── commands/               # /ui /design /audit /test-ui /polish
├── hooks/                  # Claude Code runtime
├── .claude-plugin/ .claude/ .codex-plugin/ .agents/
├── .gemini/ .opencode/ .cursor/
├── plugin.json · AGENTS.md · CLAUDE.md
├── scripts/ · docs/
└── README.md
```

---

## Token Presets

| Preset | Base | Primary | Best for |
|--------|------|---------|----------|
| `neutral-oklch` | Neutral | Mono (OKLCH) | Modern minimal, sharp edges |
| `neutral-oklch-rounded` | Neutral | Mono (OKLCH) | Mono OKLCH + soft radius (0.625rem) |
| `stone-oklch` | Warm stone | Mono warm (OKLCH) | Editorial, warm minimal |
| `plasma-landing` | Zinc-950 | Purple `#6C5CE7` | Plasma marketing landing |
| `stone-emerald` | Stone | Emerald | Clean, minimal |
| `zinc-blue` | Zinc | Blue | Professional dashboards |
| `neutral-purple` | Neutral | Purple | Creative portfolios |
| `slate-cyan` | Slate | Cyan | Data-heavy interfaces |
| `rose-amber` | Rose | Amber | Warm, friendly products |

---

## Agents

| Agent | Role | Command |
|-------|------|---------|
| `ui-developer` | Build production UI | `/ui` |
| `design-reviewer` | Audit with honesty scorecard | `/design`, `/audit` |
| `test-engineer` | Prove UI with tests + coverage checklist | `/test-ui` |

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

## Platform guides

| Platform | Guide |
|----------|-------|
| **All (skills CLI)** | `npx skills add sukirman1901/frontend-expert` |
| Claude Code | [docs/claude-setup.md](docs/claude-setup.md) |
| Cursor | [docs/cursor-setup.md](docs/cursor-setup.md) |
| Codex | [docs/codex-setup.md](docs/codex-setup.md) |
| Gemini CLI | [docs/gemini-setup.md](docs/gemini-setup.md) |
| OpenCode | [docs/opencode-setup.md](docs/opencode-setup.md) |
| Antigravity | `agy plugin install https://github.com/sukirman1901/frontend-expert.git` |

---

## Credits

- [shadcn/ui](https://ui.shadcn.com/) — design tokens and components
- [Addy Osmani agent-skills](https://github.com/addyosmani/agent-skills) — multi-platform plugin + hooks pattern
- [Tailwind CSS](https://tailwindcss.com/) — utility-first CSS

## License

MIT
