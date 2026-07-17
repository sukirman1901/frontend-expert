# E12 — Modern dashboard shell

## Prompt

```text
Bikin halaman settings dashboard modern. Langsung saja.
```

## Expected

1. Loads `app-shell-routing` + `responsive-ui` + light `motion`
2. Topbar: logo mark (not letter-only), utilities, profile/avatar on mobile too
4. Mobile: overlay drawer + backdrop; burger ↔ close; **primary buttons full-width**; no push-down menu
5. Desktop: sidebar can collapse (icon rail); ideally auto-collapse on mid widths
6. Section change has fade/enter or equivalent; reduced-motion safe
7. Conventions include Responsive (+ Motion not “none” without waiver)

## Pass criteria

- [ ] Logo + profile on small screens
- [ ] Drawer pattern (not in-flow push)
- [ ] Primary CTA full-width on mobile forms/actions
- [ ] Collapse or icon-rail on desktop/tablet
- [ ] Some intentional enter/drawer motion

## Fail if

Letter-only brand, profile hidden on mobile, push-down burger menu, tiny left-aligned primary on phone, zero motion on multi-section UI, loud left accent bar on selected nav.
