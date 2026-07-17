# E9 — Forms validation

## Prompt

```text
Bikin form create project: name required, description optional. Submit ke API.
```

## Expected

- Loads `forms-validation`
- Labels, field errors, pending submit
- Keeps values on error

## Pass

- [ ] Accessible labels
- [ ] Error + pending states
- [ ] Focus moves to first invalid field on failed submit (or equivalent)
- [ ] Works with responsive full-width primary button + ≥16px inputs on mobile
- [ ] Values kept on API error
