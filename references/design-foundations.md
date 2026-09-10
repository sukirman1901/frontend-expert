# Design foundations

Design foundations chooses structural relationships. `tokens` supplies values, `design-surfaces` supplies radius/border/elevation, and `responsive` supplies breakpoint transformations.

## Content before geometry

Start with the work the screen must support, not a preferred grid. Inventory primary and secondary tasks, reading order, content shapes, repeated items, states, and constraints.

| Evidence | Structural decision | Avoid |
|---|---|---|
| One dominant task | Reserve the strongest focal region and shortest action path | Equal visual weight everywhere |
| Comparison across items | Preserve aligned fields and repeated scanning anchors | Independent card layouts that drift |
| Sequential work | Express order and completion without hiding the next step | Geometry based only on symmetry |
| Mixed optional detail | Keep core facts visible; disclose secondary depth progressively | Showing or hiding everything by default |

## Container and grid strategy

Choose a container and grid from content relationships. Do not assume a universal column count or maximum width.

| Content/task condition | Prefer | Verify |
|---|---|---|
| Long-form reading | A stable readable measure with supporting material clearly subordinate | Line flow, zoom, long headings |
| Repeated comparable records | Shared tracks or a table-like alignment model | Long values, missing fields, actions |
| Primary work plus context | A dominant work region with a subordinate rail/panel | Collapse order and focus continuity |
| Mixed modules | A grid whose spans encode priority and compatibility | Uneven item counts and reordering |

Containers establish a shared frame; grids establish relationships inside it. Let `responsive` define how those relationships stack, collapse, scroll, or re-order at breakpoints.

## Spacing rhythm

Define a small vocabulary of relationships—within an item, between siblings, between groups, and between sections—then map them to `tokens` values.

| Relationship | Relative treatment | Diagnostic |
|---|---|---|
| Label to its value/control | Tight | They read as one unit |
| Sibling items in one group | Consistent | The group scans without accidental gaps |
| Separate groups | Stronger than sibling spacing | Boundaries remain clear without decoration |
| Major sections | Strongest cadence in the local context | The page has a readable tempo |

Do not create a new gap for every instance. Fix the relationship first; `tokens` decides the actual value.

## Alignment and anchors

Shared edges, centers, and baselines make relationships legible. Choose the anchor that supports scanning, then keep intentional breaks rare and meaningful.

| Situation | Anchor candidate | Watch for |
|---|---|---|
| Labels and values | Text edge or baseline | Mixed wrapping that destroys rows |
| Repeated actions | Consistent action edge | Variable titles shifting controls |
| Hero or focal composition | Dominant content axis | Decorative centering that weakens reading order |
| Nested groups | Parent inset or a declared sub-grid | Accumulated indentation and lost usable width |

## Hierarchy and focal path

`design-direction` determines what deserves emphasis; foundations arranges scale of regions, position, whitespace, grouping, and sequence so that intent becomes a clear focal path.

| Question | Structural response |
|---|---|
| What should happen first? | Give the primary task the clearest position and least competing geometry |
| What supports that task? | Place it near the focal region with visibly lower weight |
| What is reference-only? | Move it out of the main path or reveal it on demand |
| What repeats? | Stabilize its template and scanning anchors |

## Density and progressive disclosure

Density follows task frequency, expertise, urgency, and information needed per decision—not a universal compact/comfortable setting.

| Context | Structural bias | Tradeoff to test |
|---|---|---|
| Frequent expert scanning | More visible comparable data and stable tracks | Comprehension and target clarity |
| Infrequent guided task | Strong grouping and staged disclosure | Extra steps and hidden context |
| Monitoring | Prioritize exceptions; compress stable detail | Missed weak signals |
| Mobile action flow | Preserve the primary path; defer secondary context | Loss of orientation |

## Whitespace as structure

Whitespace separates unlike content, binds related content through contrast, and protects the focal path. Empty space is useful only when it clarifies a relationship; remove ceremonial gaps that merely lengthen the page.

| Symptom | Inspect | Structural fix |
|---|---|---|
| Everything feels crowded | Group boundaries and competing focal regions | Consolidate groups, then strengthen between-group space |
| Page feels disconnected | Excessive section gaps or weak anchors | Restore shared alignment and cadence |
| Blank area feels accidental | Content variance, fixed heights, missing states | Let layout adapt or assign the space a clear job |

## Nesting and inset geometry

Use nesting to express a meaningful level, not as a styling habit. Track cumulative inset so nested content retains useful width and alignment.

| Need | Prefer | Hand off |
|---|---|---|
| Logical subgroup | Spacing, heading, or divider before a new surface | `design-surfaces` if a boundary needs styling |
| Nested interactive region | A clear parent-child inset and focus order | `components` for behavior/states |
| Curved nested surfaces | Relationship based on the actual inset and shape | `design-surfaces` for radius/border/elevation |
| Narrow viewport | Flatten or reframe low-value nesting | `responsive` for the breakpoint transformation |

## Content stress matrix

| Stress case | Structural risk | Pass condition |
|---|---|---|
| Very short / very long text | Awkward gaps, collisions, shifted actions | Reading and action anchors remain clear |
| Missing / empty content | Orphaned labels or collapsed groups | Empty state preserves hierarchy |
| Many / few repeated items | Unbalanced grid or excessive page length | Pattern adapts without fake placeholders |
| Localization and larger text | Wrap, overflow, clipped controls | Reflow preserves order and grouping |
| Loading, error, selected, expanded | Layout jump or lost context | States occupy intentional structural regions |
| Real media aspect ratios | Cropping or height instability | Media rules preserve the focal path |

## Failure modes

| Failure | Why it fails | Correction |
|---|---|---|
| Picking columns before content | Geometry dictates hierarchy | Return to tasks and content shapes |
| Equal spacing everywhere | Relationships become ambiguous | Use a deliberate spacing cadence |
| Card for every group | Nesting and hierarchy become noisy | Group with whitespace/alignment first |
| Fixed-height content regions | Real data clips or creates dead space | Stress with realistic variance |
| Desktop shrink-down | Mobile order and actions become accidental | Hand relationship changes to `responsive` |
| Styling structural problems | Color, shadow, or type masks weak grouping | Repair structure, then hand off styling |

## Verification checklist

- [ ] Content priority and primary task precede geometry
- [ ] Container/grid relationships fit the content model
- [ ] Spacing cadence distinguishes item, group, and section levels
- [ ] Shared anchors support the intended scan path
- [ ] Density and disclosure fit task frequency and expertise
- [ ] Whitespace and nesting communicate structure without wasted depth
- [ ] Every content stress case has been rendered or reasoned through
- [ ] `tokens`, `design-surfaces`, and `responsive` own values and transformations
- [ ] Typography, color, components, and polish are handed to their canonical owners
