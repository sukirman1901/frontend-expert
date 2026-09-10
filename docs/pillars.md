# Frontend Expert — pillars

Suite map for [frontend-expert](https://github.com/sukirman1901/frontend-expert). Skills stay **flat** under `skills/` for discovery; this doc is the mental model.

The suite has exactly 31 canonical skills. Version 2.2 adds `anti-slop-code` after `components` and beside `anti-slop-design`.

## Pillars

| Pillar | Skills | Role |
|--------|--------|------|
| **Suite root** | `frontend-expert`, **`skill-authoring`** | Catalog / install entry — routes into the pillars below; skill authoring |
| **UI Quality** (default) | `design-direction`, `design-foundations`, `tokens`, `design-typography`, `design-color`, `design-surfaces`, `content-design`, `components`, `anti-slop-design`, `anti-slop-code`, `polish`, `accessibility`, `testing`, `quality-loop`, `webgl`, `monitoring`, `motion` (+ `motion-families` vocabulary), `performance`, `fidelity`, `devtools`, **`marketing`**, **`design-vocabulary`** | Visual craft, structure, type, color, surfaces, product copy, generated-code tells, tokens, polish, fidelity, tooling, motion, marketing IA |
| **Responsive** (MUST) | `responsive` | All devices 320→1440+ |
| **Ship FE** | `app-shell`, `data-fetching`, `forms` | Shell, async UI, forms |
| **Depth** | `architecture`, `seo`, **`engineering-vocabulary`** | Structure, technical SEO, engineering term lookup |

## Default build chain

```text
design-direction*
  → design-foundations     # structural layout; skip isolated color/type/motion/polish
  → tokens
  → design-typography? / design-color? / design-surfaces? / content-design?
  → marketing?     # if marketing homepage / landing
  → app-shell?     # if multi-route / shell / dashboard / settings
  → data-fetching?         # if remote data
  → forms?      # if forms
  → components
  → anti-slop-code
  → responsive          # MUST for layout UI
  → motion                 # light shell/section defaults; marketing hand-roll families
  → anti-slop-design → polish → accessibility
  → (+ webgl | seo | architecture | fidelity | devtools as needed)
```

## Out of scope (honest)

- React Native / Expo
- Full roadmap.sh (Git, CS theory, raw HTTP specs)
- Backend / DevOps
- Browser Design Lab `/explore` (opt-in later)

## Related

- Layers: [pack-layers.md](./pack-layers.md)
- Intent map: [AGENTS.md](../AGENTS.md)
- Lifecycle: [../references/fe-lifecycle.md](../references/fe-lifecycle.md)
