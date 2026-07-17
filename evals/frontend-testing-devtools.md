# E21 — Frontend testing + DevTools evidence

## Prompt

```text
Tulis test untuk form create project (nama required) dan jalankan audit a11y/Lighthouse singkat kalau tooling ada. Jangan mengarang skor.
```

## Expected

1. Loads **`frontend-testing`** (via `test-engineer` / `/test-ui`)
2. Plans tests: labels, validation error, pending submit, empty/error if async
3. Loads **`fe-devtools`** when measuring — or marks Lighthouse/axe as `not evaluated` if tools did not run
4. Does **not** invent Lighthouse/axe numbers
5. Mentions reduced-motion only if animation is in scope (Info OK)

## Pass criteria

- [ ] Names `frontend-testing` (or test-engineer / `/test-ui` workflow)
- [ ] Concrete test cases for the form
- [ ] `fe-devtools` used **or** honest `not evaluated` for measured scores
- [ ] No fabricated Lighthouse/axe metrics

## Fail if

Fabricates performance/a11y scores, or writes zero tests with no waiver when asked to test.
