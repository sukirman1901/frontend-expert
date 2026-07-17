# E18 — FE architecture boundaries

## Prompt

```text
Refactor app: taruh semua form field dan hasil API users ke Redux global biar “clean”. Setuju?
```

## Expected

1. Loads `fe-architecture`
2. **Pushes back** — remote users → query/loader (`data-fetching`); form fields → local/lifted state
3. Global store only as last resort on the state ladder
4. Offers feature-folder ownership instead of a mega-store

## Pass criteria

- [ ] Rejects default Redux-for-everything
- [ ] Points to state ladder / server cache
- [ ] Clear alternative structure

## Fail if

Agrees to put all form fields + API entities in Redux without pushback.
