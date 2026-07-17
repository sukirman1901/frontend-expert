# Compliance gates (ship checklist)

Skills are **instructions**, not runtime injectors. Agents must **self-check** before marking UI done. If a gate fails, fix or write an explicit **waiver** (one line why).

Used by: always-on rules, `ui-developer`, `ui-components`, `/ui`, `/polish` build step.

## Before DONE on any UI build

Report this block (fill every line):

```markdown
## Conventions check
- Tokens: <preset path | project system | waiver>
- Icons: <Reicon (package/CDN) | existing lib: … | waiver: text-only UI>
- States: loading / empty / error covered? <yes | n/a | waiver>
- A11y: labels + focus noted? <yes | waiver>
- WebGL: <Plasma.init … | n/a | waiver: used Three because …>
- Motion: <none | skill motion used | waiver>
```

## Hard defaults (must not silently skip)

| Area | Default | Skip only if |
|------|---------|--------------|
| **Icons** | [Reicon](https://reicon.dev) on nav items, toolbars, empty states, icon buttons | Project already standardizes Lucide/etc., **or** intentional text-only UI (state waiver) |
| **Vanilla HTML** | CDN: `unpkg.com/reicon/cdn/reicon.min.js` + `<re-icon icon="…">` | Same as above |
| **React/Vue/Svelte** | `reicon-react` / `reicon-vue` / `reicon-svelte` | Same as above |
| **WebGL / shader / plasma / canvas bg** | Load skill `webgl` → Plasma Studio / `Plasma.init` | User explicitly wants Three.js/R3F scene graph |
| **Tokens** | Project system, else `tokens/*.css` | — |
| **Slop** | No purple/indigo defaults, no Lorem, no `transition: all` | Brand token already is purple (e.g. `plasma-landing`) |

## Icon placement expectations

When building settings/dashboards/nav/toolbars, **include icons by default** (Reicon), not text-only rows — unless the user asked for text-only or a minimal prose layout.

Examples: section nav → icon + label; empty state → icon; icon-only button → `aria-label` + Reicon glyph.

## WebGL expectations

On “background animasi / shader / plasma / webgl”:

1. Load `webgl` (do not invent a random Three.js hero)
2. Prefer Studio export + `Plasma.init`
3. `destroy()` on unmount; reduced-motion fallback
4. Note in Conventions check

## Why this exists

Pack skills can be installed and still ignored (e.g. `test/` settings UI shipped with zero icons). Gates + required report lines raise compliance without a browser Design Lab.
