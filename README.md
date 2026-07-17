# Frontend Expert

**Production UI quality for AI coding agents** — senior FE judgment, curated tokens, Reicon icons, anti-AI-slop enforcement.

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

```bash
./scripts/smoke-test.sh   # verify a clone
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

| Capability | Detail |
|------------|--------|
| Chat-first routing | Rules + skill `description`s match intent — no slash required |
| Senior FE judgment | 2–3 approaches + tradeoffs before blank-canvas builds |
| Anti-AI-slop | No random purple gradients, inconsistent spacing, generic heroes |
| Design tokens | 9 CSS presets in `tokens/` (OKLCH + HSL + Plasma landing) |
| Icons | **[Reicon](https://reicon.dev)** by default — [references/reicon-icons.md](references/reicon-icons.md) |
| WebGL backgrounds | **[Plasma Studio](https://plasma.nusaiba.dev/app/)** — pure WebGL, not Three.js by default — [references/webgl.md](references/webgl.md) |
| Quality loop | `/polish` = build → test → audit → fix until Critical/High clear (max 3) |
| Multi-platform | Claude Code, Cursor, Codex, Gemini, OpenCode, Antigravity |
| Claude hooks | SessionStart reminder + PostToolUse anti-slop scan |

### Defaults (when the project has no standard yet)

1. **Tokens** — pick a preset from `tokens/` (or keep the project’s existing design system)
2. **Icons** — [Reicon](https://reicon.dev) (`reicon-react` / CDN). Keep Lucide/etc. if already standardized
3. **Shader backgrounds** — tune/export from [Plasma Studio](https://plasma.nusaiba.dev/app/), drop in via `Plasma.init`

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

```bash
# optional examples
/design --quick
/audit
/ui --token tokens/zinc-blue.css
/ui --token tokens/plasma-landing.css
/test-ui --component Button
/test-ui --tdd
/polish
/polish --max 2
```

Auto intent map (no slash): [AGENTS.md](AGENTS.md) · layers: [docs/pack-layers.md](docs/pack-layers.md).

---

## Skills (9)

| Skill | Use when |
|-------|----------|
| `frontend-judgment` | Non-trivial / blank-canvas UI — options before code |
| `design-tokens` | Choosing/applying theme CSS variables |
| `ui-components` | Components, layouts, states — **Reicon icons** |
| `anti-ai-slop` | Detecting/fixing AI aesthetic patterns |
| `accessibility` | WCAG 2.1 AA checks and fixes |
| `web-performance` | Core Web Vitals / loading optimization |
| `motion` | Animations and micro-interactions only |
| `frontend-testing` | Component tests, TDD, a11y in tests |
| `ui-quality-loop` | Polish until Critical/High clear (capped loop) |

\* Skip judgment for tiny clear fixes or “just implement” / “langsung saja”.

Skills stay short and triggerable; depth lives in `references/`.

---

## Token presets (9)

| Preset | Base | Primary | Best for |
|--------|------|---------|----------|
| `neutral-oklch` | Neutral | Mono (OKLCH) | Modern minimal, sharp edges |
| `neutral-oklch-rounded` | Neutral | Mono (OKLCH) | Mono OKLCH + soft radius (0.625rem) |
| `stone-oklch` | Warm stone | Mono warm (OKLCH) | Editorial, warm minimal |
| `plasma-landing` | Zinc-950 | Purple `#6C5CE7` | [Plasma](https://plasma.nusaiba.dev) marketing landing |
| `stone-emerald` | Stone | Emerald | Clean, minimal |
| `zinc-blue` | Zinc | Blue | Professional dashboards |
| `neutral-purple` | Neutral | Purple | Creative portfolios |
| `slate-cyan` | Slate | Cyan | Data-heavy interfaces |
| `rose-amber` | Rose | Amber | Warm, friendly products |

**Usage tip:** OKLCH / hex presets (`neutral-oklch*`, `stone-oklch`, `plasma-landing`) → `var(--primary)`. HSL presets → `hsl(var(--primary))`.

---

## Icons — Reicon

Default icon library: **[Reicon](https://reicon.dev)** (2,700+ MIT SVG icons, Outline / Filled).

```bash
npm install reicon-react   # React (also: reicon-vue, reicon-svelte, reicon)
```

```tsx
import { Home, Search } from "reicon-react"
<Home size={24} color="currentColor" />
```

Full guide: [references/reicon-icons.md](references/reicon-icons.md) · Browse: [reicon.dev/icons](https://reicon.dev/icons)

---

## WebGL — Plasma Studio

Canonical study for animated backgrounds: **[Plasma Studio](https://plasma.nusaiba.dev/app/)** — pure WebGL fragment shaders (Gradient · Dither · Raymarch). No Three.js required for hero backgrounds.

```js
Plasma.init("plasma-bg", { style: "Fluid", colors: ["#6C5CE7", "#09090b", …] })
```

Guide: [references/webgl.md](references/webgl.md) · Landing: [plasma.nusaiba.dev](https://plasma.nusaiba.dev)

---

## Agents

| Agent | Role | Command |
|-------|------|---------|
| `ui-developer` | Build production UI | `/ui` |
| `design-reviewer` | Audit with honesty scorecard | `/design`, `/audit` |
| `test-engineer` | Prove UI with tests + coverage checklist | `/test-ui` |

Agents are **personas + output format**. They load **skills** for how-to; they do not call each other.

---

## Directory structure

```
frontend-expert/
├── skills/                 # 9 skills
├── agents/                 # ui-developer · design-reviewer · test-engineer
├── tokens/                 # 9 CSS presets
├── references/             # Deep guides (incl. reicon-icons, webgl/Plasma)
├── commands/               # /ui /design /audit /test-ui /polish
├── hooks/                  # Claude Code runtime
├── .claude-plugin/ .claude/ .codex-plugin/ .agents/
├── .gemini/ .opencode/ .cursor/
├── plugin.json · AGENTS.md · CLAUDE.md
├── scripts/ · docs/
└── README.md
```

## References

Map: [references/README.md](references/README.md)

| Kind | Files |
|------|--------|
| Skill-backed | anti-patterns, component-patterns, architecture, accessibility, performance, motion, testing + `tokens/` |
| Icons | [reicon-icons.md](references/reicon-icons.md) |
| WebGL | [webgl.md](references/webgl.md) — Plasma Studio first |
| Reference-only | monitoring — promote later if needed |

---

## Verify pack health

```bash
./scripts/smoke-test.sh      # skills, agents, hooks, plugin paths
./scripts/sync-commands.sh   # ui / design / test-ui / polish adapter parity
```

## Runtime hooks (Claude Code)

| Hook | Event | What it does |
|------|-------|----------------|
| `session-start.sh` | `SessionStart` | Chat-first reminder + skill map + Reicon note |
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

- [Reicon](https://reicon.dev) — default icon library
- [Plasma](https://plasma.nusaiba.dev) — WebGL background studio (canonical study)
- [shadcn/ui](https://ui.shadcn.com/) — design tokens and components
- [Addy Osmani agent-skills](https://github.com/addyosmani/agent-skills) — multi-platform plugin + hooks pattern
- [Tailwind CSS](https://tailwindcss.com/) — utility-first CSS

## License

MIT
