# Frontend Expert

**Suite for AI coding agents to ship product web UI** — UI quality, **responsive all devices**, ship FE (shell/data/forms), and depth (architecture/SEO).

**Chat-first:** talk normally. For blank-canvas UI the agent offers **2–3 approaches** before coding. Slash commands are **optional**.

Pillars: [docs/pillars.md](docs/pillars.md) · Repo: [sukirman1901/frontend-expert](https://github.com/sukirman1901/frontend-expert)

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
./scripts/install.sh cursor-user          # personal Agent — skills + agents + commands (symlinks)
# or project-local:
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

Not a full [roadmap.sh/frontend](https://roadmap.sh/frontend) curriculum and **not React Native**. This suite covers **shipping product web UI** with senior FE judgment:

| Pillar | What |
|--------|------|
| **UI Quality** | Tokens, anti-slop, polish, a11y, tests, polish loop, WebGL, monitoring, design vocabulary |
| **Responsive MUST** | All devices 320→1440+ (`responsive`) |
| **Ship FE** | App shell/routing, data-fetching, forms |
| **Depth** | FE architecture, technical SEO, engineering vocabulary |

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
| UI feel | Micro craft — concentric radius, tabular-nums, press/hover feel ([`polish`](skills/polish/SKILL.md)) |
| Design tokens | 9 CSS presets + **decision tree / scoring** |
| **Responsive** | **MUST** — 320/768/1024/1440 in Conventions check |
| Icons | **[Reicon](https://reicon.dev) MUST** in shipped markup unless waiver |
| Ship FE | Shell, async data UI, forms |
| WebGL backgrounds | Skill **`webgl`** → Plasma Studio / `Plasma.init` |
| Compliance | Conventions check (tokens / icons / states / **responsive** / hierarchy / typography / **shell** / webgl / motion) |
| Quality loop | `/polish` = build → test → audit → fix (max 3) |
| Multi-platform | Claude Code, Cursor, Codex, Gemini, OpenCode |

### Defaults (when the project has no standard yet)

1. **Tokens** — score a preset (`references/token-preset-scoring.md`), or keep the project’s design system
2. **Responsive** — `responsive` on every layout
3. **Icons** — [Reicon](https://reicon.dev) in markup
4. **Shader backgrounds** — `webgl` → Plasma → `Plasma.init`
5. **Ship gate** — [Conventions check](references/compliance-gates.md)

### Out of scope

Git/CS theory deep-dives, REST teaching as a course, TypeScript language courses, **React Native**, browser Design Lab `/explore`, backend/DevOps.

---

## Commands (optional)

Prefer natural chat. Use these only to pin a workflow:

| Command | Purpose | Skills loaded |
|---------|---------|---------------|
| `/ui` | Build UI | judgment* → **foundations** → tokens → (+ shell/data/forms) → components → **responsive** → **motion** → anti-slop → **polish** → a11y |
| `/design` | Audit | anti-slop → **polish** → tokens → **responsive** → **motion** (if animated) → a11y → performance (+ fidelity / devtools / judgment as needed) |
| `/audit` | Alias of `/design` | same |
| `/test-ui` | Prove UI | testing → components → a11y → **devtools** (when measuring) |
| `/polish` | Quality loop | build → test → audit → fix until gates pass (max 3; includes responsive + motion) |

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

## Start here

- **`frontend-expert`** — when you are unsure which skill owns the problem
- **`design-direction`** — when designing a new or ambiguous surface
- **`quality-loop`** — when working UI needs an evidence-backed final pass

Domain skills auto-load from natural language; slash commands remain optional adapters.

---

## Skills (32)

Pillar map: [docs/pillars.md](docs/pillars.md). Suite root + domain skills:

| Skill | Pillar | Use when |
|-------|--------|----------|
| `frontend-expert` | Suite root | Catalog / install entry — routes into pillars |
| `design-direction` | UI Quality | Blank-canvas — axes + options before code |
| `prototype` | UI Quality | Rendered 2–3 variants + state stress |
| `design-foundations` | UI Quality | Grid, spacing rhythm, alignment, density, composition |
| `tokens` | UI Quality | Scoring + applying theme CSS |
| `design-typography` | UI Quality | Fonts, type roles/scales, wrapping, truncation |
| `design-color` | UI Quality | Palette, OKLCH, themes, contrast, gamut |
| `design-surfaces` | UI Quality | Radius, borders, elevation, shadows, overlays |
| `content-design` | UI Quality | UI copy, errors, empty states, voice, AI-sounding prose |
| `components` | UI Quality | Components, states — **Reicon**; custom selects |
| `responsive` | Responsive MUST | All devices 320–1440+ |
| `anti-slop-design` | UI Quality | AI aesthetic patterns |
| `anti-slop-code` | UI Quality | Generated implementation, blast radius, field errors |
| `polish` | UI Quality | Micro craft (“feels off”) |
| `accessibility` | UI Quality | WCAG 2.2 AA by default; project/legal target may differ |
| `performance` | UI Quality | Core Web Vitals |
| `motion` | UI Quality | Shell defaults + family/pattern vocabulary (hand-roll) |
| `testing` | UI Quality | Component tests / TDD |
| `quality-loop` | UI Quality | Polish until Critical/High clear |
| `webgl` | UI Quality | Plasma Studio backgrounds |
| `monitoring` | UI Quality | Sentry / analytics / OTel |
| `fidelity` | UI Quality | Spec / Figma / screenshot match |
| `devtools` | UI Quality | Lighthouse / axe / measured checks |
| `marketing` | UI Quality | Marketing section stack (hero→footer; hand-roll) |
| `app-shell` | Ship FE | Shell, nav, routes |
| `data-fetching` | Ship FE | Async API UI states |
| `forms` | Ship FE | Forms / wizards |
| `architecture` | Depth | Folders / state boundaries |
| `seo` | Depth | Meta / OG / indexability |
| `design-vocabulary` | UI Quality | Name a design concept from a loose description |
| `engineering-vocabulary` | Depth | Name a FE engineering pattern from a loose description |
| `skill-authoring` | Suite root | Author new skills following pack conventions |

\* Skip judgment for tiny clear fixes or “just implement” / “langsung saja”.

Skills stay short and triggerable; depth lives in `references/`.

### Canonical names

Version 2.1 contains 30 canonical skill folders. Legacy identifiers were removed in 2.0 to prevent duplicate discovery. Use `references/skill-aliases.md` when migrating an older prompt or integration.

---

## Token presets (9)

Import notes: [tokens/README.md](tokens/README.md).
**Choosing a preset:** walk the decision tree in [references/token-preset-scoring.md](references/token-preset-scoring.md) — custom → explicit → Plasma hard-gate → score (not vibes-only).

| Preset | Base | Primary | Affinity hint |
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

**MUST ship in markup** for nav / toolbars / empty states / icon buttons — not “prefer in docs only”. Skills can be installed and still ignored; the pack requires a [Conventions check](references/compliance-gates.md) before DONE.

```bash
npm install reicon-react   # React (also: reicon-vue, reicon-svelte, reicon)
```

```tsx
import { Home, Search } from "reicon-react"
<Home size={24} color="currentColor" />
```

Vanilla HTML:

```html
<script defer src="https://unpkg.com/reicon/cdn/reicon.min.js"></script>
<re-icon icon="user" size="20" decorative></re-icon>
```

Full guide: [references/reicon-icons.md](references/reicon-icons.md) · Browse: [reicon.dev/icons](https://reicon.dev/icons)

---

## Compliance gates

Agents must not silently skip pack conventions. Before marking UI done, they report:

```markdown
## Conventions check
- Tokens: <preset (score n/24 | explicit | hard-gate) | project system | waiver>
- Icons: <Reicon … | existing lib | waiver: text-only>
- States: loading / empty / error …
- Responsive: 320/768/1024/1440 checked | full-width CTA <768 | waiver
- Hierarchy: pass | fails: … | waiver
- Typography: one h1 + ladder | fails: … | waiver
- A11y: labels + focus noted? <yes | waiver>
- Shell: theme in topbar? | avatar→menu | custom selects | waiver
- Motion: light shell | families: … | patterns: … | none (waiver)
- WebGL: <Plasma.init … | n/a>
```

Details: [references/compliance-gates.md](references/compliance-gates.md) · Eval: [evals/reicon-webgl-compliance.md](evals/reicon-webgl-compliance.md)

---

## UI feel (micro craft)

Skill **`polish`** — original pack workflow informed by interface-craft research.

Concentric radius (heuristic, via `design-surfaces`), optical alignment, tabular numbers, text-wrap, interruptible transitions, press-scale heuristic, hit areas, no `transition: all`. Runs after anti-slop on `/ui` and inside `/polish`.

Guide: [references/polish.md](references/polish.md)

---

## WebGL — Plasma Studio

Skill **`webgl`** (required for shader / plasma / animated canvas backgrounds). Canonical study: **[Plasma Studio](https://plasma.nusaiba.dev/app/)**. Prefer `Plasma.init` — do not invent a Three.js hero for fullscreen backgrounds unless the user wants a 3D scene graph.


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

Agents are **personas + output format**. They load **skills** for how-to; they do not call each other. The **session agent** is the orchestrator (`docs/pack-layers.md`).

---

## Directory structure

```
frontend-expert/
├── skills/                 # 32 skills: suite root + domain — see docs/pillars.md
├── agents/                 # ui-developer · design-reviewer · test-engineer
├── tokens/                 # 9 CSS presets + README
├── references/             # Deep guides (incl. compliance-gates, fe-lifecycle)
├── evals/                  # Behavioral scenarios (+ Reicon/WebGL compliance)
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
| Skill-backed | anti-patterns, polish, design-axes, ux-foundations, fe-lifecycle, **compliance-gates**, **motion-families**, component-patterns, architecture, accessibility, performance, motion, testing, webgl, monitoring, fidelity, devtools + `tokens/` |
| Icons | [reicon-icons.md](references/reicon-icons.md) |
| Evals | [evals/](evals/) (purple, honesty, loop, routing, **reicon/webgl**) |
| Guides | [tokens/README.md](tokens/README.md) · [fe-lifecycle.md](references/fe-lifecycle.md) · [compliance-gates.md](references/compliance-gates.md) |

---

## Verify pack health

```bash
./scripts/smoke-test.sh      # skills, agents, hooks, plugin paths
./scripts/sync-commands.sh   # ui / design / test-ui / polish adapter parity
```

## Runtime hooks (Claude Code)

| Hook | Event | What it does |
|------|-------|----------------|
| `session-start.sh` | `SessionStart` | Lifecycle + routing + Reicon/WebGL reminders |
| `anti-slop-scan.sh` | `PostToolUse` Edit/Write | Warns on purple/indigo, gradients, `rounded-2xl`, Lorem, raw hex, `transition: all` |

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

- [design-lab / Design and Refine](https://github.com/0xdesign/design-plugin) — external exploration research; not bundled
- [Reicon](https://reicon.dev) — default icon library
- [Plasma](https://plasma.nusaiba.dev) — WebGL background studio (canonical study)
- [shadcn/ui](https://ui.shadcn.com/) — design tokens and components
- [Addy Osmani agent-skills](https://github.com/addyosmani/agent-skills) — multi-platform plugin + hooks pattern
- [Tailwind CSS](https://tailwindcss.com/) — utility-first CSS

## License

MIT
