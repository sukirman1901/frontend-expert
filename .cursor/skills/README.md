# Cursor skills sync target

Copy or symlink skill folders from the repo root `skills/` into this directory so Cursor Agent can discover them:

```bash
# from repo root
mkdir -p .cursor/skills
rsync -a skills/ .cursor/skills/
```

See `docs/cursor-setup.md`.
