# UX / UI foundations

Short theory reference for product UI. Prefer project tokens and judgment axes over inventing a new look. Deep craft: `ui-feel`, `anti-patterns`, `accessibility-checklist`.

## UX frameworks (most used)

### Nielsen’s 10 usability heuristics (summary)

1. **Visibility of system status** — feedback in reasonable time (loading, saved, progress)
2. **Match the real world** — familiar words and conventions
3. **User control & freedom** — cancel, back, undo, escape hatches
4. **Consistency & standards** — same words/patterns mean the same thing
5. **Error prevention** — constrain bad input; confirm destructive actions
6. **Recognition rather than recall** — visible options, don’t force memory
7. **Flexibility & efficiency** — shortcuts/defaults for experts; simple path for novices
8. **Aesthetic & minimalist design** — every extra element competes for attention
9. **Help recover from errors** — plain language + constructive next step
10. **Help & documentation** — short, task-focused when needed

### Don Norman (interaction basics)

| Idea | Meaning |
|------|---------|
| Affordance | What actions seem possible |
| Signifier | Cues that show *where* to act |
| Mapping | Controls relate spatially to effects |
| Feedback | Every action gets a perceivable response |
| Conceptual model | User can form a mental picture of how it works |

### Gestalt (layout grouping)

| Principle | Use |
|-----------|-----|
| Proximity | Related items closer; sections farther |
| Similarity | Same style = same kind of thing |
| Continuity | Eye follows aligned paths |
| Closure | Incomplete shapes still read as wholes |
| Figure–ground | Primary content separates from chrome |

### Cognitive load

- Limit simultaneous choices (nav ~5–7; decisions ~3–4)
- Progressive disclosure — show what’s needed now
- Chunk long forms/steps
- Hierarchy guides attention (size, weight, contrast, position)

### Fitts & Hick (interaction)

- **Fitts:** bigger + closer targets are faster → CTAs and hit areas matter (`ui-feel`: 44/40px)
- **Hick:** more options → slower decisions → hide advanced behind progressive disclosure

### Quick decision check

Prefer options that are: **clear · fast · consistent · accessible · calm · specific · recoverable**.

---

## UI visual system (product)

| Area | Rule of thumb |
|------|----------------|
| Hierarchy | One primary focus per view; weight often beats size |
| Spacing | Stick to a scale (4/8px or `0.25rem`); related = tight, sections = loose |
| Type | ≤2 families; body ~60–75ch; clear h1→body ladder; one h1/page |
| Radius | 2–3 values; nested = concentric (`outer = inner + padding`) |
| Elevation | Pick borders *or* soft shadows as the language — stay consistent |
| States | default · hover · focus · active · disabled · loading · empty · error |
| Motion | Feedback/continuity only; honor `prefers-reduced-motion` |

Exploration axes (hierarchy / layout / density / interaction / expression): `design-axes.md`.

---

## Color theory for product UI

### Building blocks

| Term | Role in UI |
|------|------------|
| Hue | Brand / semantic identity |
| Saturation | Energy; high sat = loud — use sparingly |
| Lightness (value) | Hierarchy, dark mode, contrast — usually more important than hue |
| Temperature | Warm vs cool mood |

### Harmonies (use lightly)

| Scheme | Product use |
|--------|-------------|
| Monochromatic | Safest for dense apps |
| Analogous | Soft brand without noise |
| Complementary | Strong accent vs neutrals (CTA) — one accent, not a rainbow |
| Triadic | Rare in SaaS; easy to overcook |

### Product palette recipe

1. **Neutrals first** — background, surface, border, text primary / secondary / muted  
2. **One primary accent** — links + primary CTA  
3. **Semantics** — success, warning, danger, info (meaning, not decoration)  
4. **States** — hover/focus/disabled via lightness or opacity on the same tokens  
5. **Never color alone** — pair with icon/text for errors and status  

### Contrast (WCAG 2.1 AA)

| Content | Minimum ratio |
|---------|----------------|
| Normal text | **4.5:1** |
| Large text (≈18px+ or 14px+ bold) | **3:1** |
| UI components / graphical objects | **3:1** |

Focus rings need visible contrast too. Details: `accessibility-checklist.md`.

### Dark mode

- Don’t merely invert light theme  
- Prefer deeper surfaces and slightly softer text contrast  
- Keep semantic hues recognizable; retune lightness  
- Theme chrome (`theme-color`, `color-scheme`) when relevant  

### Tokens > raw hex

Ship colors as CSS variables (`--background`, `--primary`, `--destructive`, …).  
OKLCH/HSL make lightness adjustments easier than guessing hex. Pack presets: `tokens/`.

### Anti-patterns (color)

- Purple/indigo defaults with no brand reason → `anti-patterns.md`  
- Many competing accents / rainbow dashboards  
- Low-contrast muted text that fails AA  
- Destructive actions that rely on red alone  

---

## Map to this pack

| Concern | Skill / reference |
|---------|-------------------|
| Choose direction | `frontend-judgment`, `design-axes.md` |
| Apply palette / type / space | `design-tokens`, `tokens/` |
| Kill generic AI look | `anti-ai-slop`, `anti-patterns.md` |
| Micro craft | `ui-feel`, `ui-feel.md` |
| Contrast, focus, labels | `accessibility`, `accessibility-checklist.md` |
| Motion timing | `motion`, `motion.md` |

## Sources (classic)

Nielsen heuristics · Norman *Design of Everyday Things* · Gestalt psychology · Fitts/Hick · WCAG · modern product systems (Linear, Stripe, Apple HIG patterns as *references*, not skins to copy).
