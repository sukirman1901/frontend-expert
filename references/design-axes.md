# Design axes & exploration

Lightweight patterns adapted from [0xdesign design-lab](https://github.com/0xdesign/design-plugin) for this pack’s **text-first** judgment — not a browser Design Lab.

Used by: `frontend-judgment`.

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

1. Prefer project design system / CSS variables / Tailwind theme
2. Skim 2–3 real components: Button, Card, Form/Input
3. Note: radius, padding, shadow, type sizes, border treatment
4. Only then pick a pack preset if the project has **no** system

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
