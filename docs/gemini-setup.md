# Gemini CLI Setup

## Install skills

```bash
gemini skills install /path/to/Design-system-enforcer --path skills
```

## Slash commands

Copy Gemini command definitions:

```bash
mkdir -p ~/.gemini/commands   # or project .gemini/commands
cp /path/to/Design-system-enforcer/.gemini/commands/*.toml .gemini/commands/
```

Then use `/design`, `/ui`, and `/test-ui` from Gemini CLI.
