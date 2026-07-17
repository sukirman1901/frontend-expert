# Frontend lifecycle (A → Z)

How a senior frontend engineer actually works — **iterative**, not one-shot.  
Pack mapping for agents. Theory depth: `ux-foundations.md`. Exploration: `design-axes.md`.

## The loop

```text
1 PAHAMI ──▶ 2 PUTUSKAN ──▶ 3 SISTEM ──▶ 4 BANGUN ──▶ 5 HALUSKAN
                                                      │
6 A11Y ◀──────────────────────────────────────────────┘
   │
7 BUKTIKAN ──▶ 8 AUDIT ──▶ 9 PERBAIKI ──▶ (cap) ──▶ 10 SHIP
                  │              │
                  └──────────────┘  repeat Critical/High only
```

Default quality-loop cap in this pack: **3** audit→fix cycles (`ui-quality-loop` / `/polish`).

## Stages → pack

| # | Stage | Do | Skill / command |
|---|--------|-----|-----------------|
| 1 | **Pahami** | Job user, constraint, existing UI vs greenfield | Chat; read `DESIGN_MEMORY.md` if present |
| 2 | **Putuskan** | 2–3 approaches on **distinct axes**; wait for pick | `frontend-judgment` |
| 3 | **Sistem** | Walk token **decision tree**: custom / explicit / Plasma hard-gate / score (`token-preset-scoring.md`); style-infer when custom | `design-tokens` |
| 4 | **Bangun** | Composition, loading/empty/error; icons via Reicon; shell/data/forms when needed | `ui-components` (+ `app-shell-routing` / `data-fetching` / `forms-validation`) |
| — | **Responsive** | All devices 320→1440 — **MUST** | `responsive-ui` |
| 5 | **Haluskan** | Kill AI slop → micro craft (radius, press, type wrap, …) | `anti-ai-slop` → `ui-feel` |
| 6 | **A11y** | Keyboard, labels, contrast, semantics | `accessibility` |
| — | **Motion** | Shell light defaults; marketing → pick families/patterns from `motion-families.md` and **hand-roll** | `motion` |
| — | **WebGL bg** | Plasma Studio shaders | `webgl` |
| — | **SEO** | Public/meta routes | `fe-seo` |
| — | **Architecture** | Folders / state boundaries | `fe-architecture` |
| — | **Monitoring** | Errors / CWV / analytics in prod | `monitoring` |
| 7 | **Buktikan** | Critical path tests — or **waiver** if no runner | `frontend-testing` / `/test-ui` |
| 8 | **Audit** | Honest scorecard (no fabricated visuals) | `design-reviewer` / `/design` `/audit` |
| 9 | **Perbaiki** | Critical/High only; re-test what you changed | `ui-developer` inside loop |
| 10 | **Ship** | Done or stop at cap with remaining Medium/Low | `/polish` final report |

One-shot build (`/ui` or “bikin halaman”): stages **1→6** (judgment only if non-trivial).  
“Rapihin detail / feels off”: stage **5** only (`ui-feel`).  
“Sampai bagus / lulus audit”: stages **7→9** looping via `ui-quality-loop`.

## Routing cheat sheet

| User intent | Path |
|-------------|------|
| New / vague UI | Judgment → build chain (1→6) |
| Tiny clear fix | Skip judgment → touch only what’s needed |
| Feels off / rapihin detail | `ui-feel` one pass |
| Rapihin sampai bagus | `ui-quality-loop` (max 3) |
| Audit saja | `/design` — no fix loop |
| Shader background | `references/webgl.md` (Plasma Studio) |

## Anti-patterns in process

- Coding blank-canvas UI before a direction is set (skipping judgment)  
- Picking a pack preset from affinity-hint tables without the decision tree  
- Inventing a purple token file to rubber-stamp AI-slop purple  
- Full polish loop for a one-line copy tweak  
- Infinite audit cycles (always cap)  
- Inventing a test stack just to pass the Tests gate (waive instead)  
- Fabricating visual scores without tokens/screenshots  
- Agents invoking other agents instead of session orchestration  

## Related

- Loop controller: `skills/ui-quality-loop/SKILL.md`  
- Intent map: `AGENTS.md`  
- Layers: `docs/pack-layers.md`  
- Last workflow audit: `docs/AUDIT.md`
