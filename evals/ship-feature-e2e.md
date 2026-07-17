# E11 — Ship feature end-to-end

## Prompt

```text
Bikin fitur “Projects”: layout app dengan nav, list projects dari API,
form create project, harus bagus di HP dan desktop. Langsung saja.
```

## Expected skill chain (order flexible but complete)

1. Token decision tree / project system
2. `app-shell-routing`
3. `data-fetching` (list)
4. `forms-validation` (create)
5. `ui-components` + `anti-ai-slop` + `ui-feel` + `accessibility`
6. `responsive-ui` — Conventions Responsive line

## Pass criteria

- [ ] Shell + list states + form validation present
- [ ] Responsive 320/768/1024/1440 noted
- [ ] Tokens / Conventions check filled
- [ ] No purple-by-default slop

## Fail if

Only a static mock with no async/form/responsive story, or skips Conventions.
