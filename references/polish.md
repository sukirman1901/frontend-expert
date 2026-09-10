# Polish — reference

Pack-authored craft guidance. Skill entry: `skills/polish/SKILL.md`.
Classify numeric recipes via `references/evidence-policy.md`. Owner for radius/elevation language: `design-surfaces`.

## Surfaces

### Concentric border radius

```yaml
principle: Concentric nested radius
classification: heuristic
recommendation: outer ≈ inner + inset when nested curves share a visual center
exceptions: [pills, circles, asymmetric inset, contrasting brand shapes]
verification: [render at actual size, 1x and 2x, light and dark]
last_verified: 2026-09
```

Hand the radius *language* to `design-surfaces`. Polish only checks that nested corners do not look mechanically wrong.

```tsx
// Heuristic when padding is uniform and corners share a center
<div className="rounded-2xl p-2">
  <button className="rounded-lg">…</button>
</div>
```

### Optical alignment

If geometric center looks off (play ▶, chevrons, asymmetric Reicon glyphs), nudge with padding or `translate` — don’t “fix” with larger hit-box alone.

### Shadows vs borders

Project depth language wins. Shadows are not universally better than borders.

| Need | Prefer |
|------|--------|
| Structural boundary | Border, divider, spacing, or tone |
| Elevated temporary layer | Subtle transparent shadow + backdrop, if the project uses elevation |
| Selected/focus | Explicit state token plus a non-color cue |

If shadows are in language, keep them subtle — `anti-slop-design` forbids heavy competing stacks. Dark surfaces: white-alpha rings (`rgba(255,255,255,0.06)`) often beat slate borders.

### Image outlines (optional)

For media cards / product shots — not every image:

- Light: `outline: 1px solid rgba(0,0,0,0.1); outline-offset: -1px`
- Dark: `rgba(255,255,255,0.1)`
- Never tinted neutrals (slate/zinc) — reads as dirt

Tailwind: `outline outline-1 -outline-offset-1 outline-black/10 dark:outline-white/10`

### Minimum hit area

| Context | Target | Class |
|---------|--------|-------|
| Touch / mobile product UI | 44×44px | Recommendation |
| Dense desktop | ≥40×40px | Recommendation |
| WCAG 2.2 AA 2.5.8 | 24×24 CSS px, with listed exceptions | Standard — `accessibility` |

Extend small visibles with `::after` pseudo; **never** let two hit areas overlap — shrink before colliding.

```tsx
<button
  type="button"
  aria-label="Close"
  className="relative size-5 after:absolute after:left-1/2 after:top-1/2 after:size-11 after:-translate-x-1/2 after:-translate-y-1/2"
>
  <CloseCircle size={20} aria-hidden />
</button>
```

## Typography

### Text wrap

| Use | Property | Tailwind |
|-----|----------|----------|
| Headings / short titles | `text-wrap: balance` | `text-balance` |
| Short–medium body, captions | `text-wrap: pretty` | `text-pretty` |
| Long articles (10+ lines), code | neither | — |

`balance` is limited to short blocks by browsers — don’t put it on long paragraphs.

### Font smoothing (macOS)

Apply once on root — does not change font family:

```tsx
<html className="antialiased">
```

```css
html {
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
}
```

### Tabular numbers

Use for counters, timers, live prices, numeric table columns — not phone numbers or version strings.

```tsx
<span className="tabular-nums">{count}</span>
```

## Animations

### Interruptible vs one-shot

| | CSS transitions | Keyframes |
|---|-----------------|-----------|
| Interruptible | Yes | No |
| Use for | Hover, toggle, open/close | Enter sequences, loaders |

```css
.drawer {
  transform: translateX(-100%);
  transition: transform 200ms ease-out;
}
.drawer.open { transform: translateX(0); }
```

### Enter: split + stagger

Don’t fade one giant container. Stagger semantic chunks (~100ms is a heuristic). Combine `opacity` + light `translateY` (+ optional `blur`). Honor `prefers-reduced-motion`.

### Exit: softer than enter

Small fixed `translateY` (e.g. 4–8px) + opacity — not collapsing full height.

### Scale on press

```yaml
principle: Press scale
classification: heuristic
recommendation: scale(0.96) when press feedback is wanted
exceptions: [dense toolbars, reduced motion, brand forbids scale]
verification: [press on touch and pointer; disable if it distracts]
last_verified: 2026-09
```

```tsx
<button className="transition-transform active:scale-[0.96]">
```

### Icon cross-fade

Enter values: scale `0.25→1`, opacity `0→1`, blur `4px→0`.

- With `motion` / `framer-motion`: a tested recipe is `{ type: "spring", duration: 0.3, bounce: 0 }` — bounce `0` is a heuristic, not required.
- Without: keep both icons in DOM; absolute cross-fade with `cubic-bezier(0.2, 0, 0, 1)`

Prefer **Reicon** components (`reicon-react`) for the glyphs.

### Skip load flash

`AnimatePresence` / default-state motion: `initial={false}` so first paint doesn’t animate in.

## Performance

### Never `transition: all`

```tsx
// Good
className="transition-[transform,opacity] duration-150 ease-out"
// or
className="transition-transform duration-150"

// Bad — Tailwind `transition` ⇒ all
className="transition duration-150"
```

### `will-change` sparingly

Only `transform` / `opacity` / `filter` when you see first-frame stutter. Never `will-change: all`. Don’t pre-promote every animated node.

## Common mistakes

| Mistake | Fix |
|---------|-----|
| Same radius parent + child | Check concentric heuristic optically (`design-surfaces`) |
| Icon looks off-center | Optical nudge |
| Competing depth (border + heavy shadow) | Follow project language; one depth method |
| Jarring enter/exit | Split, stagger, soft exit |
| Numbers shift layout | `tabular-nums` |
| Heavy macOS text | Root `antialiased` |
| Animates on first load | `initial={false}` |
| `transition: all` | Name properties |
| Tiny controls | Expand hit area without overlap |
| Harsh `scale(0.9)` press | Try `0.96`, or disable scale |
| Multiple `h1` / skipped levels | One page title; sequential ladder (`design-direction`) |
| Desktop-only polish on phone | Full-width CTA <768, safe-area, thumb zone (`responsive`) |

## Mobile craft

- Prefer primary actions mid/lower on long phone screens; sticky bottom bar for long forms when submit is far
- Safe area: `padding` with `env(safe-area-inset-*)` on sticky topbar, drawers, bottom CTA bars
- Pair with `references/responsive.md` (Auto Layout Fill → full-width buttons)

## Typography feel

- One `h1` per page; sequential headings; token type roles
- `text-wrap: balance` on headings; `pretty` on short body
- Ship gate: Typography ladder in `skills/design-direction/SKILL.md`
