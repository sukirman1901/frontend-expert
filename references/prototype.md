# Prototype

Skill entry: `skills/prototype/SKILL.md`.
Text-only direction belongs to `design-direction`. Production composition belongs to `design-foundations` and `components`. Motion implementation belongs to `motion`. This file owns **rendered comparison** and **state stress**.

These patterns are **heuristics** unless a row says otherwise. Variants stay on the project design system / scored tokens — never a parallel palette per option.

## Side-by-side variants

| Do | Don’t |
|----|-------|
| 2–3 options, each labeled with its **axis** | Five near-identical cards with different accent colors |
| Same copy, data, and constraints in every column | Inventing a better headline on option B only |
| Real components in the repo stack | Screenshot collage or ASCII as the shipped artifact |
| Compare at 1024+ in columns; stack below 768 | Tiny thumbnails that hide density and wrapping |
| One recommended column marked | Shipping the comparison page as the product |

```yaml
principle: Compare rendered directions, not restyled clones
classification: recommendation
recommendation: two or three variants on distinct design axes, then pick one
applies_when:
  - blank-canvas or ambiguous layout where more than one axis is viable
exceptions:
  - user locked a direction or said langsung saja
  - tiny prop/token fixes
verification:
  - each variant names a different axis; identical content facts
last_verified: 2026-09
```

After a winner is chosen, losing variants leave the production route (delete, or keep only under an explicit playground path the user asked for).

## State stress matrix

Press the **recommended** variant (or the existing component if this is a stress-only ask). `data-fetching` / `forms` own the chrome of those states; this skill owns **whether they were actually shown**.

| State | What to prove |
|-------|----------------|
| Default | Happy path with realistic content length |
| Loading | Local placeholder; layout does not collapse |
| Empty | Path forward still visible |
| Error | Recovery control; no swallowed failure |
| Disabled | Unavailable action is perceivable, not missing |
| Overflow | Long name, long number, localized expansion, 320px |
| Crowded | Two competing CTAs or a full table — hierarchy still holds |

Do not claim “states handled” from source inspection alone. If a state cannot be rendered here, mark **Not verified**.

```yaml
principle: Stress real component states before calling the prototype done
classification: recommendation
recommendation: default, loading, empty, error, disabled, and overflow are shown, not described
exceptions:
  - static marketing blocks with no async or form
verification:
  - each applicable state is visible in the comparison or a follow-up render
last_verified: 2026-09
```

## Relationship to other skills

| Skill | Split |
|-------|--------|
| `design-direction` | Axes and recommendation in prose; **no** coded gallery |
| `design-foundations` | After pick: one grid/spacing system, not three |
| `components` | Public props/contract of the winning UI |
| `anti-slop-design` | Kill purple/template tells inside a variant |
| `fidelity` | Match a given mock, not explore alternatives |
| `motion` | Implement motion on the winner; do not reverse-engineer frames here |

## Review output

### Craft comparison, not a taste score

For a user-requested quality comparison, freeze the brief, factual content, tokens, states and viewport before rendering variants. If comparing instruction versions, use isolated runs with the same inputs and record generation differences; a single pair is evidence of those outputs, not a universal improvement rate. Synthetic evaluation fixtures must be labeled and must not replace the actual target in fidelity/optical acceptance.

| Lens | Observe in the actual render | Specific correction |
|---|---|---|
| Task specificity | Can the user identify the domain object and next decision without a generic explanatory banner? | Replace generic tiles with an appropriate queue/editor/plot/artifact anatomy |
| Composition | Dominant region, subordinate context, shared scan anchors and reading rhythm | Change region relationships before changing colors |
| Component craft | Legible labels/values, stable action edge, useful density, consistent inset/radius | Tune the representative family then propagate; no global optical offsets |
| Responsive anatomy | Local fields, chart ticks, labels, selected details and source access—not just page overflow | Reflow the affected region, recompute plot labels, or disclose context locally |
| State continuity | User action changes the correct object; pending/error/recovery remains attached | Preserve identity/focus/input and repair the state boundary |
| Motion | Trigger, moving object, resting endpoint, reversal and reduced-motion path | Remove gratuitous motion or repair the handoff; a still cannot prove easing |

Use one observation → one causal hypothesis → one change → a matched recapture. For example: “At 320px the time suffix is clipped inside the native field; the paired layout lacks usable width; stack the pair and recapture.” `scrollWidth <= innerWidth` is insufficient: text can be tiny, internally clipped or hidden behind an overlay with zero page overflow.

Keep improvements and regressions in the report. Do not equate more animation, unusual geometry, larger whitespace or similarity to a reference with higher quality. Preserve already-strong parts. A plain, readable form can beat an expressive one for repeated work.

Recommended result record: **target + viewport/state + artifact → observed issue/change → remaining limit**. No numerical aesthetic score without an explicit grounded rubric. Source inspection proves intent, assertions prove states, screenshots prove sampled appearance, temporal captures prove sampled motion; report the evidence actually obtained.

```markdown
| Variant | Axis | Stress notes | Keep? |
|---------|------|--------------|-------|
| A | Density | Empty + 320 wrap OK | no |
| B | Hierarchy | Error recovery unclear | **yes** |
```

Do not mark prototype done with only adjectives (“clearer”). Do not claim motion inspection.

Authorship boundary: `NOTICE.md`.
