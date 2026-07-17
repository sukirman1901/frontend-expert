# Cursor Setup

Cursor uses **rules** (short policies) and **skills** (workflows).

## Recommended: personal Agent skills (symlink — no drift)

From the pack repo:

```bash
./scripts/install.sh cursor-user
```

This:

- Symlinks each pack skill → `~/.cursor/skills/<name>`
- Symlinks `references/` → `~/.cursor/skills/references`
- Symlinks the pack → `~/.cursor/packs/frontend-expert`
- Copies the always-on rule → `~/.cursor/rules/design-system-enforcer.mdc`

After `git pull` on the pack repo, Cursor sees updates automatically (no re-copy).

Re-run `cursor-user` after adding a **new** skill folder name (script lists skills explicitly).

## Project-local skills (copy)

```bash
./scripts/install.sh cursor /path/to/your-app
# or
mkdir -p .cursor/skills .cursor/rules
rsync -a /path/to/frontend-expert/skills/ .cursor/skills/
rsync -a /path/to/frontend-expert/references/ .cursor/skills/references/
cp /path/to/frontend-expert/.cursor/rules/design-system-enforcer.mdc .cursor/rules/
```

Prefer **cursor-user** for your daily Agent; use project-local only when the repo must vendor skills.

## Tokens

Copy presets into your app (or import the CSS):

```bash
cp /path/to/frontend-expert/tokens/*.css ./src/styles/tokens/
```

## Notes

- Do **not** paste full `SKILL.md` bodies into rules — keep skills in `.cursor/skills/`
- Chat-first: natural language maps to skills; slash is optional (`/ui`, `/design`, `/polish`, …)
- FE process A→Z: `references/fe-lifecycle.md`
- Claude-style hooks are not available in Cursor; rely on skills + rules instead
