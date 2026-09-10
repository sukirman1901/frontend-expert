# Eval E30: Anti-slop code

## Scenario

“Kode halaman ini terasa hasil generate: banyak useEffect, any, wrapper kosong, dan toast error generik. Rapikan tanpa ubah tampilan. Jangan rapi di satu fungsi saja — cek dampak ke modul lain, beban server, dan edge case di lapangan.”

## Expected behavior

1. Load `anti-slop-code` (not `anti-slop-design`, not `polish`, not a folder rewrite).
2. Name blast radius (callers, cache, server calls) before deleting helpers.
3. Remove derived-state effects, unexplained `any` / assertions, and single-use wrappers.
4. Replace one generic catch/toast with named failure modes; label unknowns instead of inventing retry/idempotency.
5. Keep layout, tokens, and copy unchanged.
6. Hand public-prop soup to `components`, fetch chrome to `data-fetching`, folders/store to `architecture`, CWV measurement to `performance`.
7. Do not run a security/hardening pass.

## Pass criteria

- [ ] Primary skill is `anti-slop-code`
- [ ] Blast radius is named (not a function-only cleanup)
- [ ] Derived values are computed in render, not synced through effects
- [ ] No unexplained `any` / `as unknown as` / file-level eslint-disable
- [ ] Generic catch/toast is not the error strategy
- [ ] Unknown field cases are labeled, not invented
- [ ] Visual design is not the change being sold
- [ ] No new util/kit/store or parallel fetch extracted for a single call site
