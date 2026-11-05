# UI craft tuning: sampled verification

Date: 2026-11-05. Scope: existing direction, foundations, components,
marketing, prototype and quality-loop owners; no additional skills.

## Method

Five fixed synthetic briefs (dispatch, product, availability, chart, assistant)
shared facts, tokens and requirements across independent baseline/tuned agents.
A further fresh generation tested the final availability/assistant guidance.
Generated fixtures were preserved, not manually repaired to make comparisons
pass. Browser checks used una/Chrome at 320, 768, 1024 and 1440 CSS pixels.
Initial desktop/mobile screenshots were inspected for all five pages; the final
two pages were inspected at all four widths.

This is sampled application evidence, not a causal experiment, aesthetic score,
cross-browser certification or guarantee about future generated applications.

## Observations

- Tuned mobile filters fit, native time values remain readable, and chart labels
  no longer shrink with the entire desktop SVG. Missing chart observations stay
  missing. Product composition was already fact-grounded in the baseline.
- In the final form, enabled desktop day rows measured 162px versus 186px in the
  preceding tuned run at 1440px. This is row geometry, not a claim that the whole
  page is shorter. Mobile fields remain stacked; extra actions add vertical length.
- Final assistant sources precede acceptance/composer in DOM and reading order.
  They are inside a keyboard-reachable review scroller, so not every source is
  visible initially. Tab then Space opened the supplied inspection excerpt.
- All eight final page/viewport checks had one h1 and no document overflow.
  Local readability was inspected separately; document geometry alone is not
  sufficient visual acceptance.

## Exercised states

- Form: keyboard-edited 21:00–17:00 rejected with field-level error; 21:00–22:00
  correction cleared invalid state. Failed save retained both edited values;
  subsequent save reached the saved state under reduced-motion emulation.
- Assistant: Stop retained partial text; Retry completed the supplied draft;
  acceptance required its own action. Simulated error and successful recovery
  were exercised with reduced motion enabled.
- While inspecting an expanded source, stream growth preserved review scrollTop
  at 32px; Jump to latest moved it to 283px and hid the jump control. This covers
  source-inspection reading intent, not every wheel/touch interaction.
- Earlier five-page checks exercised chart refresh (92%/90%, missing preserved),
  product sample opening, and dispatch selection.

## Verification boundaries

Fixed-delay assertions sometimes sampled pending states; bounded state waits
resolved these timing failures. The initial upward-arrow scroll test did not
establish actual upward movement and remains inconclusive. Keyboard source
inspection supplied a separate positive reading-position test; it does not
retroactively turn the arrow test into a pass. Native Enter activation through
the harness was inconclusive; Space activation was observed.

Reduced-motion media state and functional endpoints were checked. Temporal
smoothness, full keyboard traversal, screen-reader behavior, wheel/touch stream
interruption, zoom and cross-browser compatibility were not verified. Initial
form blur validation moved layout before a pointer activation; a fresh action
reached validation. Do not claim pointer-target stability from these fixtures.

A fresh child session discovered the installed `frontend-expert` native entry
without a repository path in its prompt, then used foundations/tokens/responsive/
forms guidance for a schedule-editor planning request. This supports that entry
and response, not all automatic triggers or a top-level client restart.

Package smoke, adapter/routing contracts and whitespace checks are structural
evidence only. Review found no blocking package defect; ambiguous wording that
could require inventing regressions was corrected. The remaining fixture and
coverage limits above are explicit rather than a claim of complete UI acceptance.
