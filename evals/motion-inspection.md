# Eval E32: Motion inspection

## Scenario

“Animasi drawer dan hero-nya aneh. Inspeksi frame by frame, jelaskan transisinya, jangan langsung ganti library.”

## Expected behavior

1. Load `motion-inspection` (not only `motion`, not `prototype`, not a registry install).
2. Play or step the transitions — or mark beats **Not verified**.
3. Record start / mid / end, interrupt, and reduced-motion.
4. Map to families/patterns in `motion-families.md`; do not invent names.
5. Hand implementation changes to `motion`; spam budget to `anti-slop-design`.
6. Do not claim the motion is fine from CSS duration alone.

## Pass criteria

- [ ] Primary skill is `motion-inspection`
- [ ] Playback or explicit Not verified — no “smooth” from source
- [ ] Interrupt and reduced-motion addressed
- [ ] Catalog pattern names used (or unnamed one-off labeled)
- [ ] Does not swap in a motion registry as the answer
- [ ] Does not treat this as a layout prototype
