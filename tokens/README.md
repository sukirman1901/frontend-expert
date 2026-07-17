# Token presets

Curated CSS design tokens for this pack. Prefer the **project’s existing** design system when one exists (`design-tokens` custom mode).

## How agents choose

Walk the **decision tree** in `references/token-preset-scoring.md` (first match wins):

1. Custom / existing theme / keep palette → project system (no score)
2. `--token` / named preset → that file (no score)
3. Explicit Plasma brand → `plasma-landing.css` (hard-gate)
4. Else → **score** presets (max 24) and emit Token score block

## Quick pick

| Preset | Format | Base | Primary | Radius | Affinity hint |
|--------|--------|------|---------|--------|----------|
| `neutral-oklch.css` | OKLCH | neutral | mono | 0 | Modern minimal / sharp |
| `neutral-oklch-rounded.css` | OKLCH | neutral | mono | 0.625rem | Mono + soft radius |
| `stone-oklch.css` | OKLCH | warm stone | mono warm | 0 | Editorial / warm minimal |
| `plasma-landing.css` | hex / rgba | zinc-950 | `#6C5CE7` | 14px | [Plasma](https://plasma.nusaiba.dev) marketing |
| `stone-emerald.css` | HSL channels | stone | emerald | 0 | Clean, minimal |
| `zinc-blue.css` | HSL | zinc | blue | 0.5rem | Dashboards |
| `neutral-purple.css` | HSL | neutral | violet | 0.75rem | Creative portfolios |
| `slate-cyan.css` | HSL | slate | cyan | 1rem | Data-heavy UI |
| `rose-amber.css` | HSL | rose | amber | 1.5rem | Warm products |

## Usage: HSL vs full color

**HSL presets** (`stone-emerald`, `zinc-blue`, `neutral-purple`, `slate-cyan`, `rose-amber`) store channels without `hsl()`:

```css
color: hsl(var(--foreground));
background: hsl(var(--primary));
border-radius: var(--radius);
```

**OKLCH / hex presets** (`neutral-oklch*`, `stone-oklch`, `plasma-landing`) store full colors:

```css
color: var(--foreground);
background: var(--primary);
/* do NOT wrap in hsl() */
```

`plasma-landing` also exposes native names: `var(--bg-main)`, `var(--primary-color)`, …

## Import examples

### Global CSS

```css
@import "./tokens/stone-emerald.css";
```

### Next.js / app layout

```tsx
import "@/styles/tokens/neutral-oklch.css"
```

### Tailwind + shadcn-style

Map utilities to the same CSS variables your components already use (`bg-background`, `text-primary`, …). Presets follow the common shadcn semantic set: `--background`, `--foreground`, `--primary`, `--muted`, `--destructive`, `--radius`, sidebar/chart where present.

## Light / dark

- Most presets define `:root` + `.dark` (or equivalent)
- `plasma-landing`: dark default; light via `body.light-theme` or `.light`

## Agent rules

1. Walk the decision tree in `references/token-preset-scoring.md` (do not jump to affinity hints)
2. Custom → style-infer from 2–3 real components
3. Score path → emit ranked scores; never invent purple without brand cue
4. Never invent raw purple/indigo hex outside the chosen token source
5. Spacing still on `0.25rem` scale even when colors come from tokens

Skill: `design-tokens`. Tree + scoring: `references/token-preset-scoring.md`. Theory: `references/ux-foundations.md`.
