# Good UI principles

This guide turns user-provided craft notes, distilled from Adrian Kuleszo's UI teaching and Pixsel Academy, into review prompts for this pack. The Pixsel Academy material is treated as craft heuristic and inspiration, not a new standards authority or ownership claim.

Use it with `references/anti-patterns.md`. Start with relationships and product intent; use code markers to find likely problems, then inspect the actual interface.

## Evidence classification and decision hierarchy

Apply guidance in this order:

1. Follow explicit product, legal, brand, and user requirements.
2. Use the existing project system first: its tokens, components, content model, and conventions.
3. Route formal accessibility requirements to `accessibility` and `references/accessibility-checklist.md`; route each design domain to its canonical owner.
4. Use the recipes below only as conditional recipes when their stated context applies.
5. Treat numeric values as fallback heuristics, not universal truths, and verify them in the rendered context.

| Guidance kind | Evidence class | How to use it |
|---|---|---|
| Existing token or component behavior | Project default | Preserve it unless the task explicitly changes the system |
| Required contrast, semantics, or keyboard behavior | Standard | Resolve and cite through the canonical accessibility owner |
| Common component hierarchy or interaction pattern | Recommendation | Apply when it supports the product task; record meaningful exceptions |
| Spacing, size, shadow, and layout numbers in this guide | Heuristic | Use only as fallback starting points and tune from rendered evidence |
| Visual character drawn from the craft notes | Inspiration | Extract useful attributes; never present it as compliance |

## Verification contract

Visual quality claims require actual rendered evidence: inspect the target component or page at the relevant viewport and state, with browser, screenshot, or equivalent render provenance. Source inspection cannot prove alignment, legibility, balance, hierarchy, clipping, or responsive success.

Check loading, error, empty, focus, hover, pressed, disabled, and destructive states when relevant. If a state or viewport was not rendered, report it as not evaluated rather than passing it.

## Spacing and layout

Prefer the project's spacing scale. If none exists, a small rhythm such as 4- or 8-unit increments can be a useful heuristic, but content, type metrics, target size, and grid relationships decide the final values.

| Signal | Conditional response |
|---|---|
| Nearby values differ without a relationship | Map them to a short documented spacing scale |
| Every surface has the same generous padding | Separate tight, related groups from larger section boundaries |
| Siblings that should align have mismatched edges or heights | Establish a container, grid, or alignment rule before adjusting numbers |
| Layout was tuned only on a wide screen | Work mobile-first and verify at the pack's responsive viewports |

A centered desktop content width around 1200px, 16px mobile insets, or similar familiar values may help when no project constraint exists. They remain fallbacks; density and content can justify other choices. Canonical owners: `design-foundations` and `responsive`.

Align related controls and copy to shared anchors. A single-column form is a useful default for straightforward completion, not universal: comparison, short coupled fields, and wide data tasks can justify another structure. Dividers should mark real boundaries; use proximity and whitespace for ordinary grouping.

For long-form reading, roughly 45–75 characters per line, often around 60–70ch, is a heuristic to test with the actual typeface and language—not a limit for tables, labels, or dashboards. Avoid decorative logo repetition, while allowing legitimate partner or proof marks where they support trust. Avoid nested prose scroll regions; bounded data, code, and list scroll may be valid when dimensions, focus, and affordances are clear. A continuation peek and Gutenberg-style reading flow are inspiration only, never placement laws.

## Color

Build semantic roles and tonal steps from project tokens. Achromatic neutrals and tinted neutrals are both valid: choose according to the brand, surrounding materials, contrast needs, and established tokens. Do not tint grays merely to satisfy a style recipe.

Designing in grayscale can expose weak hierarchy before color is added. A proportional palette mnemonic such as 60/30/10 may help exploration, but it is not a composition rule. Status meaning must not rely on hue alone. Route contrast and non-color requirements to `accessibility`; route palette construction to `design-color` and `tokens`.

Literal black and white may be correct, or near-black and off-white may reduce glare; this choice is conditional on project tokens, display context, surrounding luminance, and measured contrast. Dark-mode tone ranges and the number of selection colors are similarly contextual—not fixed palettes or numeric caps. Measure the actual foreground/background pairs in each theme.

Text over imagery may need an overlay, scrim, deliberate crop, solid backing, or image replacement. Choose the least disruptive treatment that preserves meaning, then measure rendered contrast at representative crops and responsive viewports; a source color value alone is insufficient.

## Shadows and gradients

Use elevation only when it clarifies layering or interaction. A coherent light direction, restrained opacity, borders on dark surfaces, and fewer competing shadows are useful recommendations—not proof that a particular shadow is correct.

Gradients can support hierarchy or atmosphere when the product language calls for them. Related hues often blend more quietly, while contrasting stops can be deliberately expressive. Verify banding, text contrast, performance, and competition with content in the render. Avoid gradient decoration on every surface.

## Typography

Use named project type roles, no more than two families without a deliberate brand reason, one page-level `<h1>`, and sequential lower heading levels. Prefer weight, size, spacing, and measure that produce a clear ladder over arbitrary one-off values.

Fallback body sizes and line heights are heuristics only; language, font metrics, zoom, platform, and density change what works. Verify wrapping, truncation, numerals, long labels, localization, and text zoom. Canonical owner: `design-typography`; semantic heading requirements belong to `accessibility`.

The pack's limit of two typefaces remains project- and brand-aware: use fewer when one family covers the roles, and request an explicit waiver when brand expression genuinely needs more.

## Content and microcopy

Protect product truth. Never use invented urgency, inventory scarcity, customer counts, popularity, or a “Most Popular” claim. Show such statements only when current product data supports them and the wording accurately reflects what was measured.

Actions should use meaningful verbs and labels that describe the outcome. Destination navigation labels may omit verbs when the noun clearly names the place, such as “Order history”; this is different from an action control that must explain what it does.

Dialog actions need unambiguous outcome labels tied to the affected object. Avoid generic pairs such as “Cancel / OK” and the double-negative `Don't Cancel` pattern; prefer direct labels such as “Keep upload” and “Cancel upload.” Canonical owner: `content-design`.

## Buttons

- Preserve the project's primary, secondary, and tertiary action hierarchy.
- Write specific verb-led labels when that makes the result clearer; avoid context-free “Click here” or “Submit.”
- Choose leading or trailing icons by meaning and reading direction, not a fixed icon-position rule.
- Provide relevant hover, focus, pressed, disabled, and loading states.
- Treat 40–48px target recipes as contextual fallbacks; use the canonical accessibility target-size requirement and verify actual hit areas.
- Make primary form and action-row CTAs full-width below 768px, per this pack's product convention.

Canonical owners: `components`, `content-design`, `polish`, and `accessibility`.

## Forms

Keep labels available independently of placeholder text, use appropriate input semantics, retain entered values after recoverable errors, and place actionable validation near its field. Decide between on-change, on-blur, and submit validation according to error cost and interruption risk.

Marking optional fields can reduce clutter when most fields are required, but explicit required indicators may be clearer in mixed or regulated forms. Split long forms only when steps form meaningful groups; otherwise splitting adds navigation cost. Always verify pending, failure, recovery, and success. Canonical owners: `forms`, `content-design`, and `accessibility`.

## Interaction and input patterns

Choose a choice control from comparison needs, available space, semantics, platform behavior, and accessibility—not a fixed option count. Radios or chips can expose comparable options; a select or combobox can conserve space; neither is automatically correct.

Use a slider for an approximate range when direct manipulation improves comprehension, and provide a precise alternative when exact entry matters. Input masks must preserve paste, autofill, mid-string edit, deletion, and locale-aware formats; a visual template that breaks those behaviors is a regression.

Swipe actions require a visible single-pointer alternative and a keyboard alternative. Inline errors route to `forms` and `accessibility`, including focus, association, and recovery behavior. Multi-step indicators belong only to real sequences with meaningful position and progress, not a single page split for decoration.

Nested radius follows the canonical conditional relation `outer ≈ inner + inset` when concentric geometry applies; do not halve the inner radius blindly. Pointer target guidance routes to the canonical 24px accessibility standard and this pack's 44px recommendation, with spacing and exceptions verified in the rendered component.

## Cards

Use a card only when the content is one bounded object or action. Align repeated content where scanning benefits, but do not force unequal content into identical heights without considering clipping and localization. Image ratios, truncation, and bottom-aligned actions are conditional recipes for comparable collections, not requirements for every card.

Make the whole card interactive only when it has one destination and semantics remain sound. Otherwise expose distinct actions and target sizes. Spacing ranges such as 16–24px inside a card are heuristic fallbacks. Canonical owners: `components`, `design-surfaces`, and `responsive`.

## Hero

Choose composition from content: an F-like reading path may suit text-heavy material; a Z-like path may suit a concise visual story. State the product value in plain language, make one CTA primary, and add secondary action or social proof only when evidence and the journey support them.

A glimpse of the next section can suggest continuation, but must not compromise the hero's message at short viewports. A complete landing page follows the `marketing` section stack rather than ending after the hero.

## Pricing and choice architecture

Emphasize a plan only from verified user value or product data, such as a documented fit for the target segment or a current measured preference. A “Most Popular” badge must never be fabricated; neither should artificial scarcity or urgency be used to steer selection.

Keep a transparent comparison of features and prices, disclose material differences, and avoid dark patterns such as preselected costly options or obscured renewal terms. Use CTA hierarchy plus measured contrast on the actual card and theme; do not blindly apply the primary token when another semantic role or treatment communicates the choice more accurately.

## Modal and destructive actions

Provide a clear close or cancel path unless interruption would corrupt a critical operation. Use plain affirmative wording, identify the affected object, and distinguish reversible actions from destructive ones. Confirmation dialogs are appropriate when consequence and error cost justify interruption—not for every delete-shaped control.

Long operations need progress and recovery; destructive focus, keyboard behavior, labeling, and escape semantics route to `accessibility`, `components`, and `content-design`.

## Dropdown and search

Choose radios, chips, native select, custom select, combobox, or a searchable sheet from option count, comparison needs, platform, and accessibility—not from a fixed threshold. Long lists may need filtering, grouping, virtualization, or a mobile sheet. Search should support correction and useful recovery; recent queries and autocomplete are conditional on privacy, data quality, and product value.

Verify default, open, focus, selected, disabled, loading, empty, no-results, and keyboard states as applicable. Canonical owners: `components`, `data-fetching`, and `accessibility`.

## Navigation

Use short, recognizable labels, a visible current-location state, and a reachable home route. Sticky headers need enough separation from content; border, fill, blur, or shadow are contextual options rather than a mandated recipe. Keep navigation depth and link count aligned with the information architecture. Shell conventions belong to `app-shell`; responsive and keyboard behavior belong to their canonical owners.

## Cognitive load and navigation

Reduce choices contextually by grouping, progressive disclosure, useful defaults, or removing genuinely low-value paths; do not hide necessary comparison. Offer “Other” with free text only when the domain permits an unmodeled answer and the product can handle it safely.

Use a danger semantic token for destructive actions plus non-color cues such as explicit wording, iconography, placement, or confirmation proportional to risk. Serial-position research can inform evaluation, but never put important navigation items at corners from serial-position alone; information architecture, platform convention, reach, and frequency take precedence.

Prefer at most two typefaces in line with project and brand needs. Reduce styles and choices when they compete without adding meaning, not merely to hit a numeric score.

## Style system

Document semantic color, type, spacing, radius, elevation, motion, and component states as a shared system. Reuse components at the level that allows fixes to propagate, but do not force an atomic taxonomy when the project's architecture uses another coherent model.

Before adding a token, confirm it represents a repeated decision. Before adding a component, confirm it has a stable responsibility and public contract. The system is a means of consistency and change control, not a mandate to abstract every value.

## Review summary

1. Identify a concrete visual or interaction risk rather than scoring “taste.”
2. Classify the proposed rule with `references/evidence-policy.md`.
3. Prefer project defaults and canonical domain guidance.
4. Apply a conditional recommendation or heuristic only where its context matches.
5. Render the target states and viewports, then report observed evidence and any waiver.
