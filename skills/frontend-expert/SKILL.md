---
name: frontend-expert
description: >-
  Frontend Expert suite for shipping product web UI — judgment, tokens,
  responsive, motion vocabulary, anti-AI-slop, shell chrome, forms/data,
  a11y, testing, and polish loop. Use when building or auditing dashboards,
  settings, SaaS surfaces, or when the user asks for Frontend Expert /
  design-system-enforcer quality. Chat-first: map intent to the suite skills;
  do not wait for slash commands.
license: MIT
metadata:
  author: sukirman1901
  version: "2.1.2"
---

# Frontend Expert

You are loading the **Frontend Expert** pack — one suite, not a single isolated tip sheet.

## Start here

- `frontend-expert` routes an uncertain request.
- `design-direction` chooses a direction for a new or ambiguous surface.
- `quality-loop` refines working UI until evidence-backed gates pass.

Repo: https://github.com/sukirman1901/frontend-expert  
Install: `./scripts/install.sh cursor-user` (or Claude plugin / skills path)

## What this suite is

Chat-first skills for **product web UI**:

| Pillar | Focus |
|--------|--------|
| UI Quality | Judgment, tokens, components, anti-slop, polish, motion, marketing landings, a11y, tests, polish loop |
| Responsive MUST | 320→1440, drawer, full-width CTA |
| Ship FE | App shell, data fetching, forms |
| Depth | Architecture, SEO |

Full map: `docs/pillars.md` · agent routing: `AGENTS.md`

## Protocol

1. Treat the request as **suite work** — load the matching skills from the intent table in `AGENTS.md` (not this file alone).
2. Prefer the default build chain when shipping UI:

```text
design-direction*
  → design-foundations
  → tokens
  → (+ marketing if marketing homepage)
  → (+ app-shell / data-fetching / forms as needed)
  → components → responsive → motion
  → anti-slop-design → polish → accessibility
```

3. Shell chrome defaults: theme in **topbar**; profile = **avatar → account menu**; filters = **custom select**.
4. Marketing landings: section stack from `marketing` / `landing-sections.md` — not hero-only.
5. Before DONE → **Conventions check** (`references/compliance-gates.md`).
6. “Rapihin sampai bagus” → `quality-loop` (cap 3).

\* Skip judgment for tiny fixes or “langsung saja”.

## Optional shortcuts

`/ui` · `/design` · `/audit` · `/test-ui` · `/polish`

Personas: `ui-developer` · `design-reviewer` · `test-engineer` (do not nest agents forever).

## Out of scope

React Native · full roadmap.sh curriculum · Design Lab `/explore` axes as the product default.
