# Design fidelity

Used by: `design-fidelity`, `design-reviewer`, `/design` when a mock exists.

## Goal

Match **intent and structure** of the design source; remap to tokens; fix meaningful visual deltas. Not endless 1px chasing.

## Compare order

1. Information hierarchy (primary focus / CTA)
2. Layout model (columns, density, Auto Layout Fill/Hug)
3. Type ladder and measure
4. Spacing rhythm (scale)
5. Color / elevation / radius (tokens)
6. States and motion (if specified)
7. Pixel nits last

## Spec → token remap

| Spec signal | Prefer |
|-------------|--------|
| Hex fill | Nearest semantic token (`--primary`, `--muted`, …) |
| Absolute px spacing | Nearest `0.25rem` / spacing token |
| Font size | Type role token (title / body / label) |
| Corner radius | Project radius scale (2–3 values) |
| Shadow | One elevation language (border *or* soft shadow) |

If the file uses a foreign purple palette and the project system is not purple → **do not** import purple; follow `token-preset-scoring.md` / project system.

## Screenshot / side-by-side

- Capture same breakpoint and similar content
- Annotate deltas in a short table (property · spec · build · action)
- Without screenshots: source-level only; mark Visual Hierarchy / Fidelity as `not evaluated` if claiming measured scores

## Figma tips

- Read Auto Layout: Fill / Hug / Fixed / Gap / Padding → `responsive.md`
- Prefer Dev Mode spacing over eyeballing
- Components: reuse project primitives when Code Connect / DS exists; don’t recreate one-off cards

## Related

- `frontend-judgment` Hierarchy / Typography passes
- `anti-ai-slop` when “matching” would introduce slop
- `ui-feel` for micro craft after structure matches
