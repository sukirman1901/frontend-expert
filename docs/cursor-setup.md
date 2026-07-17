# Cursor Setup

Cursor uses **rules** (short policies) and **skills** (workflows).

## Install skills

```bash
mkdir -p .cursor/skills
rsync -a /path/to/Design-system-enforcer/skills/ .cursor/skills/
```

Optional: copy the thin always-on rule:

```bash
mkdir -p .cursor/rules
cp /path/to/Design-system-enforcer/.cursor/rules/design-system-enforcer.mdc .cursor/rules/
```

## Tokens

Copy presets into your app (or import the CSS):

```bash
cp /path/to/Design-system-enforcer/tokens/*.css ./src/styles/tokens/
```

## Notes

- Do **not** paste full `SKILL.md` bodies into rules — keep skills in `.cursor/skills/`
- Prefer `/ui` / `/design` intent; agents load domain skills by task
- For audits, ask the agent to follow `agents/design-reviewer.md`
- Claude-style hooks are not available in Cursor; rely on skills + rules instead
