# Responsive UI (all devices)

Mandatory for product UI. Used by: `responsive-ui`, `ui-components`, `/ui`, `/design`, `/polish`.  
Reference demo: `test/` settings shell.

## Canonical breakpoints

Verify **mobile-first** at least:

| Width | Role |
|-------|------|
| **320** | Narrow phone (floor) |
| **390 / 430** | Common phones (optional smoke) |
| **768** | Tablet |
| **1024** | Small laptop / large tablet |
| **1440** | Desktop |

Base styles = phone. Enhance with `min-width` media queries (or container queries when layout is component-scoped).

## Hard rules

1. **No horizontal page scroll** at 320–1440 (except intentional code blocks / media with internal scroll)
2. **Tap targets ≥ 44×44px** for primary controls on touch
3. **Nav / forms / primary CTAs usable on phone** — not desktop-only chrome
4. **Primary actions full-width below 768** — form submit, toolbar primary, row/plan CTAs
5. **Adapt, don’t delete** — if a column/table hides on small screens, provide a stacked/card/alternative view
6. **Fluid images/media** — `max-width: 100%`; avoid fixed widths that blow out the viewport
7. **Typography** — readable line length; form inputs **≥16px** on mobile (avoid iOS focus zoom)
8. **Safe areas** — respect `env(safe-area-inset-*)` on sticky topbar + drawers

## Figma Auto Layout ↔ CSS

When a Figma frame uses Auto Layout (or the user says “Fill / Hug”), map sizing explicitly — do not guess desktop fixed widths on mobile.

| Figma Auto Layout | CSS / layout |
|-------------------|--------------|
| **Fill** container | `width: 100%` / `flex: 1` / `align-self: stretch` / `flex-grow: 1` |
| **Hug** contents | `width: fit-content` / `flex: 0 0 auto` / `align-self: flex-start` |
| **Fixed** | Explicit `width` / `height` (token or px from spec) |
| **Gap** | `gap` (prefer spacing token) |
| **Padding** | `padding` (token scale) |
| **Horizontal** direction | `flex-direction: row` (+ `flex-wrap` when needed) |
| **Vertical** direction | `flex-direction: column` |
| **Space between** | `justify-content: space-between` |
| Primary CTA row on phone | **Fill** = full-width button MUST below 768 (same as Hard rule 4) |

**Rule of thumb:** In a Figma auto-layout column of actions, Fill children become `width: 100%` stacked buttons on mobile. Hug children stay compact on desktop toolbars.

## Patterns

| Desktop pattern | Small-screen adapt |
|-----------------|-------------------|
| Wide data table | Card list / stacked rows / horizontal scroll *inside* a contained region with affordance |
| Multi-column dashboard | Single column stack; priority order top→bottom |
| Side nav always open | **Overlay drawer + backdrop** (not push-down); burger ↔ close |
| Account / profile in header | Keep avatar control; may hide name/email/chevron text only |
| Dense topbar utilities | Hide secondary (e.g. search); keep bell + avatar |
| Inline primary + secondary buttons | **Stack**; primary `width: 100%` |
| Hover menus | Tap-open + focus visible |
| Dense toolbars | Overflow menu / icon+label wrap; primary full-width |

### Buttons on mobile (concrete)

```css
@media (max-width: 767px) {
  .form__actions {
    flex-direction: column;
    align-items: stretch;
  }
  .form__actions .btn--primary,
  .toolbar .btn--primary,
  .plan__row .btn,
  .row .btn {
    width: 100%;
  }
}
```

At ≥768, restore auto width so desktop chrome stays compact.

### Mobile drawer requirements

1. Nav off-canvas (`transform` / fixed), not in-flow expand under header  
2. Drawer header: brand/label + close control  
3. Backdrop click + Escape closes  
4. Body scroll lock while open  
5. `matchMedia` / resize clears open state when leaving mobile  

### Mobile feel helpers (pair with `ui-feel`)

- `-webkit-tap-highlight-color: transparent`
- `touch-action: manipulation`
- Press feedback (`scale` ~0.96–0.98) on icon buttons / nav rows
- Sticky topbar with subtle blur OK; don’t add heavy shadows

## Conventions line

```markdown
- Responsive: 320/768/1024/1440 checked | waiver: …
```

Note full-width CTAs + drawer when auditing greenfield. Missing evidence → **High**.

## Anti-patterns

- Desktop-first CSS with `max-width` hacks only
- `width: 1200px` fixed shells
- Content that exists only at `lg+` with no mobile equivalent
- Tiny hit targets (`h-6 w-6` icon buttons without padding)
- Primary CTA left-aligned tiny width on a 320px form
- Assuming hover for delete/edit
- Loud left-accent bar as the only “selected” affordance (`anti-ai-slop`)

## Related

- Components: `ui-components`, `references/component-patterns.md`
- Shell: `app-shell-routing`
- A11y overlap: `accessibility` (focus, labels)
- Feel: `ui-feel` (press states still apply on touch)
