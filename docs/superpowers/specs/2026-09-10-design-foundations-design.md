# Design Foundations Skill Design

## Objective

Add `design-foundations` as the single owner of structural visual fundamentals for product web UI. It should help an agent construct or repair layout systems without absorbing responsibilities already owned by direction, tokens, typography, color, surfaces, responsive behavior, or polish.

## Position in the suite

The build sequence becomes:

```text
design-direction?
  → design-foundations
  → tokens
  → design-typography? / design-color? / design-surfaces?
  → components → responsive → motion → anti-slop-design → polish → accessibility
```

`design-foundations` runs for new layouts and structural redesigns. It may be skipped for isolated component-state, copy, color, typography, motion, or token changes that do not alter layout structure.

## Ownership

`design-foundations` owns:

- grid and container strategy;
- spacing rhythm and section cadence;
- alignment and edge relationships;
- composition and focal hierarchy;
- density and information grouping;
- whitespace as structure;
- nesting, inset, and layout geometry;
- predictable layout behavior under realistic content.

It does not own:

| Concern | Owner |
|---|---|
| Choosing between multiple product directions | `design-direction` |
| Selecting or packaging token values | `tokens` |
| Type roles, font metrics, wrapping | `design-typography` |
| Palette construction and contrast pairs | `design-color` |
| Radius values, shadows, borders, elevation | `design-surfaces` |
| Breakpoints and small-screen transformations | `responsive` |
| Component API and UI states | `components` |
| Micro-alignment, interaction feel, final craft | `polish` |

Foundations may identify a dependency on another owner, but must hand it off instead of restating that owner’s full rules.

## Core workflow

1. **Inventory** — identify regions, content priority, actions, repeated groups, and realistic content extremes.
2. **Choose structure** — define container behavior, layout model, grid, major regions, and reading/action order.
3. **Set rhythm** — assign a small spacing scale to intra-group, component, section, and page-level relationships.
4. **Align** — establish shared edges, baselines, anchors, and deliberate exceptions.
5. **Control density** — match information density to the task; use progressive disclosure instead of indiscriminate whitespace.
6. **Stress content** — test minimum, typical, maximum, empty, localized, and dynamic content shapes.
7. **Hand off** — pass value selection to tokens and domain-specific decisions to their owners.
8. **Verify** — check hierarchy, grouping, rhythm, overflow risk, and structural consistency before downstream polish.

## Required rules

- Start from content priority and user task, not a decorative grid.
- Use one container strategy per page region and make exceptions explicit.
- Use a limited spacing scale; proximity must communicate grouping.
- Prefer shared alignment edges over arbitrary centering and one-off offsets.
- Ensure one primary focal path and one dominant action where the view requires action.
- Treat whitespace as a relationship, not empty decoration.
- Test realistic content before declaring layout stability.
- Do not hardcode a universal column count, container width, or density.
- Do not duplicate radius, color, typography, breakpoint, or motion rules.

## Artifacts

- `skills/design-foundations/SKILL.md` — concise trigger, boundaries, workflow, MUST rules, and checklist.
- `references/design-foundations.md` — detailed structural principles, decision tables, examples, and failure modes.
- `evals/design-foundations.md` — E28 behavioral scenario and pass criteria.

## Integration

Update the following:

- `AGENTS.md`, `SKILL.md`, `CLAUDE.md`, and personas for chat-first routing;
- portable, Claude, and Gemini UI/design adapters;
- `plugin.json` for exactly 30 canonical skills;
- `docs/pillars.md`, `docs/pack-layers.md`, `references/README.md`, and lifecycle maps;
- `CHANGELOG.md` with version `2.1.0`;
- smoke and adapter-sync tests;
- eval index from E1–E27 to E1–E28.

## Testing strategy

### RED

Before implementation, tests must fail because `design-foundations` is missing from its folder, plugin registration, routing, references, and E28.

### GREEN

The structural checks pass when the skill, reference, eval, registration, and routing are present and ownership language is explicit.

### Behavioral evaluation

E28 presents a dashboard that feels structurally wrong despite acceptable colors and components. A passing agent should diagnose hierarchy, grouping, alignment, spacing rhythm, density, and content stress; it should not replace the palette, invent typography, or perform final micro-polish.

## Completion criteria

- Exactly 30 canonical skill folders and registrations exist.
- `design-foundations/SKILL.md` stays under 150 lines.
- The reference contains no external research-link ledger and expresses synthesized pack rules.
- Build routing places foundations after optional direction and before tokens.
- Domain boundaries are explicit and no existing owner loses functionality.
- E28 and all existing integrity checks pass.
- `git diff --check` and shell syntax checks pass.

## Risks and controls

| Risk | Control |
|---|---|
| Foundations becomes an umbrella duplicate | Explicit ownership table and smoke assertions |
| Universal grid prescriptions | Require task/content context and prohibit fixed universal values |
| Hierarchy overlaps direction | Direction chooses an approach; foundations executes structural hierarchy |
| Spacing overlaps tokens | Foundations defines relationships; tokens supplies values |
| Responsive is skipped | Foundations identifies risks; `responsive` still owns breakpoint transformations |
