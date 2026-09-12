# Good UI principles

This guide turns user-provided craft notes, distilled from Adrian Kuleszo's UI teaching, into review prompts for this pack. It is a source of **inspiration and heuristics**, not a new standards authority or ownership claim.

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

## Color

Build semantic roles and tonal steps from project tokens. Achromatic neutrals and tinted neutrals are both valid: choose according to the brand, surrounding materials, contrast needs, and established tokens. Do not tint grays merely to satisfy a style recipe.

Designing in grayscale can expose weak hierarchy before color is added. A proportional palette mnemonic such as 60/30/10 may help exploration, but it is not a composition rule. Status meaning must not rely on hue alone. Route contrast and non-color requirements to `accessibility`; route palette construction to `design-color` and `tokens`.

## Shadows and gradients

Use elevation only when it clarifies layering or interaction. A coherent light direction, restrained opacity, borders on dark surfaces, and fewer competing shadows are useful recommendations—not proof that a particular shadow is correct.

Gradients can support hierarchy or atmosphere when the product language calls for them. Related hues often blend more quietly, while contrasting stops can be deliberately expressive. Verify banding, text contrast, performance, and competition with content in the render. Avoid gradient decoration on every surface.

## Typography

Use named project type roles, no more than two families without a deliberate brand reason, one page-level heading, and a sequential heading structure. Prefer weight, size, spacing, and measure that produce a clear ladder over arbitrary one-off values.

Fallback body sizes and line heights are heuristics only; language, font metrics, zoom, platform, and density change what works. Verify wrapping, truncation, numerals, long labels, localization, and text zoom. Canonical owner: `design-typography`; semantic heading requirements belong to `accessibility`.

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

## Cards

Use a card only when the content is one bounded object or action. Align repeated content where scanning benefits, but do not force unequal content into identical heights without considering clipping and localization. Image ratios, truncation, and bottom-aligned actions are conditional recipes for comparable collections, not requirements for every card.

Make the whole card interactive only when it has one destination and semantics remain sound. Otherwise expose distinct actions and target sizes. Spacing ranges such as 16–24px inside a card are heuristic fallbacks. Canonical owners: `components`, `design-surfaces`, and `responsive`.

## Hero

Choose composition from content: an F-like reading path may suit text-heavy material; a Z-like path may suit a concise visual story. State the product value in plain language, make one CTA primary, and add secondary action or social proof only when evidence and the journey support them.

A glimpse of the next section can suggest continuation, but must not compromise the hero's message at short viewports. A complete landing page follows the `marketing` section stack rather than ending after the hero.

## Modal and destructive actions

Provide a clear close or cancel path unless interruption would corrupt a critical operation. Use plain affirmative wording, identify the affected object, and distinguish reversible actions from destructive ones. Confirmation dialogs are appropriate when consequence and error cost justify interruption—not for every delete-shaped control.

Long operations need progress and recovery; destructive focus, keyboard behavior, labeling, and escape semantics route to `accessibility`, `components`, and `content-design`.

## Dropdown and search

Choose radios, chips, native select, custom select, combobox, or a searchable sheet from option count, comparison needs, platform, and accessibility—not from a fixed threshold. Long lists may need filtering, grouping, virtualization, or a mobile sheet. Search should support correction and useful recovery; recent queries and autocomplete are conditional on privacy, data quality, and product value.

Verify default, open, focus, selected, disabled, loading, empty, no-results, and keyboard states as applicable. Canonical owners: `components`, `data-fetching`, and `accessibility`.

## Navigation

Use short, recognizable labels, a visible current-location state, and a reachable home route. Sticky headers need enough separation from content; border, fill, blur, or shadow are contextual options rather than a mandated recipe. Keep navigation depth and link count aligned with the information architecture. Shell conventions belong to `app-shell`; responsive and keyboard behavior belong to their canonical owners.

## Style system

Document semantic color, type, spacing, radius, elevation, motion, and component states as a shared system. Reuse components at the level that allows fixes to propagate, but do not force an atomic taxonomy when the project's architecture uses another coherent model.

Before adding a token, confirm it represents a repeated decision. Before adding a component, confirm it has a stable responsibility and public contract. The system is a means of consistency and change control, not a mandate to abstract every value.

## Review summary

1. Identify a concrete visual or interaction risk rather than scoring “taste.”
2. Classify the proposed rule with `references/evidence-policy.md`.
3. Prefer project defaults and canonical domain guidance.
4. Apply a conditional recommendation or heuristic only where its context matches.
5. Render the target states and viewports, then report observed evidence and any waiver.
