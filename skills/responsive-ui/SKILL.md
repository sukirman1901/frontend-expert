---
name: responsive-ui
description: >-
  Mobile-first responsive UI for all devices (320–1440+): no horizontal scroll,
  44px tap targets, drawer nav, full-width primary buttons on phone, adaptive
  tables/forms. REQUIRED on every user-facing page/layout build — including
  "mobile", "responsive", "tablet", burger menu, or /ui /polish. Report Responsive
  in Conventions check.
---

# Responsive UI

## Overview

Ship layouts that work on **all devices** — phone floor through desktop. Not React Native: responsive **web**.

## When to use

- Every `/ui` / polish build that touches layout
- “Mobile”, “responsive”, “tablet”, “semua device”, burger / sidebar
- Tables, dashboards, nav, forms, marketing pages

## When to skip

- Pure token/color tweak with no layout change (still keep existing responsive behavior)
- Explicit waiver: desktop-only internal tool (must state in Conventions)

## Workflow

1. **Mobile-first** — base styles for ~320px; enhance at 768 / 1024 / 1440
2. **Check** — no horizontal page scroll; primary actions reachable; tap targets ≥44px
3. **Adapt content** — tables → cards/stack; **side nav → overlay drawer + backdrop**; don’t hide profile/account without alternative
4. **Mobile controls** — primary CTAs / form submit / destructive row actions → **`width: 100%`** below 768; stack button rows vertically
5. **Breakpoint cleanup** — on resize past mobile, close drawer / clear `is-open` / unlock body scroll
6. **Report** — Conventions: `Responsive: 320/768/1024/1440 checked`

## Figma Auto Layout → CSS (quick)

| Figma | CSS |
|-------|-----|
| **Fill** | `width: 100%` / `flex: 1` / `align-self: stretch` |
| **Hug** | `width: fit-content` / `flex: 0 0 auto` |
| **Fixed** | Explicit width/height |
| **Gap / Padding** | `gap` / `padding` (tokens) |
| Primary CTA on phone | Fill → **`width: 100%`** below 768 |

Full table: `references/responsive.md` → Figma Auto Layout ↔ CSS.

## Mobile controls (MUST <768)

| Control | Mobile rule | Don’t |
|---------|-------------|--------|
| **Primary button** | Full width (`width: 100%`) in forms, toolbars, plan/row actions | Tiny desktop-width CTA floating left |
| **Secondary in same row** | Stack under primary, also full width when it’s the only action column | Side-by-side cramped pair |
| **Form inputs** | Full width; `font-size ≥ 16px` (prevents iOS zoom) | `14px` inputs that zoom the page |
| **Icon utilities in topbar** | Keep essentials (e.g. bell + avatar); hide secondary (search) if crowded | 4–5 icon buttons + label Menu |
| **Profile** | Avatar always; hide name/email/chevron if needed | `display: none` on whole profile |

Example:

```css
@media (max-width: 767px) {
  .form__actions { flex-direction: column; align-items: stretch; }
  .form__actions .btn--primary,
  .toolbar .btn--primary,
  .row .btn { width: 100%; }
  .field input { font-size: 1rem; min-height: 2.75rem; }
}
```

## Mobile nav (MUST for dashboard/shell)

| Do | Don’t |
|----|-------|
| Fixed/overlay drawer + dimmed backdrop | `display:block` nav that pushes page down |
| Icon-only burger that swaps to close (X); close also inside drawer | Labeled “Menu” still visible beside open panel |
| Close on backdrop, Escape, nav select | Leave drawer open across breakpoint changes |
| `aria-expanded` + focus management | Focus trap ignored |

## Checklist

- [ ] Verified (or reasoned) at 320 / 768 / 1024 / 1440
- [ ] No page-level horizontal overflow
- [ ] Touch targets ≥44px for primary controls
- [ ] **Primary buttons full-width on mobile** (forms / toolbars / action rows)
- [ ] Figma Fill/Hug mapped correctly when a design file exists
- [ ] Inputs ≥16px font on mobile
- [ ] Drawer + backdrop for side nav on small screens
- [ ] Account/profile control not deleted on mobile
- [ ] Conventions Responsive line filled

## Depth

Full rules + patterns: `references/responsive.md`.  
Shell chrome: `app-shell-routing`.  
Demo: `test/` settings.  
Ship gate: `references/compliance-gates.md`.
