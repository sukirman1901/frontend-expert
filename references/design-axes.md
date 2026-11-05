# Design axes & exploration

Pack-authored, text-first design-axis framework. External exploration tools are research references only and are not bundled.

Used by: `design-direction`.

## Variant axes

When proposing approaches, make each option pull a **different lever**:

| Axis | Question it answers | Example contrast |
|------|---------------------|------------------|
| Hierarchy | What is most important? | One primary CTA vs equal-weight actions |
| Layout model | How is content structured? | Card grid vs dense table vs split pane |
| Density | How tight is spacing/info? | Compact tool UI vs spacious marketing |
| Interaction | How do users act? | Modal edit vs inline vs drawer |
| Expression | How loud is the brand? | Flat borders vs soft elevation + motion |

**Rule:** 2–3 options max. Never five near-identical color skins.

**Post-build:** Hierarchy is not only an exploration axis — run the **Hierarchy pass** in `skills/design-direction/SKILL.md` (and type ladder) before DONE. See also `references/ux-foundations.md` → UI visual system.

## Inspiration shorthand

Use as optional multiple-choice labels (not mandatory styles):

| Label | Signal |
|-------|--------|
| Linear | Dense, keyboard-first, precise |
| Stripe | Calm clarity, trust, craft |
| Notion | Flexible, content-first, softer |
| Apple | Spacious, refined, restrained motion |
| Vercel | Developer-simple, dark-ready |

Always map inspiration onto **project tokens** — never paste a foreign palette.

## Style inference (before inventing UI)

### Turn a reference into decisions

**Classification: recommendation.** A well-crafted reference is evidence to inspect, not a style name to imitate. Read it at three scales: page composition, block anatomy, and component/state detail. Separate observed geometry/behavior from guesses about its implementation; a screenshot cannot prove motion timing.

For the chosen direction, record a short **craft intent**: the user's task, the dominant content form, and two or three visible decisions that serve it. For example: “Dispatch work prioritizes exceptions in aligned rows; selection keeps details beside the queue; healthy work stays quieter.” “Modern, premium, clean” is not an implementation decision.

| Reference observation | Transferable decision | Do not automatically transfer |
|---|---|---|
| A compact editor aligns labels, values and actions | Shared tracks and bounded field widths for repeated editing | Its exact font, pill shape or 8px gap |
| A trigger visibly becomes its detail surface | Preserve identity/origin and focus across states | Morph every menu and navigation item |
| A feature is shown through a usable product specimen | Use the actual domain object as proof | A decorative mock dashboard or fabricated data |
| A chart keeps labels, plot and inspector distinct | Give labels their own readable geometry | SVG scaling, gradients and entrance timing |

Name one competing structure and why it fits less well; keep the choice lightweight when the direction is already approved. Different tasks should lead to different compositions, not five instances of one rounded-card shell. Conversely, a familiar table or ordinary button is correct when it best supports the task—novelty is not a requirement.

**Specificity test:** if replacing the product name leaves every region, component and interaction equally plausible, inspect whether the real domain objects and decisions are visible. Fix content form and workflow before adding expressive effects. Keep one restrained expressive detail only where it strengthens identity or feedback; zero is valid in a dense work surface.

Map decisions into owners: `design-foundations.md` for block choice, `component-patterns.md` for anatomy, `motion.md` for state continuity, and `prototype.md` for rendered proof. Carry craft intent through the build so the final review can test it against visible results rather than adjectives.

1. Prefer project design system / CSS variables / Tailwind theme
2. Skim 2–3 real components: Button, Card, Form/Input
3. Note: radius, padding, shadow, type sizes, border treatment
4. If the project has **no** system → walk the **decision tree** in `token-preset-scoring.md` (custom → explicit → Plasma hard-gate → score). Do not pick by affinity hint.

## DESIGN_MEMORY.md (optional)

If the project root has `DESIGN_MEMORY.md`, treat it as sticky preferences:

```markdown
# Design Memory
## Brand Tone
- Adjectives: …
## Layout & Spacing
- Density: compact | comfortable | spacious
## Interaction Patterns
- Forms / modals / tables: …
## Repo Conventions
- Primitives to reuse: …
```

Do **not** create this file unless the user asks to capture decisions. When finalizing a large exploration, offering to write/update it is fine.

## Build plan snippet

After the user picks an approach (non-trivial work):

- Axis chosen + one-line rationale  
- Likely files  
- Required UI states  
- Tokens / primitives to reuse  
- A11y notes that affect structure (e.g. destructive confirm)

Then hand off to domain skills — no temporary `__design_lab` routes unless explicitly requested.

## Quick decision framework

Prefer the option that is clearer, faster to complete the job, consistent with the app, accessible, calm, specifically labeled, and recoverable (undo/back/cancel).
