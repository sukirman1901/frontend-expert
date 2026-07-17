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
  version: "1.0.0"
---

# Frontend Expert

You are loading the **Frontend Expert** pack — one suite, not a single isolated tip sheet.

Repo: https://github.com/sukirman1901/frontend-expert  
Install: `./scripts/install.sh cursor-user` (or Claude plugin / skills path)

## What this suite is

Chat-first skills for **product web UI**:

| Pillar | Focus |
|--------|--------|
| UI Quality | Judgment, tokens, components, anti-slop, ui-feel, motion, marketing landings, a11y, tests, polish loop |
| Responsive MUST | 320→1440, drawer, full-width CTA |
| Ship FE | App shell, data fetching, forms |
| Depth | Architecture, SEO |

Full map: `docs/pillars.md` · agent routing: `AGENTS.md`

## Protocol

1. Treat the request as **suite work** — load the matching skills from the intent table in `AGENTS.md` (not this file alone).
2. Prefer the default build chain when shipping UI:

```text
frontend-judgment*
  → design-tokens
  → (+ marketing-landing if marketing homepage)
  → (+ app-shell-routing / data-fetching / forms-validation as needed)
  → ui-components → responsive-ui → motion
  → anti-ai-slop → ui-feel → accessibility
```

3. Shell chrome defaults: theme in **topbar**; profile = **avatar → account menu**; filters = **custom select**.
4. Marketing landings: section stack from `marketing-landing` / `landing-sections.md` — not hero-only.
5. Before DONE → **Conventions check** (`references/compliance-gates.md`).
6. “Rapihin sampai bagus” → `ui-quality-loop` (cap 3).

\* Skip judgment for tiny fixes or “langsung saja”.

## Optional shortcuts

`/ui` · `/design` · `/audit` · `/test-ui` · `/polish`

Personas: `ui-developer` · `design-reviewer` · `test-engineer` (do not nest agents forever).

## Out of scope

React Native · full roadmap.sh curriculum · Design Lab `/explore` axes as the product default.
