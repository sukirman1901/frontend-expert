---
name: writing-skills
description: >-
  Write new skill files for the Frontend Expert pack following conventions.
  Use when the user wants to add a new skill, extend the pack, or says
  "make this a skill", "buat skill baru", or "tambah skill". Documents the
  pack's SKILL.md structure, frontmatter format, checklist pattern, and
  integration points (AGENTS.md, plugin.json, compliance-gates).
---

# Writing Skills

## Overview

Author new skills for the **Frontend Expert** pack following established conventions. Every skill should be consistent in structure, integrate with the intent map, and reference the pack's depth system.

## When to use

- Adding a new skill to the pack
- User says "make this a skill" or "buat skill baru"
- Distilling a repeated workflow into a reusable skill
- Extending pack coverage for a new domain

## When to skip

- Editing an existing skill's content (just edit the file)
- One-off fixes or configurations

## Skill anatomy

Every skill lives in `skills/<skill-name>/SKILL.md` and follows this structure:

```
skills/
  <skill-name>/
    SKILL.md          # Required — frontmatter + instructions
    scripts/          # Optional — helper scripts
    examples/         # Optional — reference implementations
    resources/        # Optional — templates, assets
    references/       # Optional — additional docs (prefer top-level references/)
```

## SKILL.md template

```markdown
---
name: <skill-name>
description: >-
  <2-4 sentence description covering: what it does, when to trigger,
  example phrases that should auto-load this skill. Include both English
  and Indonesian trigger phrases if applicable.>
---

# <Skill Title>

## Overview

<1-2 sentences: what problem this skill solves and its philosophy.>

## When to use

- <Trigger condition 1>
- <Trigger condition 2>
- <Trigger condition 3>

## When to skip

- <Skip condition 1>
- <Skip condition 2>

## MUST (ship rules)

| Rule | Detail |
|------|--------|
| **<Rule name>** | <What the agent must do> |
| ... | ... |

## Workflow

1. **<Step name>** — <what to do>
2. **<Step name>** — <what to do>
3. ...

## Agent boundaries

- **May decide:** <what the agent can choose autonomously>
- **Must not:** <what the agent should never do>

## Checklist

- [ ] <Gate 1>
- [ ] <Gate 2>
- [ ] <Gate 3>
- [ ] Conventions check reported (if UI-facing)

## Depth

<Reference pointers to files in references/ for detailed content>
```

## Frontmatter rules

| Field | Required | Rules |
|-------|----------|-------|
| `name` | Yes | Kebab-case, matches folder name |
| `description` | Yes | 2-4 sentences. Must include trigger phrases. Use `>-` for multi-line YAML. Include both English and casual Indonesian phrases if the pack serves bilingual users |

### Description formula

```
<What it does> + <When to trigger> + <Example phrases>.
```

**Good:**
```yaml
description: >-
  Accessible forms, field/form errors, submit pending, wizards, progressive
  disclosure. Use when building or fixing forms, login, settings, checkout,
  filters, "validasi", "form error", or multi-step flows.
```

**Bad:**
```yaml
description: Handles forms and validation.
```

## Conventions to follow

### 1. Depth via references

Keep SKILL.md under **150 lines**. Put rich content (code examples, extensive tables, theory) in `references/<skill-name>.md`. Reference it with:

```markdown
## Depth

Full guide: `references/<topic>.md`.
```

### 2. Workflow structure

Use numbered steps with **bold step names**:

```markdown
1. **Identify** — what to look for
2. **Apply** — how to fix/implement
3. **Verify** — how to check it worked
```

### 3. Tables over prose

Prefer tables for rules, patterns, do/don't comparisons:

```markdown
| Do | Don't |
|----|-------|
| Token colors | Raw hex |
| `<button>` | `<div onClick>` |
```

### 4. Checklist as ship gate

End with a checklist that the agent verifies before DONE:

```markdown
## Checklist

- [ ] <Required gate 1>
- [ ] <Required gate 2>
- [ ] Conventions check reported
```

### 5. Agent boundaries

Explicitly state what the agent **may decide** autonomously vs what it **must not** do:

```markdown
## Agent boundaries

- **May decide:** query lib vs loader, skeleton vs spinner
- **Must not:** swallow errors, ship success-only UI
```

## Integration checklist

After creating a new skill, update these files:

### 1. AGENTS.md — Intent map

Add a row to the skills table:

```markdown
| `<skill-name>` | <Pillar> | <Trigger description> |
```

Add to the intent map if the skill has a clear user intent trigger.

### 2. plugin.json — Registration

Add the skill path:

```json
"skills": [
  ...
  "skills/<skill-name>"
]
```

### 3. docs/pillars.md — Pillar assignment

Add to the appropriate pillar in the skills list.

### 4. CHANGELOG.md — Version history

Add entry under the next version.

### 5. references/compliance-gates.md — Ship gate (if applicable)

If the skill introduces a compliance requirement, add a row to the hard defaults table and a Conventions check line.

### 6. evals/ — Eval case (recommended)

Create `evals/<skill-name>.md` with test scenarios:

```markdown
# Eval: <skill-name>

## Scenario

<User prompt that should trigger this skill>

## Expected behavior

1. <What the agent should do>
2. <What the output should include>
3. <What should NOT happen>

## Pass criteria

- [ ] Skill was loaded
- [ ] <Expected output was produced>
- [ ] <Anti-pattern was avoided>
```

## Workflow

1. **Name** — choose a kebab-case name matching the concept
2. **Draft** — write SKILL.md following the template above
3. **Depth** — if content > 150 lines, extract to `references/<name>.md`
4. **Integrate** — update AGENTS.md, plugin.json, pillars.md, CHANGELOG.md
5. **Eval** — write at least one eval case
6. **Test** — verify the skill triggers correctly on natural language input

## Checklist

- [ ] SKILL.md follows template structure
- [ ] Frontmatter has rich description with trigger phrases
- [ ] Content ≤ 150 lines (depth in references/)
- [ ] Has When to use + When to skip
- [ ] Has Workflow with numbered steps
- [ ] Has Checklist as ship gate
- [ ] AGENTS.md updated with skill entry
- [ ] plugin.json updated
- [ ] pillars.md updated
- [ ] CHANGELOG.md updated
- [ ] Eval case created (recommended)

## Depth

Pack architecture: `docs/pack-layers.md`.
Pillar map: `docs/pillars.md`.
Existing skills as examples: any `skills/*/SKILL.md`.
