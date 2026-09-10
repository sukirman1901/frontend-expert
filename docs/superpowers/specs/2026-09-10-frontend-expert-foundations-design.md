# Frontend Expert Foundations Improvement Design

## Objective

Evolve Frontend Expert into a coherent, evidence-led UI design and frontend engineering suite without copying another pack, hardcoding taste as universal law, or breaking existing skill identifiers.

This specification covers phase 1 only: naming and routing foundations, evidence classification, standards corrections, and deeper design-domain coverage for typography, color, surfaces, and content design.

## Scope boundaries

### Included in phase 1

- Add a clear “Start here” path.
- Establish a stable naming policy and compatibility policy.
- Add an evidence hierarchy and per-principle provenance format.
- Add focused skills for `design-typography`, `design-color`, `design-surfaces`, and `content-design`.
- Integrate new skills into routing, personas, commands, pillars, references, compliance gates, evals, plugin registration, and smoke tests.
- Upgrade accessibility guidance from a WCAG 2.1-only baseline to WCAG 2.2 AA while preserving context for projects legally pinned to 2.1.
- Replace stale FID monitoring examples with INP.
- Resolve the documented skill-count drift.
- Add attribution for substantially adapted MIT-licensed ideas.

### Deferred to phase 2

- `frontend-code-quality`
- `frontend-hardening`
- `frontend-design-system`
- Security, internationalization, API contracts, browser policy, and release-quality depth

### Deferred to phase 3

- Rendered side-by-side design variants
- Component state stress-test surfaces
- Frame-by-frame animation inspection and reverse engineering

## Naming design

`frontend-expert` remains the suite and plugin namespace. Skill identifiers use descriptive kebab-case rather than repeating `frontend-` or shortening it to `fe-` everywhere.

New design-domain skills use a `design-` prefix where it prevents ambiguity:

- `design-typography`
- `design-color`
- `design-surfaces`
- `content-design`

Canonical identifiers use the approved concise taxonomy. Seventeen pre-1.2 identifiers remain as deprecated, explicit-invocation-only aliases for one migration cycle and are removed in v2.0. This prevents auto-routing competition while preserving installed prompts during migration.

## Start-here design

The root documentation presents three entry points:

1. `frontend-expert` — route an uncertain request.
2. `frontend-judgment` — choose a direction for a new or ambiguous surface.
3. `ui-quality-loop` — refine an existing surface until evidence-backed gates pass.

Slash commands remain a small optional adapter set: `/ui`, `/design`, `/audit`, `/test-ui`, and `/polish`. Domain skills are discovered through natural-language routing; no command is added for every skill.

## Evidence policy

Every normative-looking rule is classified as one of:

| Class | Meaning |
|---|---|
| Standard | Requirement from a current formal specification |
| Product requirement | Explicit user, legal, brand, or project constraint |
| Project default | Existing design-system or codebase convention |
| Enterprise pattern | Recurring production pattern from mature design systems |
| Recommendation | Strong default with broad evidence |
| Heuristic | Starting point requiring contextual or visual verification |
| Inspiration | Creative direction, never a compliance rule |
| Waiver | Deliberate exception with a reason |

Source precedence:

1. User/product requirements
2. Project design system and conventions
3. W3C, WHATWG, WCAG/WAI-ARIA, TC39, and framework specifications
4. Current official framework/library documentation
5. Mature enterprise design systems and established UX research
6. Craft references and licensed skill repositories
7. Behance, Awwwards, Mobbin, and similar inspiration sources

When sources disagree, the skill records the context and does not silently promote a preference into a MUST.

## Principle provenance

Deep reference files use a compact provenance block for rules likely to be mistaken for universal laws:

```yaml
principle: Concentric nested radius
classification: heuristic
recommendation: outer radius approximately equals inner radius plus inset
applies_when:
  - nested surfaces share a visual center
exceptions:
  - pills or circles
  - asymmetric insets
  - deliberate contrasting shape language
verification:
  - inspect rendered light and dark surfaces
sources:
  - CSS Backgrounds and Borders Level 3
  - attributed craft reference
last_verified: 2026-09
```

The repository also gains a central source ledger so maintainers can refresh version-sensitive references.

## Domain boundaries

### `design-typography`

Owns font selection, semantic type roles, scale, measure, line-height, font loading, variable fonts, OpenType, wrapping, truncation, numeric typography, language, and mixed-direction rendering. Semantic heading accessibility remains owned by `accessibility`; copy remains owned by `content-design`.

### `design-color`

Owns palette construction, semantic color roles, OKLCH workflows, dark-theme derivation, gamut handling, contrast pairing, and color verification. `design-tokens` continues to select and apply the project or pack token source; `accessibility` owns conformance classification.

### `design-surfaces`

Owns nested radii, borders, elevation, shadows, overlays, dividers, surface hierarchy, and light/dark surface behavior. Concentric radius is documented as a conditional geometric heuristic, not a universal formula.

### `content-design`

Owns UI labels, CTA text, helper copy, errors, empty states, confirmations, onboarding language, product voice, localization-ready copy, and AI-writing cleanup. Typography owns rendering; forms own validation behavior; marketing owns section information architecture.

## Review behavior

Review must be evidence-led:

- Resolve and state the inspected scope.
- Inspect rendered behavior when a claim depends on runtime appearance.
- Mark unperformed checks as `Not verified`.
- Consolidate repeated symptoms under one root cause.
- Rank by user impact rather than subjective dislike.
- Prefer the cheapest valid fix: delete, use platform, reuse project, correct value, then add abstraction.
- Never claim a holistic review when an owning domain was not inspected.

## Compatibility and attribution

- Existing skill identifiers and command names remain available.
- New skills follow the repository’s flat `skills/<name>/SKILL.md` discovery structure.
- Substantially adapted material retains required MIT copyright and license notice.
- References identify adapted sources, while rewritten principles cite primary standards where available.
- External creative work is analyzed into attributes; visual identity and copyrighted layouts are not copied.

## Verification

Phase 1 is complete when:

- Each new skill has at least one eval created before its implementation.
- Smoke tests verify registrations, counts, references, and adapter mentions.
- Natural Indonesian and English prompts route to the correct owner.
- Existing identifiers and commands still pass their current checks.
- No WCAG 2.1-only global claim or FID-as-Core-Web-Vital example remains.
- Evidence classes and source ledger are present and linked from authoring guidance.
- `./scripts/smoke-test.sh` passes with pristine output.

## Risks and controls

| Risk | Control |
|---|---|
| Too many overlapping skills | Declare one owner per concern and explicit handoffs |
| Breaking installed consumers | Keep current identifiers in phase 1 |
| Hardcoded taste | Evidence classification plus project-first precedence |
| Reference drift | `last_verified` metadata and source ledger |
| Copying external packs | Adapt principles, cite sources, retain license notices where required |
| Documentation bloat | Keep triggerable skills concise; move depth into `references/` |
