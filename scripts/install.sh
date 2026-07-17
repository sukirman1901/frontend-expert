#!/usr/bin/env bash
# Install Design System Enforcer into common agent skill locations.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="${1:-}"

usage() {
  cat <<EOF
Usage: ./scripts/install.sh <target>

Targets:
  claude-plugin   Print Claude Code plugin-dir command
  cursor [dir]    Sync skills into <dir>/.cursor/skills (default: cwd)
  opencode        Symlink pack into ~/.config/opencode/skills/design-system-enforcer
  gemini [dir]    Copy .gemini/commands into <dir>/.gemini/commands (default: cwd)
  all             cursor (cwd) + opencode symlink

Also useful:
  ./scripts/smoke-test.sh
  ./scripts/sync-commands.sh

Examples:
  ./scripts/install.sh cursor
  ./scripts/install.sh cursor ~/my-app
  ./scripts/install.sh opencode
  ./scripts/install.sh claude-plugin
EOF
}

sync_cursor() {
  local dest="${1:-.}"
  mkdir -p "$dest/.cursor/skills" "$dest/.cursor/rules"
  rsync -a "$ROOT/skills/" "$dest/.cursor/skills/"
  cp "$ROOT/.cursor/rules/design-system-enforcer.mdc" "$dest/.cursor/rules/"
  echo "Synced skills + rule → $dest/.cursor/"
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
