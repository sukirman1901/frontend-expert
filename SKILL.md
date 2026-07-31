---
name: frontend-expert
description: >-
  Chat-first frontend UI quality suite — 22 skills across UI Quality, Responsive,
  Ship FE, and Depth pillars. Token decision tree, compliance gates, anti-AI-slop,
  motion vocabulary (12 families), marketing landing recipes, and quality loop.
  Auto-loads on any UI/build/audit/polish request — no slash commands needed.
---

# Frontend Expert

**Chat-first frontend UI quality suite** for shipping polished, responsive, accessible web interfaces.

## What this pack does

This is **not** a single skill — it's a **suite of 22 skills** organized into pillars that auto-load based on what you ask. You never need to type a slash command; just describe what you want to build or fix.

## Pillars

| Pillar | Skills | When it loads |
|--------|--------|---------------|
| **UI Quality** | judgment, tokens, components, anti-slop, ui-feel, a11y, testing, quality-loop, motion, webgl, monitoring, marketing-landing, design-fidelity, fe-devtools | Any UI build, audit, or polish |
| **Responsive** (MUST) | responsive-ui | Every layout — 320/768/1024/1440 verified |
| **Ship FE** | app-shell-routing, data-fetching, forms-validation | Shell/nav, API data, forms |
| **Depth** | fe-architecture, fe-seo | Folder structure, meta/OG/SEO |

Full pillar map: `docs/pillars.md`.

## How it works

1. **You ask** — "bikin dashboard", "landing page", "rapihin UI", "audit design"
2. **Intent map** matches your request → loads the right skills in order
3. **Skills chain** — judgment → tokens → components → responsive → motion → anti-slop → ui-feel → a11y
4. **Compliance gates** — before shipping, a conventions check verifies tokens, icons, responsive, hierarchy, typography, motion, shell, landing, a11y, and states

See `AGENTS.md` for the full intent map.

## Key systems

### Token decision tree
Colors, spacing, and radius come from a **decision tree** — not vibes. Custom project system → explicit preset → Plasma hard-gate → scored preset (max 24 points). 9 pre-built CSS token files in `tokens/`.

Detail: `references/token-preset-scoring.md`.

### Anti-AI slop
Detects and fixes recognizable AI aesthetic patterns: purple/indigo defaults, Lorem ipsum, gradient spam, rounded-everything, shadow-heavy cards, hero-only landings.

Detail: `references/anti-patterns.md`.

### Motion vocabulary
12 families, 144 named patterns. Choose by name, hand-roll implementation. No third-party registry installs by default. Shell gets light defaults; marketing picks ≤2 families.

Detail: `references/motion-families.md`.

### Compliance gates
Ship checklist covering 12+ dimensions. Every UI build reports a conventions check before DONE.

Detail: `references/compliance-gates.md`.

### Quality loop
BUILD → TEST → AUDIT → FIX cycle with max 3 iterations. Runs when you say "sampai bagus" or `/polish`.

Skill: `skills/ui-quality-loop`.

## Vocabulary skills

### Design vocabulary
Reverse-lookup for UI/design terms — describe something loosely and get the proper name. "Floating card over blur" → Glassmorphism. "Menu from the side" → Drawer/Sheet.

Skill: `skills/design-vocabulary`.

### Engineering vocabulary
Reverse-lookup for frontend engineering patterns — "cache so it doesn't re-fetch" → SWR/stale-while-revalidate. "Render only visible list items" → Virtualization.

Skill: `skills/engineering-vocabulary`.

## Quick links

- Intent map + hard rules: `AGENTS.md`
- Pillar map: `docs/pillars.md`
- Architecture layers: `docs/pack-layers.md`
- All references: `references/README.md`
- Token presets: `tokens/README.md`
- Example output: `example/index.html`

## Slash commands (optional — chat-first by default)

| Command | Purpose |
|---------|---------|
| `/ui` | Build UI (auto-loads build chain) |
| `/design` or `/audit` | Audit existing UI |
| `/test-ui` | Test with a11y + devtools |
| `/polish` | Quality loop until gates pass |
