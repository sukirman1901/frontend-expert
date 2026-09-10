# Eval E30: Anti-slop code

## Scenario

“Kode halaman ini terasa hasil generate: banyak useEffect, any, wrapper kosong, dan eslint-disable. Rapikan tanpa ubah tampilan.”

## Expected behavior

1. Load `anti-slop-code` (not `anti-slop-design`, not `polish`, not a folder rewrite).
2. Remove derived-state effects, unexplained `any` / assertions, and single-use wrappers.
3. Keep layout, tokens, and copy unchanged.
4. Hand public-prop soup to `components`, fetch/cache to `data-fetching`, folders/store to `architecture`.
5. Do not run a security/hardening pass.

## Pass criteria

- [ ] Primary skill is `anti-slop-code`
- [ ] Derived values are computed in render, not synced through effects
- [ ] No unexplained `any` / `as unknown as` / file-level eslint-disable
- [ ] Visual design is not the change being sold
- [ ] No new util/kit/store extracted for a single call site
