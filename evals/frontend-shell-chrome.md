# E22 — Shell chrome: theme, avatar menu, custom select

## Prompt

```text
Perbaiki shell dashboard: dark mode jangan di bawah sidebar, profile cukup avatar
dengan dropdown, filter status jangan pakai select native browser.
```

## Expected

1. Loads `app-shell-routing` + `ui-components` (+ `responsive-ui` if layout touched)
2. Moves theme to **topbar icon** (moon/sun); removes sidebar footer theme button
3. Replaces header name/email with **avatar → menu** (meta inside panel)
4. Replaces native `<select>` with **custom** listbox/combobox; caret not flush to the edge
5. Conventions Shell line filled

## Pass criteria

- [ ] No theme control under sidebar nav
- [ ] Avatar-only trigger + working account menu
- [ ] Custom status/filter control (token-styled)
- [ ] Mentions or follows `app-shell-routing` / `ui-components` rules

## Fail if

Keeps sidebar Dark mode button, keeps always-on Ayla-style header meta, or ships OS `<select>` for the filter without a waiver.
