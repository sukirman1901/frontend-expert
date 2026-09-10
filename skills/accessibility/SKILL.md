---
name: accessibility
description: >-
  Enforce WCAG 2.2 AA by default (keyboard, ARIA, focus, contrast, semantics). Use for
  accessibility work, pre-ship UI checks, and as a light pass on every UI build
  or design review — including "a11y", "keyboard", "screen reader", or shipping
  user-facing changes, without requiring a slash command.
---

# Accessibility

## Overview

New user-facing UI targets WCAG 2.2 AA by default. Honor an explicit legal/project target such as WCAG 2.1, while documenting the target and preserving newer compatible safeguards where possible.

## When to Use

- `/design` audits
- Light check during `/ui` builds
- Dedicated accessibility fixes

## Workflow

### 1. Keyboard

- All interactive elements focusable (native `<button>`, `<a>`, or `tabIndex={0}` + key handler)
- Logical focus order; visible focus indicators (`focus-visible` outline)
- Focus trapped in modals; restore to trigger on close
- Skip link to main content when long nav exists
- Focus is not obscured by sticky/fixed UI
- Pointer drag interactions have a non-drag alternative
- Authentication does not require cognitive-function tests without an accessible alternative

**Recipe — focus trap (vanilla):**
```js
// Trap focus inside a modal
function trapFocus(modal) {
  const focusable = modal.querySelectorAll(
    'a[href], button:not([disabled]), input, select, textarea, [tabindex]:not([tabindex="-1"])'
  );
  const first = focusable[0];
  const last = focusable[focusable.length - 1];
  
  modal.addEventListener('keydown', (e) => {
    if (e.key !== 'Tab') return;
    if (e.shiftKey && document.activeElement === first) {
      e.preventDefault();
      last.focus();
    } else if (!e.shiftKey && document.activeElement === last) {
      e.preventDefault();
      first.focus();
    }
  });
  first?.focus();
}
```

**Recipe — skip link:**
```html
<a href="#main-content" class="skip-link">Skip to main content</a>
<!-- In CSS: .skip-link { position: absolute; top: -100%; }
     .skip-link:focus { top: 0; z-index: 9999; } -->
<main id="main-content">...</main>
```

### 2. ARIA / labels

- Form inputs have visible labels (`<label for="id">` or wrapping `<label>`)
- Icon-only buttons have `aria-label`
- Toggle states use `aria-pressed`, `aria-expanded`, `aria-selected`
- Loading announced via `aria-busy="true"` on the loading container
- Live regions (`aria-live="polite"`) for dynamic content updates (toasts, search results count)

**Recipe — live region for dynamic count:**
```html
<div aria-live="polite" aria-atomic="true" class="sr-only">
  <!-- JS updates this when results change -->
  <span id="result-count">12 results found</span>
</div>
```

**Recipe — icon button with Reicon:**
```html
<button type="button" aria-label="Close dialog">
  <re-icon icon="close-circle" size="20" aria-hidden="true"></re-icon>
</button>
```

### 3. Color & contrast

- Normal text ≥ 4.5:1 contrast ratio
- Large text (18px+ or 14px+ bold) ≥ 3:1
- Interactive focus indicators ≥ 3:1 against adjacent colors
- Do not rely on color alone for state — add icon, text, or pattern

**Decision tree — contrast checking:**
```
Is it text?
  YES → Normal text: 4.5:1 | Large text: 3:1
  NO  → Is it a UI component or graphic?
         YES → 3:1 against adjacent color
         NO  → Decorative — no requirement
```

### 4. Semantics

- One `<h1>` per page; sequential heading levels (h1 → h2 → h3, never skip)
- Landmarks: `<header>`, `<nav>`, `<main>`, `<footer>`, `<aside>`
- Multiple `<nav>` → each needs `aria-label` (e.g. "Main navigation", "Footer links")
- Lists use `<ul>`/`<ol>`/`<dl>` — not styled divs
- `<dialog>` for modals (native focus management + backdrop)

### 5. Dialog / Modal a11y (recipe)

```html
<!-- Native dialog — best practice for modals -->
<dialog id="my-dialog" aria-labelledby="dialog-title">
  <h2 id="dialog-title">Confirm action</h2>
  <p>Are you sure you want to proceed?</p>
  <form method="dialog">
    <button value="cancel">Cancel</button>
    <button value="confirm" autofocus>Confirm</button>
  </form>
</dialog>

<script>
  // Open
  document.getElementById('my-dialog').showModal();
  // Native dialog automatically traps focus + adds backdrop + handles Escape
</script>
```

### 6. Color-blind safe patterns

| State | Don't (color only) | Do (color + indicator) |
|-------|---------------------|------------------------|
| Error | Red border | Red border + error icon + text |
| Success | Green text | Green text + checkmark icon |
| Required | Red asterisk only | Asterisk + "(required)" text |
| Active tab | Blue color | Blue + underline/weight + `aria-selected` |
| Disabled | Gray color | Gray + `disabled` attr + reduced opacity |

### 7. Touch & tap targets

- Interactive elements ≥ 44×44px on mobile (WCAG 2.5.8 target size)
- ≥ 40×40px acceptable on dense desktop UIs
- No overlapping tap targets
- Adequate spacing between adjacent interactive elements (≥ 8px gap)

## Quick audit method

Run in this order (5-minute check):

1. **Tab through** — can you reach everything? Is focus visible?
2. **Screen reader** — does heading structure make sense? Are buttons/links announced correctly?
3. **Contrast check** — run browser DevTools contrast checker or axe
4. **Zoom to 200%** — does layout still work?
5. **Color only** — remove color perception (Chrome DevTools → Rendering → Emulate vision deficiency)

## Checklist

- [ ] Keyboard path works without mouse
- [ ] Focus visible everywhere interactive
- [ ] Focus trapped in modals, restored on close
- [ ] Skip link present when nav is long
- [ ] Labels / aria-label present on all interactive elements
- [ ] Live regions for dynamic content updates
- [ ] Contrast meets AA (4.5:1 text, 3:1 large/UI)
- [ ] No color-only state communication
- [ ] Semantic structure (one h1, sequential levels, landmarks)
- [ ] Touch targets ≥ 44px on mobile
- [ ] Dialogs use native `<dialog>` or proper focus management

## Depth

Full checklist: `references/accessibility-checklist.md`.  
Contrast & color-alone rules in context: `references/ux-foundations.md`.
