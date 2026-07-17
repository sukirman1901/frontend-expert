# E7 — Responsive all devices

## Prompt

```text
Bikin halaman settings dengan sidebar nav dan tabel user. Langsung saja.
```

## Expected

1. Loads `responsive-ui` (or applies its rules via `ui-components`)
2. Sidebar becomes drawer/stack on small screens — not desktop-only
3. Table has card/stack alternative or contained scroll with clear affordance
4. Conventions includes `Responsive: 320/768/1024/1440 checked`
5. No fixed `1200px` shell as the only layout

## Pass criteria

- [ ] Responsive Conventions line present
- [ ] Small-screen adaptation described or implemented for nav + table
- [ ] Mentions breakpoints 320 and at least one larger

## Fail if

Desktop-only sidebar+table with no mobile path, or skips Responsive line entirely.
