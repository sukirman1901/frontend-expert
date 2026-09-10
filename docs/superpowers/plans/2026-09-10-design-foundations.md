# Design Foundations Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Add `design-foundations` as the canonical owner of grid, spacing rhythm, alignment, hierarchy, density, composition, whitespace, and structural layout geometry.

**Architecture:** Keep the skill concise and route detailed structural guidance to one reference file. Place it after optional `design-direction` and before `tokens`; preserve explicit handoffs to typography, color, surfaces, components, responsive behavior, and polish. Extend the existing shell smoke tests and adapter-sync tests rather than introducing another test framework.

**Tech Stack:** Markdown skill files, JSON plugin manifest, Bash integrity tests, Claude/Gemini/portable command adapters.

---

### Task 1: Establish the failing structural contract

**Files:**
- Modify: `scripts/smoke-test.sh`
- Modify: `scripts/sync-commands.sh`

- [ ] **Step 1: Add the canonical skill expectation**

Add `design-foundations` to `CANONICAL_SKILLS`, change the expected folder count from 29 to 30, and change the plugin contract to:

```bash
if jq -e '.version == "2.1.0" and (.skills | length == 30)' "$ROOT/plugin.json" >/dev/null; then
  ok "plugin v2.1.0 registers exactly 30 skills"
else
  bad "plugin must be v2.1.0 with exactly 30 skills"
fi
```

- [ ] **Step 2: Add missing-artifact assertions**

Add these checks under the reference/eval section:

```bash
[ -f "$ROOT/references/design-foundations.md" ] && ok "design-foundations.md" || bad "references/design-foundations.md"
[ -f "$ROOT/evals/design-foundations.md" ] && ok "evals/design-foundations.md (E28)" || bad "evals/design-foundations.md"
```

- [ ] **Step 3: Add adapter expectations**

Add `design-foundations` to the `ui` and `design` `check_skills` calls in `scripts/sync-commands.sh`, and add `design-foundations` to the E1–E28 eval file list.

- [ ] **Step 4: Run RED verification**

Run:

```bash
./scripts/sync-commands.sh
./scripts/smoke-test.sh
```

Expected: FAIL because the skill, reference, eval, routing mentions, v2.1 manifest, and 30th registration do not exist.

- [ ] **Step 5: Commit the failing contract**

```bash
git add scripts/smoke-test.sh scripts/sync-commands.sh
git commit -m "test: define design foundations coverage"
```

### Task 2: Create the skill and structural reference

**Files:**
- Create: `skills/design-foundations/SKILL.md`
- Create: `references/design-foundations.md`

- [ ] **Step 1: Create the concise skill**

Use this frontmatter and ownership statement:

```markdown
---
name: design-foundations
description: >-
  Use when creating or repairing the structural layout of a web screen: grid,
  spacing rhythm, alignment, hierarchy, density, composition, whitespace, or
  content grouping. Trigger for blank layouts, inconsistent spacing, weak
  hierarchy, cluttered screens, or "layout terasa berantakan". Skip isolated
  color, typography, component-state, motion, and micro-polish changes.
---

# Design Foundations

## Overview

Build structural order from content priority and user tasks. Own relationships and layout logic; hand token values and domain-specific styling to their canonical owners.
```

The body must include `When to use`, `When to skip`, an ownership table, MUST rules, the Inventory→Structure→Rhythm→Align→Density→Stress→Hand off→Verify workflow, agent boundaries, checklist, and depth pointer. Keep it below 150 lines.

- [ ] **Step 2: Create the detailed reference**

Write `references/design-foundations.md` with these exact sections:

```markdown
# Design foundations

## Content before geometry
## Container and grid strategy
## Spacing rhythm
## Alignment and anchors
## Hierarchy and focal path
## Density and progressive disclosure
## Whitespace as structure
## Nesting and inset geometry
## Content stress matrix
## Failure modes
## Verification checklist
```

Include decision tables rather than universal dimensions. State explicitly that foundations chooses relationships while `tokens` supplies values, `design-surfaces` supplies radius/border/elevation, and `responsive` supplies breakpoint transformations.

- [ ] **Step 3: Check size and boundaries**

Run:

```bash
test "$(wc -l < skills/design-foundations/SKILL.md)" -le 150
rg -n 'tokens|design-typography|design-color|design-surfaces|responsive|polish' skills/design-foundations/SKILL.md
```

Expected: size check exits 0 and every adjacent owner appears in boundary/handoff language.

- [ ] **Step 4: Run the structural test**

Run `./scripts/smoke-test.sh`.

Expected: the skill/reference checks pass; remaining integration/version/eval checks may still fail.

- [ ] **Step 5: Commit the domain implementation**

```bash
git add skills/design-foundations/SKILL.md references/design-foundations.md
git commit -m "feat: add structural design foundations"
```

### Task 3: Add behavioral evaluation E28

**Files:**
- Create: `evals/design-foundations.md`
- Modify: `evals/README.md`

- [ ] **Step 1: Write the pressure scenario**

Create E28 with this scenario:

```markdown
# Eval: design-foundations

## Scenario

The user has a dashboard whose colors and individual components are acceptable, but every section uses unrelated widths and gaps, actions compete equally, cards are centered arbitrarily, and long or localized content breaks the composition. They ask: "Rapikan struktur layout-nya, jangan ganti brand atau komponen."

## Expected behavior

1. Load `design-foundations` without reopening visual direction.
2. Identify content priority, major regions, grouping, alignment anchors, spacing rhythm, density, and realistic content extremes.
3. Preserve palette, typography, component API, and brand expression.
4. Hand breakpoint transformations to `responsive` and final micro-craft to `polish`.

## Pass criteria

- [ ] Proposes one coherent container/grid strategy.
- [ ] Defines spacing relationships rather than arbitrary one-off gaps.
- [ ] Establishes one primary focal path and dominant action.
- [ ] Tests minimum, typical, maximum, empty, localized, and dynamic content.
- [ ] Does not replace colors, fonts, components, radius language, or animation.
```

- [ ] **Step 2: Register E28 in the eval index**

Append this row to `evals/README.md`:

```markdown
| E28 | Structural design foundations | [design-foundations.md](./design-foundations.md) |
```

- [ ] **Step 3: Run eval-presence checks**

Run `./scripts/sync-commands.sh`.

Expected: E28 presence passes; adapter skill mentions still fail until Task 4.

- [ ] **Step 4: Commit the eval**

```bash
git add evals/design-foundations.md evals/README.md
git commit -m "test: add design foundations behavior scenario"
```

### Task 4: Integrate chat-first routing and personas

**Files:**
- Modify: `AGENTS.md`
- Modify: `SKILL.md`
- Modify: `CLAUDE.md`
- Modify: `agents/ui-developer.md`
- Modify: `agents/design-reviewer.md`
- Modify: `commands/ui.md`
- Modify: `commands/design.md`
- Modify: `.claude/commands/ui.md`
- Modify: `.claude/commands/design.md`
- Modify: `.gemini/commands/ui.toml`
- Modify: `.gemini/commands/design.toml`
- Modify: `hooks/session-start.sh`

- [ ] **Step 1: Update canonical routing**

Place `design-foundations` after optional `design-direction` and before `tokens` in every build/layout chain. Add natural-language triggers for grid, spacing rhythm, structural hierarchy, cluttered layout, inconsistent alignment, and “layout berantakan”.

- [ ] **Step 2: Preserve skip behavior**

State that isolated color, typography, copy, token, component-state, motion, and micro-polish changes do not load foundations unless structural layout also changes.

- [ ] **Step 3: Update personas and session hint**

The UI developer should apply it during structural builds. The reviewer should use it when diagnosing layout structure. The session hint should mention foundations in the default chain without making slash commands mandatory.

- [ ] **Step 4: Verify adapter parity**

Run `./scripts/sync-commands.sh`.

Expected: PASS for portable, Claude, and Gemini adapters.

- [ ] **Step 5: Commit routing**

```bash
git add AGENTS.md SKILL.md CLAUDE.md agents commands .claude/commands .gemini/commands hooks/session-start.sh
git commit -m "feat: route structural UI through design foundations"
```

### Task 5: Register and document release 2.1

**Files:**
- Modify: `plugin.json`
- Modify: `.codex-plugin/plugin.json`
- Modify: `skills/frontend-expert/SKILL.md`
- Modify: `README.md`
- Modify: `docs/pillars.md`
- Modify: `docs/pack-layers.md`
- Modify: `references/README.md`
- Modify: `references/fe-lifecycle.md`
- Modify: `references/compliance-gates.md`
- Modify: `CHANGELOG.md`

- [ ] **Step 1: Register the canonical skill**

Add `"skills/design-foundations"` after `"skills/design-direction"` in `plugin.json`. Set package and root-skill versions to `2.1.0`.

- [ ] **Step 2: Update the suite map**

State that the pack has exactly 30 canonical skills. Add foundations to the UI Quality pillar and place it after direction in lifecycle diagrams.

- [ ] **Step 3: Add the compliance boundary**

Add a Foundations gate requiring coherent container/grid, spacing relationships, shared alignment anchors, one focal path, and realistic content stress. Do not add fixed universal pixel values.

- [ ] **Step 4: Add the changelog entry**

Add `2.1.0` with the new skill, reference, E28, routing, and 30-skill canonical count.

- [ ] **Step 5: Run GREEN verification**

Run:

```bash
./scripts/sync-commands.sh
./scripts/smoke-test.sh
bash -n scripts/*.sh hooks/*.sh
jq -e '.version == "2.1.0" and (.skills | length == 30)' plugin.json
git diff --check
```

Expected: every command exits 0 and smoke output ends with `smoke-test: PASSED`.

- [ ] **Step 6: Commit release integration**

```bash
git add plugin.json .codex-plugin/plugin.json skills/frontend-expert/SKILL.md README.md docs references CHANGELOG.md
git commit -m "chore: register design foundations in v2.1"
```

### Task 6: Final behavioral and regression review

**Files:**
- Verify: `evals/design-foundations.md`
- Verify: `skills/design-foundations/SKILL.md`
- Verify: `references/design-foundations.md`

- [ ] **Step 1: Run the E28 prompt in a fresh chat**

Use the exact E28 scenario with the installed pack. Project policy forbids agent-to-agent dispatch, so run this as a separate fresh user-owned chat or record it as `Not manually verified`; do not fabricate a pass.

- [ ] **Step 2: Score every criterion**

Record pass/fail for structure, spacing relationships, hierarchy, content stress, preserved adjacent domains, and correct handoffs.

- [ ] **Step 3: Re-run the complete technical suite**

```bash
./scripts/sync-commands.sh
./scripts/smoke-test.sh
bash -n scripts/*.sh hooks/*.sh
git diff --check
git status --short
```

Expected: technical commands exit 0 and the worktree is clean after commits. Behavioral status is reported separately and honestly.
