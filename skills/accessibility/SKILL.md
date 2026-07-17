---
name: accessibility
description: >-
  Enforce WCAG 2.1 AA (keyboard, ARIA, focus, contrast, semantic HTML). Use for
  accessibility work, pre-ship UI checks, and as a light pass on every UI build
  or design review — including "a11y", "keyboard", "screen reader", or shipping
  user-facing changes, without requiring a slash command.
---

# Accessibility

## Overview

Every user-facing UI must meet WCAG 2.1 AA. Keyboard, labels, contrast, and semantics are required — not optional polish.

## When to Use

- `/design` audits
- Light check during `/ui` builds
- Dedicated accessibility fixes

## Workflow

1. **Keyboard**
   - All interactive elements focusable
   - Logical focus order; visible focus indicators
   - Focus trapped in modals; restore on close

2. **ARIA / labels**
   - Form inputs have visible labels
   - Icon-only buttons have `aria-label`
   - Loading announced (`aria-busy` / live regions as needed)

3. **Color & contrast**
   - Normal text ≥ 4.5:1
   - Large text ≥ 3:1
   - Do not rely on color alone for state

4. **Semantics**
   - One `h1` per page; sequential heading levels
   - Landmarks (`main`, `nav`, etc.)
   - Lists use `ul`/`ol`/`dl`

## Checklist

- [ ] Keyboard path works without mouse
- [ ] Focus visible everywhere interactive
- [ ] Labels / aria-label present
- [ ] Contrast meets AA
- [ ] Semantic structure makes sense to a screen reader

## Depth

Full checklist: `references/accessibility-checklist.md`.  
Contrast & color-alone rules in context: `references/ux-foundations.md`.
