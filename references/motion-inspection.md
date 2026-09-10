# Motion inspection

Skill entry: `skills/motion-inspection/SKILL.md`.
Implementing motion belongs to `motion`. Decorative spam belongs to `anti-slop-design`. Conformance class belongs to `accessibility`. This file owns **watching what the animation actually does**.

Numeric durations in `references/motion.md` remain **heuristics**. Do not promote them to a pass/fail law here.

## Playback protocol

Inspect **this** transition. If any beat was not observed, write `Not verified` — do not infer it from source.

| Beat | Look for |
|------|----------|
| Start | Delay, flicker, layout jump, missing first frame |
| Mid | Easing (ease-out vs bounce), overshoot, opacity vs transform |
| End | Resting position, leftover transform, focus order after move |
| Interrupt | Click, Esc, route change, hover-out mid-way — does it reverse or stick |
| Reduced motion | `prefers-reduced-motion: reduce` actually collapses to opacity/instant |
| Loop | Autoplay that cannot be paused (hand 2.2.2 to `accessibility` if claimed) |

```yaml
principle: Motion quality is judged from playback, not source duration
classification: recommendation
recommendation: start, mid, end, interrupt, and reduced-motion are observed or marked Not verified
applies_when:
  - explaining, auditing, or reversing existing UI animation
exceptions:
  - motion not in scope; static surfaces
verification:
  - browser play, recording, or explicit Not verified
last_verified: 2026-09
```

## Reverse-engineer unnamed motion

Do not invent a fifth family. Match `references/motion-families.md`.

| Observed | Likely family | Next |
|----------|---------------|------|
| Panel enters from edge | Reveal & Wipe (`drawer-slide`) | Confirm interrupt + reduced-motion |
| Staggered fade of cards | Reveal (`fade-up`) or Grid | Count items vs viewport budget |
| Headline word-by-word | Text Motion | Not for forms/settings |
| Infinite logo strip | Carousel & Continuous Flow | Pause control; reduced-motion freeze |
| Device layer vs copy | Hero Section Motion | Max one signature on marketing |
| Unnamed spring on every tile | Hover & Interaction spam | `anti-slop-design` budget |

If nothing in the catalog fits, say **unnamed one-off** and recommend a named pattern via `motion` — do not mint a parallel vocabulary.

## Defect catalog

| Tell | Why it fails inspection |
|------|-------------------------|
| Source-only pass | Duration in CSS ≠ what the user sees |
| Uninterruptible | Mid-click still finishes a long ease |
| Layout thrash | Animating `top`/`height` instead of transform |
| Meaning-only-in-motion | State exists only as a color flash or slide |
| Ignore reduced-motion | Playback still moves under the OS setting |
| Stacked families | Hero + Text + 3D + Spotlight in one viewport |
| Orphan easing | Bounce/spring on a dense settings form |

## Review output

```markdown
| Transition | Beats observed | Pattern | Verdict |
|------------|----------------|---------|---------|
| Drawer | start/end; interrupt Not verified | drawer-slide | Needs playback |
```

Do not mark inspection done with “feels smooth.” Do not claim WCAG unless `accessibility` ran.

Authorship boundary: `NOTICE.md`.
