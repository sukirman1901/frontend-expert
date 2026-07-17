# Compliance gates (ship checklist)

Skills are **instructions**, not runtime injectors. Agents must **self-check** before marking UI done. If a gate fails, fix or write an explicit **waiver** (one line why).

Used by: always-on rules, `ui-developer`, `ui-components`, `/ui`, `/polish` build step.

## Before DONE on any UI build

Report this block (fill every line):

```markdown
## Conventions check
- Tokens: <preset (score n/24 | explicit | hard-gate) | project system | waiver>
- Icons: <Reicon (package/CDN) | existing lib: … | waiver: text-only UI>
- States: loading / empty / error covered? <yes | n/a | waiver>
- Responsive: 320/768/1024/1440 checked | full-width CTA <768 | waiver: …
- Hierarchy: pass | fails: … | waiver: …
- Typography: one h1 + ladder | fails: … | waiver: …
- A11y: labels + focus noted? <yes | waiver>
- WebGL: <Plasma.init … | n/a | waiver: used Three because …>
- Motion: <light shell | families: … | patterns: … | none (waiver)>
```

When using a **scored** pack preset, include `(score n/24)`. Use `(explicit)` or `(hard-gate)` when those branches apply.

## Hard defaults (must not silently skip)

| Area | Default | Skip only if |
|------|---------|--------------|
| **Icons** | [Reicon](https://reicon.dev) on nav items, toolbars, empty states, icon buttons | Project already standardizes Lucide/etc., **or** intentional text-only UI (state waiver) |
| **Vanilla HTML** | CDN: `unpkg.com/reicon/cdn/reicon.min.js` + `<re-icon icon="…">` | Same as above |
| **React/Vue/Svelte** | `reicon-react` / `reicon-vue` / `reicon-svelte` | Same as above |
| **Responsive** | Load `responsive-ui` — verify 320 / 768 / 1024 / 1440; drawer+backdrop for side nav; **primary CTAs `width: 100%` below 768**; no page horizontal scroll; adapt tables/nav | Explicit desktop-only waiver |
| **Hierarchy** | One primary focus + one primary CTA; weight/contrast before decoration (`frontend-judgment` Hierarchy pass) | Tiny copy-only tweak |
| **Typography** | ≤2 families; one h1/page; sequential ladder; token type roles | Waiver: intentional marketing exception (state why) |
| **Shell chrome** | Logo + utilities + profile (`app-shell-routing`) on dashboard/settings | Waiver: minimal marketing page |
| **Motion** | Light defaults on shell/multi-section (`motion`); marketing builds name ≤2 families + patterns from `motion-families.md` and **hand-roll** — do not default to third-party registry install | User forbids animation / reduced-motion only |
| **WebGL / shader / plasma / canvas bg** | Load skill `webgl` → Plasma Studio / `Plasma.init` | User explicitly wants Three.js/R3F scene graph |
| **Tokens** | Project system, else full tree: custom → explicit → Plasma hard-gate → score (`token-preset-scoring.md`) | Waiver only |
| **Slop** | No purple/indigo defaults, no Lorem, no `transition: all` | Brand token already is purple (e.g. `plasma-landing`) |

## Icon placement expectations

When building settings/dashboards/nav/toolbars, **include icons by default** (Reicon), not text-only rows — unless the user asked for text-only or a minimal prose layout.

Examples: section nav → icon + label; empty state → icon; icon-only button → `aria-label` + Reicon glyph.

## Responsive expectations

On any layout/page:

1. Load `responsive-ui` (or apply `references/responsive.md`)
2. Mobile-first; check 320 · 768 · 1024 · 1440
3. Side nav / tables must adapt — not desktop-only
4. **Primary CTAs / form submit / toolbar primary → full width below 768** (Figma Fill → `width: 100%`)
5. Note Responsive line in Conventions check (include full-width CTA evidence)

Greenfield missing Responsive evidence → **High** finding (design-reviewer).  
Tiny primary CTA on phone (desktop hug width) → **High**, Area **Responsive**.

## Hierarchy & typography expectations

1. Run Hierarchy pass + Typography ladder (`frontend-judgment`) before DONE on blank-canvas / layout polish
2. One primary focus + one primary CTA; one h1 per page; sequential heading levels
3. Note Hierarchy + Typography lines in Conventions check

Missing hierarchy/type on greenfield layout → **High** (Visual Hierarchy / Typography).

## WebGL expectations

On “background animasi / shader / plasma / webgl”:

1. Load `webgl` (do not invent a random Three.js hero)
2. Prefer Studio export + `Plasma.init`
3. `destroy()` on unmount; reduced-motion fallback
4. Note in Conventions check

## Why this exists

Pack skills can be installed and still ignored (e.g. a settings UI shipped with zero icons). Gates + required report lines raise compliance without a browser Design Lab.
