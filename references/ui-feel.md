# UI Feel — reference

Craft details adapted from [make-interfaces-feel-better](https://github.com/jakubkrehel/make-interfaces-feel-better) (MIT). Skill entry: `skills/ui-feel/SKILL.md`.

## Surfaces

### Concentric border radius

`outerRadius = innerRadius + padding`.

```tsx
// Padding 8px, inner radius 8px → outer 16px
<div className="rounded-2xl p-2">       {/* 16px */}
  <button className="rounded-lg">…</button> {/* 8px */}
</div>
```

### Optical alignment

If geometric center looks off (play ▶, chevrons, asymmetric Reicon glyphs), nudge with padding or `translate` — don’t “fix” with larger hit-box alone.

### Shadows over hard borders

Prefer layered transparent `box-shadow` for section depth. Keep subtle — pack `anti-ai-slop` forbids heavy competing shadows.

```css
.card {
  box-shadow:
    0 0 0 1px rgba(0, 0, 0, 0.04),
    0 1px 2px rgba(0, 0, 0, 0.06),
    0 4px 12px rgba(0, 0, 0, 0.04);
}
```

Dark surfaces: use white alpha rings (`rgba(255,255,255,0.06)`) instead of slate borders that muddy the edge.

### Image outlines (optional)

For media cards / product shots — not every image:

- Light: `outline: 1px solid rgba(0,0,0,0.1); outline-offset: -1px`
- Dark: `rgba(255,255,255,0.1)`
- Never tinted neutrals (slate/zinc) — reads as dirt

Tailwind: `outline outline-1 -outline-offset-1 outline-black/10 dark:outline-white/10`

### Minimum hit area

| Context | Target |
|---------|--------|
| Touch / mobile | 44×44px |
| Dense desktop | ≥40×40px |

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

Don’t fade one giant container. Stagger semantic chunks ~100ms (words in a title ~80ms). Combine `opacity` + light `translateY` (+ optional `blur`).

### Exit: softer than enter

Small fixed `translateY` (e.g. 4–8px) + opacity — not collapsing full height.

### Scale on press

Always `scale(0.96)` — never below `0.95`. Offer a way to disable on dense toolbars.

```tsx
<button className="transition-transform active:scale-[0.96]">
```

### Icon cross-fade

Enter values: scale `0.25→1`, opacity `0→1`, blur `4px→0`.

- With `motion` / `framer-motion`: `transition: { type: "spring", duration: 0.3, bounce: 0 }`
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
| Same radius parent + child | `outer = inner + padding` |
| Icon looks off-center | Optical nudge |
| Hard section borders everywhere | Subtle transparent shadow stack |
| Jarring enter/exit | Split, stagger, soft exit |
| Numbers shift layout | `tabular-nums` |
| Heavy macOS text | Root `antialiased` |
| Animates on first load | `initial={false}` |
| `transition: all` | Name properties |
| Tiny controls | Expand hit area without overlap |
| `scale(0.9)` press | Raise to `0.96` |
