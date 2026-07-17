# Frontend Expert — pillars

Suite map for [frontend-expert](https://github.com/sukirman1901/frontend-expert). Skills stay **flat** under `skills/` for discovery; this doc is the mental model.

## Pillars

| Pillar | Skills | Role |
|--------|--------|------|
| **UI Quality** (default) | `frontend-judgment`, `design-tokens`, `ui-components`, `anti-ai-slop`, `ui-feel`, `accessibility`, `frontend-testing`, `ui-quality-loop`, `webgl`, `monitoring`, `motion`, `web-performance`, `design-fidelity`, `fe-devtools` | Visual craft, tokens, polish, fidelity, tooling |
| **Responsive** (MUST) | `responsive-ui` | All devices 320→1440+ |
| **Ship FE** | `app-shell-routing`, `data-fetching`, `forms-validation` | Shell, async UI, forms |
| **Depth** | `fe-architecture`, `fe-seo` | Structure, technical SEO |

## Default build chain

```text
frontend-judgment*
  → design-tokens
  → app-shell-routing?     # if multi-route / shell / dashboard / settings
  → data-fetching?         # if remote data
  → forms-validation?      # if forms
  → ui-components
  → responsive-ui          # MUST for layout UI
  → motion                 # light shell/section defaults
  → anti-ai-slop → ui-feel → accessibility
  → (+ webgl | fe-seo | fe-architecture | design-fidelity | fe-devtools as needed)
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
