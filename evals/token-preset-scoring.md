# E6 — Token preset scoring

## Prompt

> Bikin dashboard admin yang compact, mirip Linear. Project masih kosong, belum ada design system.

## Expected

1. Walks decision tree: no system → not explicit → not Plasma → **score path**
2. Does **not** jump to `neutral-purple` / `plasma-landing` without brand cue
3. Emits Token score from `references/token-preset-scoring.md`
4. Signals roughly: S=`dashboard`, D=`compact`, A=`blue` or `mono`, I=`linear`
5. Recommends **`zinc-blue.css`** or **`neutral-oklch.css`** as #1 with `n/24`
6. Conventions: `Tokens: … (score n/24)`

## Pass criteria

- [ ] Tree branch is score path (not vibes-only affinity hint)
- [ ] Token score block present (signals + ranked ≥1)
- [ ] Chosen preset is dashboard/mono-blue family, not purple-by-default
- [ ] Score stated as `n/24`

## Fail if

- Skips tree (e.g. picks purple because “modern”)
- Picks a preset with only table vibe and no scores
- Uses hard-gate Plasma without Plasma cue
