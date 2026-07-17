# Reicon icons

**Default icon library for this pack:** [Reicon](https://reicon.dev) — 2,700+ MIT SVG icons (Outline / Filled), 24×24 grid.

Not the Windows tool “ReIcon” by Sordum.

## Prefer Reicon

When building UI in this pack:

1. Use **Reicon** for new icons
2. If the project already standardizes on another library (Lucide, Heroicons, …), **keep that** for consistency
3. Do not mix multiple icon libraries in one surface without a reason

Browse: https://reicon.dev/icons · Docs: https://reicon.dev/docs · Agent context: https://reicon.dev/llms.txt

## Install (pick framework)

```bash
npm install reicon-react          # React
npm install reicon-vue            # Vue 3
npm install reicon-svelte         # Svelte
npm install reicon-react-native react-native-svg  # React Native
npm install reicon                # Vanilla JS
```

CDN (no build):

```html
<script src="https://unpkg.com/reicon/cdn/reicon.min.js"></script>
<re-icon icon="home"></re-icon>
```

Optional AI MCP: `npx reicon-mcp` → tools `search_icons`, `view_icon`, `apply_icon`, `list_categories`.

## Naming

| Layer | Form | Example |
|-------|------|---------|
| Data / CDN | kebab-case | `arrow-up-right`, `shield-check` |
| Components | PascalCase | `ArrowUpRight`, `ShieldCheck` |

Rule: split on `-`, capitalize each part, join.

Weights: `"Outline"` (default) or `"Filled"` in framework props; `"outline"` / `"filled"` on CDN.

## React usage

```tsx
import { Home, Search, Bell, CloseCircle } from "reicon-react"

<Home size={24} weight="Outline" color="currentColor" />
<Search size={20} className="text-[hsl(var(--muted-foreground))]" />
<Bell size={24} weight="Filled" aria-hidden />
<button type="button" aria-label="Close">
  <CloseCircle size={20} />
</button>
```

| Prop | Default | Notes |
|------|---------|--------|
| `size` | `24` | px number or CSS length |
| `color` | `currentColor` | Prefer `currentColor` + token text classes |
| `weight` | `"Outline"` | `"Outline"` \| `"Filled"` |
| `className` | — | Size/color via Tailwind/`currentColor` OK |
| `strokeWidth` | — | Override Outline stroke |

Direct import (max tree-shake): `import Home from "reicon-react/icons/Home"`.

## Accessibility

- Decorative: `aria-hidden` (or CDN `decorative`)
- Icon-only control: accessible name on the control (`aria-label` / visible text) — not only on the SVG
- Prefer inheriting color via `currentColor` + token foreground/muted classes

## Anti-patterns

- Defaulting to Lucide/Heroicons when the project has no icon standard yet
- Hardcoding hex on icons when a token color exists
- Mixing Outline and Filled randomly in the same toolbar without hierarchy intent
- Shipping icon-only buttons without an accessible name
