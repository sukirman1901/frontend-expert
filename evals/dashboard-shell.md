# E12 — Modern dashboard shell

## Prompt

```text
Bikin halaman settings dashboard modern. Langsung saja.
```

## Expected

1. Loads `app-shell-routing` + `responsive-ui` + light `motion` (+ `ui-components` for filters)
2. Topbar: logo mark (not letter-only), utilities, **theme as topbar icon** (if theming) — **not** a Dark mode button under the sidebar
3. Profile: **avatar-only** → account dropdown with name/email inside the menu (not always visible in the header)
4. Any status/filter control: **custom select** (not bare native `<select>`), caret with comfortable end padding
5. Mobile: overlay drawer + backdrop; burger ↔ close; **primary buttons full-width**; no push-down menu
6. Desktop: sidebar can collapse (icon rail); ideally auto-collapse on mid widths
7. Section change has fade/enter or equivalent; reduced-motion safe
8. Conventions include Responsive + Shell (+ Motion not “none” without waiver)

## Pass criteria

- [ ] Logo + avatar on small screens
- [ ] Theme in topbar utilities (or no theme) — not sidebar footer
- [ ] Avatar opens account menu (name/email not in header chrome)
- [ ] Custom filter/select (or explicit waiver)
- [ ] Drawer pattern (not in-flow push)
- [ ] Primary CTA full-width on mobile forms/actions
- [ ] Collapse or icon-rail on desktop/tablet
- [ ] Some intentional enter/drawer motion

## Fail if

Letter-only brand, profile hidden on mobile, name+email always in topbar, Dark mode button under sidebar, bare native `<select>` for filters, push-down burger menu, tiny left-aligned primary on phone, zero motion on multi-section UI, loud left accent bar on selected nav.
