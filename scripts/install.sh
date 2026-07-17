#!/usr/bin/env bash
# Install Design System Enforcer into common agent skill locations.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="${1:-}"

PACK_SKILLS=(
  frontend-judgment
  design-tokens
  ui-components
  anti-ai-slop
  ui-feel
  accessibility
  web-performance
  motion
  frontend-testing
  ui-quality-loop
  webgl
  monitoring
)

usage() {
  cat <<EOF
Usage: ./scripts/install.sh <target>

Targets:
  claude-plugin     Print Claude Code plugin-dir command
  cursor [dir]      Copy skills into <dir>/.cursor/skills (default: cwd) — project-local
  cursor-user       Symlink pack skills + refs + tokens into ~/.cursor (no drift vs this repo)
  opencode          Symlink pack into ~/.config/opencode/skills/design-system-enforcer
  gemini [dir]      Copy .gemini/commands into <dir>/.gemini/commands (default: cwd)
  all               cursor (cwd) + opencode symlink

Also useful:
  ./scripts/smoke-test.sh
  ./scripts/sync-commands.sh

Examples:
  ./scripts/install.sh cursor
  ./scripts/install.sh cursor ~/my-app
  ./scripts/install.sh cursor-user    # recommended for personal Cursor Agent
  ./scripts/install.sh opencode
  ./scripts/install.sh claude-plugin
EOF
}

sync_cursor() {
  local dest="${1:-.}"
  mkdir -p "$dest/.cursor/skills" "$dest/.cursor/rules"
  rsync -a "$ROOT/skills/" "$dest/.cursor/skills/"
  mkdir -p "$dest/.cursor/skills/references"
  rsync -a "$ROOT/references/" "$dest/.cursor/skills/references/"
  mkdir -p "$dest/.cursor/skills/tokens"
  rsync -a "$ROOT/tokens/" "$dest/.cursor/skills/tokens/"
  cp "$ROOT/.cursor/rules/design-system-enforcer.mdc" "$dest/.cursor/rules/"
  echo "Synced skills + references + tokens + rule → $dest/.cursor/"
  echo "Note: copy/import tokens into your app CSS as needed (see docs/cursor-setup.md)."
}

# Personal Cursor: symlink so pulls to this repo stay live
sync_cursor_user() {
  local skills_dir="${HOME}/.cursor/skills"
  local rules_dir="${HOME}/.cursor/rules"
  local packs_dir="${HOME}/.cursor/packs"
  mkdir -p "$skills_dir" "$rules_dir" "$packs_dir"

  for name in "${PACK_SKILLS[@]}"; do
    local src="$ROOT/skills/$name"
    local dst="$skills_dir/$name"
    if [ ! -d "$src" ]; then
      echo "WARN: missing $src" >&2
      continue
    fi
    # Replace copy or old link
    rm -rf "$dst"
    ln -sfn "$src" "$dst"
    echo "  link skill $name"
  done

  rm -rf "$skills_dir/references"
  ln -sfn "$ROOT/references" "$skills_dir/references"
  echo "  link references/"

  rm -rf "$skills_dir/tokens"
  ln -sfn "$ROOT/tokens" "$skills_dir/tokens"
  echo "  link tokens/"

  ln -sfn "$ROOT/AGENTS.md" "$skills_dir/AGENTS-frontend-expert.md"
  echo "  link AGENTS-frontend-expert.md"

  ln -sfn "$ROOT" "$packs_dir/frontend-expert"
  echo "  link packs/frontend-expert"

  cp "$ROOT/.cursor/rules/design-system-enforcer.mdc" "$rules_dir/design-system-enforcer.mdc"
  echo "  copy rule design-system-enforcer.mdc"

  echo "Cursor user install OK → ~/.cursor (skills/refs/tokens are symlinks into $ROOT)"
  echo "App CSS: import from ~/.cursor/packs/frontend-expert/tokens/ or copy into the project (docs/cursor-setup.md)."
}

link_opencode() {
  local dir="${HOME}/.config/opencode/skills"
  mkdir -p "$dir"
  ln -sfn "$ROOT" "$dir/design-system-enforcer"
  echo "Symlinked → $dir/design-system-enforcer"
}

copy_gemini() {
  local dest="${1:-.}"
  mkdir -p "$dest/.gemini/commands"
  cp "$ROOT/.gemini/commands/"*.toml "$dest/.gemini/commands/"
  echo "Copied Gemini commands → $dest/.gemini/commands/"
}

case "${TARGET}" in
  ""|-h|--help) usage; exit 0 ;;
  claude-plugin)
    echo "Run: claude --plugin-dir \"$ROOT\""
    ;;
  cursor)
    sync_cursor "${2:-.}"
    ;;
  cursor-user)
    sync_cursor_user
    ;;
  opencode)
    link_opencode
    ;;
  gemini)
    copy_gemini "${2:-.}"
    ;;
  all)
    sync_cursor "."
    link_opencode
    ;;
  *)
    echo "Unknown target: $TARGET" >&2
    usage
    exit 1
    ;;
esac
