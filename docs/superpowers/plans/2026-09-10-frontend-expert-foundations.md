# Frontend Expert Foundations Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add evidence-led typography, color, surfaces, and content-design coverage while preserving every existing public skill identifier and command.

**Architecture:** Keep triggerable `SKILL.md` files concise and place durable theory, source provenance, and recipes in top-level `references/`. Extend the existing flat discovery model, route new domains through `AGENTS.md`, commands, and personas, and make the smoke test the executable integrity contract. Existing names stay stable; taxonomy changes are documentation-only in this phase.

**Tech Stack:** Markdown skill files, JSON plugin manifests, Bash smoke tests, CSS/W3C/WCAG references.

---

### Task 1: Create the failing integrity contract

**Files:**
- Modify: `scripts/smoke-test.sh`
- Create: `evals/design-typography.md`
- Create: `evals/design-color.md`
- Create: `evals/design-surfaces.md`
- Create: `evals/content-design.md`

- [ ] **Step 1: Add expected skill names and reference/eval checks**

Add these entries to `EXPECTED_SKILLS`:

```bash
design-typography
design-color
design-surfaces
content-design
```

Add explicit existence checks for their four reference and four eval files, plus `references/evidence-policy.md`, `references/source-ledger.md`, and `NOTICE.md`.

- [ ] **Step 2: Write four behavioral evals before the skills exist**

Each eval must include Scenario, Expected behavior, and binary Pass criteria. The cases must reject: arbitrary font choice, raw palette invention, unconditional radius formulas, and generic AI copy.

- [ ] **Step 3: Run the smoke test and verify RED**

Run: `./scripts/smoke-test.sh`

Expected: FAIL because the four skill files and six references/notice files do not exist.

- [ ] **Step 4: Commit the red contract**

```bash
git add scripts/smoke-test.sh evals
git commit -m "test: define evidence-led design skill coverage"
```

### Task 2: Add evidence policy, source ledger, and attribution

**Files:**
- Create: `references/evidence-policy.md`
- Create: `references/source-ledger.md`
- Create: `NOTICE.md`
- Modify: `references/README.md`
- Modify: `skills/writing-skills/SKILL.md`

- [ ] **Step 1: Add the evidence classification contract**

Document Standard, Product requirement, Project default, Enterprise pattern, Recommendation, Heuristic, Inspiration, and Waiver. Require project-first precedence, current primary sources for version-sensitive claims, context/exceptions, verification, and `last_verified`.

- [ ] **Step 2: Add the initial source ledger**

Record W3C CSS Backgrounds, WCAG 2.2, web.dev Web Vitals, Atlassian foundations, IBM Carbon, Jakub Krehel Skills, OKLCH Skill, and the nested-radius article. Separate normative, enterprise, craft, and inspiration sources.

- [ ] **Step 3: Add attribution**

Create `NOTICE.md` identifying MIT-licensed adapted ideas from Jakub Krehel and retaining the required copyright statement. State that the pack rewrites and contextualizes the material rather than presenting external heuristics as standards.

- [ ] **Step 4: Integrate author guidance**

Add evidence classification and source-ledger checks to `skills/writing-skills/SKILL.md`; keep its main workflow under 150 lines by linking depth.

- [ ] **Step 5: Run smoke test**

Expected: still FAIL only for the four missing domain skills/references and incomplete registrations.

### Task 3: Add `design-typography`

**Files:**
- Create: `skills/design-typography/SKILL.md`
- Create: `references/design-typography.md`

- [ ] **Step 1: Write the concise trigger skill**

The skill owns font choice, type roles/scales, measure, line-height, variable fonts/OpenType, webfont behavior, wrapping, truncation, numerics, language, and bidi rendering. It hands semantic headings to `accessibility` and words to `content-design`.

- [ ] **Step 2: Write the evidence-led depth reference**

Include project-font precedence, role-based typography, `woff2`, variable-font property preference, content-length verification, 60–75ch as a recommendation rather than a universal standard, mobile input zoom caveats, and reachable full text when truncation hides meaningful content.

- [ ] **Step 3: Verify the eval contract manually**

Confirm `evals/design-typography.md` maps each Pass criterion to a MUST or workflow step in the skill/reference.

### Task 4: Add `design-color`

**Files:**
- Create: `skills/design-color/SKILL.md`
- Create: `references/design-color.md`

- [ ] **Step 1: Write the domain boundary**

The skill owns palette construction, semantic roles, OKLCH workflow, dark-mode derivation, contrast pairing, and gamut/fallback handling. `design-tokens` owns token-source selection; `accessibility` owns conformance classification.

- [ ] **Step 2: Add context-sensitive color guidance**

Document OKLCH as a recommended working color space with sRGB fallback where targets require it. Require measured foreground/background contrast; do not hardcode lightness-only thresholds as proof of compliance. Distinguish WCAG conformance from optional APCA analysis.

- [ ] **Step 3: Verify the eval contract manually**

Confirm the skill rejects invented raw palettes when a project system exists and reports the verification method.

### Task 5: Add `design-surfaces`

**Files:**
- Create: `skills/design-surfaces/SKILL.md`
- Create: `references/design-surfaces.md`

- [ ] **Step 1: Write surface ownership and routing**

Own radius, borders, elevation, shadows, overlays, dividers, and nested surface hierarchy. Hand motion to `motion`, color values to `design-color`, and token selection to `design-tokens`.

- [ ] **Step 2: Document concentric radius accurately**

Use this conditional recipe:

```css
.outer {
  --inner-radius: 0.75rem;
  --inset: 0.5rem;
  padding: var(--inset);
  border-radius: calc(var(--inner-radius) + var(--inset));
}
.inner { border-radius: var(--inner-radius); }
```

Classify it as a heuristic for nested surfaces sharing a visual center. Cover asymmetric insets, pills/circles, border thickness, browser radius reduction, dark-mode shadows, and optical verification.

- [ ] **Step 3: Verify the eval contract manually**

Confirm the eval fails any answer that says the formula is universal.

### Task 6: Add `content-design`

**Files:**
- Create: `skills/content-design/SKILL.md`
- Create: `references/content-design.md`

- [ ] **Step 1: Write the product-copy owner**

Own labels, CTA text, help, errors, empty states, confirmations, onboarding, voice, localization readiness, and AI-writing cleanup.

- [ ] **Step 2: Add recovery- and action-led recipes**

Require specific actions, plain language, consistent terminology, recoverable errors, consequence-first destructive confirmation, and realistic content. Ban fake metrics, generic hype, and filler copy.

- [ ] **Step 3: Verify the eval contract manually**

Confirm the eval demands concrete before/after copy and preserves product facts.

### Task 7: Integrate routing, personas, plugin, and lifecycle

**Files:**
- Modify: `AGENTS.md`
- Modify: `plugin.json`
- Modify: `docs/pillars.md`
- Modify: `docs/pack-layers.md`
- Modify: `references/fe-lifecycle.md`
- Modify: `references/compliance-gates.md`
- Modify: `agents/ui-developer.md`
- Modify: `agents/design-reviewer.md`
- Modify: `commands/ui.md`
- Modify: `commands/design.md`
- Modify: `commands/audit.md`

- [ ] **Step 1: Add intent routes and domain ownership**

Route font/type/wrapping prompts to `design-typography`, palette/dark-mode/contrast prompts to `design-color`, card/modal/shadow/radius prompts to `design-surfaces`, and UI copy/error/empty-state wording to `content-design`.

- [ ] **Step 2: Insert domain skills at the correct order**

Build order becomes tokens → typography/color/surfaces/content when relevant → components → responsive → motion → polish/a11y. Review order places accessibility/layout/content/type/color/surfaces before final polish.

- [ ] **Step 3: Register all new skill paths**

Add four paths to `plugin.json` and raise the package version to `1.2.0`.

- [ ] **Step 4: Extend conventions without forcing irrelevant reports**

Add a compact `Design domains` line accepting applied skill names or `n/a`. Keep specialized details in their owning checklists.

- [ ] **Step 5: Sync command adapters**

Run: `./scripts/sync-commands.sh`

Expected: `sync-commands: OK`.

### Task 8: Correct standards and documentation drift

**Files:**
- Modify: `SKILL.md`
- Modify: `skills/frontend-expert/SKILL.md`
- Modify: `README.md`
- Modify: `CHANGELOG.md`
- Modify: `docs/AUDIT.md`
- Modify: `skills/accessibility/SKILL.md`
- Modify: `references/accessibility-checklist.md`
- Modify: `agents/design-reviewer.md`
- Modify: `references/monitoring.md`

- [ ] **Step 1: Add the Start here section**

Document `frontend-expert`, `frontend-judgment`, and `ui-quality-loop` as the three primary entry points.

- [ ] **Step 2: Correct skill counts**

Replace stale 22/25 claims with 29 where referring to the post-change suite. Do not alter historical changelog counts for released versions.

- [ ] **Step 3: Upgrade the accessibility baseline**

Use WCAG 2.2 AA as the default for new work; explain that project/legal requirements may be pinned to 2.1. Add focus-not-obscured, dragging alternatives, target-size minimum, redundant entry, and accessible authentication coverage.

- [ ] **Step 4: Replace FID examples with INP**

Replace `onFID` with `onINP` and ensure the documented current Core Web Vitals are LCP, INP, and CLS. Align PII examples with the existing scrub-PII rule.

- [ ] **Step 5: Add the 1.2.0 changelog**

List new skills, evidence policy, standards corrections, compatibility policy, source attribution, and the new eval range.

### Task 9: Verify and finish

**Files:**
- Modify: `evals/README.md`
- Modify: `scripts/smoke-test.sh` if a discovered integrity gap requires it

- [ ] **Step 1: Update eval indexing**

Add the four new scenarios as E24–E27 and correct any stale eval-count claim.

- [ ] **Step 2: Run targeted drift searches**

Run:

```bash
rg -n "WCAG 2\.1 AA|onFID|suite of 22|Skills \(22\)|25 skills" . \
  -g '*.md' -g '*.json' -g '*.sh'
```

Expected: only intentional historical or compatibility mentions remain.

- [ ] **Step 3: Run the complete integrity suite**

Run: `./scripts/smoke-test.sh`

Expected: `smoke-test: PASSED` with no FAIL lines.

- [ ] **Step 4: Review the diff**

Run: `git diff --check` and `git status --short`.

Expected: no whitespace errors; only planned files changed.

- [ ] **Step 5: Commit the implementation**

```bash
git add AGENTS.md CHANGELOG.md NOTICE.md README.md SKILL.md agents commands docs evals plugin.json references scripts skills
git commit -m "feat: add evidence-led design foundations"
```

