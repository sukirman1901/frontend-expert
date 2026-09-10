#!/usr/bin/env bash
# Install Frontend Expert into common agent skill locations.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="${1:-}"

PACK_SKILLS=()
REMOVED_ALIASES=(
  frontend-judgment design-tokens ui-components responsive-ui anti-ai-slop
  ui-feel web-performance frontend-testing ui-quality-loop app-shell-routing
  forms-validation marketing-landing fe-architecture fe-seo fe-devtools
  design-fidelity writing-skills
)

load_pack_skills() {
  PACK_SKILLS=()
  if command -v jq >/dev/null 2>&1; then
    while IFS= read -r name; do
      [ -n "$name" ] && PACK_SKILLS+=("$name")
    done < <(jq -r '.skills[]' "$ROOT/plugin.json" | sed 's|^skills/||')
  else
    while IFS= read -r f; do
      PACK_SKILLS+=("$(basename "$(dirname "$f")")")
    done < <(find "$ROOT/skills" -mindepth 2 -maxdepth 2 -name SKILL.md | sort)
  fi
  if [ "${#PACK_SKILLS[@]}" -eq 0 ]; then
    echo "install.sh: no skills found under $ROOT" >&2
    exit 1
  fi
}

belongs_to_pack_family() {
  local target="$1"
  case "$target" in
    *"/frontend-expert/"*|*"/frontend-expert"|*"/Design-system-enforcer/"*|*"/Design-system-enforcer")
      return 0
      ;;
    *)
      return 1
      ;;
  esac
}

unlink_stale_aliases() {
  local skills_dir="$1"
  for name in "${REMOVED_ALIASES[@]}"; do
    local dst="$skills_dir/$name"
    if [ -L "$dst" ]; then
      local target
      target="$(readlink "$dst")"
      if belongs_to_pack_family "$target"; then
        rm -f "$dst"
        echo "  unlink stale alias $name"
      fi
    fi
  done
}

usage() {
  cat <<EOF
Usage: ./scripts/install.sh <target>

Targets:
  claude-plugin     Print Claude Code plugin-dir command
  cursor [dir]      Copy skills into <dir>/.cursor/skills (default: cwd) — project-local
  cursor-user       Symlink all plugin.json skills + agents + commands into ~/.cursor
  verify-cursor     Check ~/.cursor links resolve into this clone
  opencode          Symlink pack into ~/.config/opencode/skills/frontend-expert
  gemini [dir]      Copy .gemini/commands into <dir>/.gemini/commands (default: cwd)
  gemini-user       Copy Gemini commands into ~/.gemini/commands
  user              cursor-user + opencode + gemini-user (this machine)
  all               user (personal installs — does not copy into cwd)

Also useful:
  ./scripts/smoke-test.sh
  ./scripts/sync-commands.sh

Examples:
  ./scripts/install.sh cursor ~/my-app
  ./scripts/install.sh cursor-user
  ./scripts/install.sh user
  ./scripts/install.sh claude-plugin
EOF
}

sync_cursor() {
  local dest="${1:-.}"
  mkdir -p "$dest/.cursor/skills" "$dest/.cursor/rules"
  rsync -a "$ROOT/skills/" "$dest/.cursor/skills/"
  mkdir -p "$dest/.cursor/skills/references"
  rsync -a "$ROOT/references/" "$dest/.cursor/skills/references/"
  mkdir -p "$dest/.cursor/skills/token-presets"
  rsync -a "$ROOT/tokens/" "$dest/.cursor/skills/token-presets/"
  cp "$ROOT/.cursor/rules/design-system-enforcer.mdc" "$dest/.cursor/rules/"
  echo "Synced skills + references + token-presets + rule → $dest/.cursor/"
  echo "Note: copy/import tokens into your app CSS as needed (see docs/cursor-setup.md)."
}

# Personal Cursor: symlink so pulls to this repo stay live
sync_cursor_user() {
  load_pack_skills
  local skills_dir="${HOME}/.cursor/skills"
  local rules_dir="${HOME}/.cursor/rules"
  local packs_dir="${HOME}/.cursor/packs"
  local agents_dir="${HOME}/.cursor/agents"
  local commands_dir="${HOME}/.cursor/commands"
  mkdir -p "$skills_dir" "$rules_dir" "$packs_dir" "$agents_dir" "$commands_dir"

  unlink_stale_aliases "$skills_dir"

  for name in "${PACK_SKILLS[@]}"; do
    local src="$ROOT/skills/$name"
    local dst="$skills_dir/$name"
    if [ ! -d "$src" ]; then
      echo "WARN: missing $src" >&2
      continue
    fi
    rm -rf "$dst"
    ln -sfn "$src" "$dst"
    echo "  link skill $name"
  done

  rm -rf "$skills_dir/references"
  ln -sfn "$ROOT/references" "$skills_dir/references"
  echo "  link references/"

  rm -rf "$skills_dir/token-presets"
  ln -sfn "$ROOT/tokens" "$skills_dir/token-presets"
  echo "  link token-presets/ (CSS)"

  ln -sfn "$ROOT/AGENTS.md" "$skills_dir/AGENTS-frontend-expert.md"
  echo "  link AGENTS-frontend-expert.md"

  ln -sfn "$ROOT" "$packs_dir/frontend-expert"
  echo "  link packs/frontend-expert"

  for agent in ui-developer design-reviewer test-engineer; do
    local src="$ROOT/agents/${agent}.md"
    if [ ! -f "$src" ]; then
      echo "WARN: missing $src" >&2
      continue
    fi
    ln -sfn "$src" "$agents_dir/${agent}.md"
    echo "  link agent ${agent}.md"
  done

  for cmd in ui design audit test-ui polish; do
    local src="$ROOT/commands/${cmd}.md"
    if [ ! -f "$src" ]; then
      echo "WARN: missing $src" >&2
      continue
    fi
    ln -sfn "$src" "$commands_dir/${cmd}.md"
    echo "  link command /${cmd}"
  done

  cp "$ROOT/.cursor/rules/design-system-enforcer.mdc" "$rules_dir/design-system-enforcer.mdc"
  echo "  copy rule design-system-enforcer.mdc"

  echo "Cursor user install OK → ~/.cursor (skills/agents/commands/refs/token-presets symlinks into $ROOT)"
  echo "App CSS: import from ~/.cursor/packs/frontend-expert/tokens/ or ~/.cursor/skills/token-presets/ (docs/cursor-setup.md)."
  verify_cursor_user
}

verify_cursor_user() {
  load_pack_skills
  local fail=0
  local skills_dir="${HOME}/.cursor/skills"
  local name dst
  for name in "${PACK_SKILLS[@]}"; do
    dst="$skills_dir/$name/SKILL.md"
    if [ ! -f "$dst" ]; then
      echo "  MISSING $dst" >&2
      fail=1
    fi
  done
  if [ "$(readlink "${HOME}/.cursor/packs/frontend-expert" 2>/dev/null || true)" != "$ROOT" ]; then
    echo "  packs/frontend-expert does not point at $ROOT" >&2
    fail=1
  fi
  if [ "$fail" -ne 0 ]; then
    echo "verify-cursor: FAILED" >&2
    return 1
  fi
  echo "verify-cursor: OK (${#PACK_SKILLS[@]} skills → $ROOT)"
}

link_opencode() {
  local dir="${HOME}/.config/opencode/skills"
  mkdir -p "$dir"
  if [ -e "$dir/frontend-expert" ] && [ ! -L "$dir/frontend-expert" ]; then
    rm -rf "$dir/frontend-expert"
  fi
  ln -sfn "$ROOT" "$dir/frontend-expert"
  ln -sfn "$ROOT" "$dir/design-system-enforcer"
  echo "Symlinked → $dir/frontend-expert (alias design-system-enforcer)"
}

copy_gemini() {
  local dest="${1:-.}"
  mkdir -p "$dest/.gemini/commands"
  cp "$ROOT/.gemini/commands/"*.toml "$dest/.gemini/commands/"
  echo "Copied Gemini commands → $dest/.gemini/commands/"
}

print_claude() {
  echo "Claude Code (local clone, not GitHub):"
  echo "  claude --plugin-dir \"$ROOT\""
  echo "  claude plugin validate \"$ROOT\""
}

print_codex() {
  echo "Codex:"
  echo "  codex plugin marketplace add \"$ROOT\""
  echo "  See docs/codex-setup.md"
}

install_user() {
  sync_cursor_user
  link_opencode
  copy_gemini "$HOME"
  echo
  print_claude
  print_codex
}

case "${TARGET}" in
  ""|-h|--help) usage; exit 0 ;;
  claude-plugin)
    print_claude
    ;;
  cursor)
    sync_cursor "${2:-.}"
    ;;
  cursor-user)
    sync_cursor_user
    ;;
  verify-cursor)
    verify_cursor_user
    ;;
  opencode)
    link_opencode
    ;;
  gemini)
    copy_gemini "${2:-.}"
    ;;
  gemini-user)
    copy_gemini "$HOME"
    ;;
  user|all)
    install_user
    ;;
  *)
    echo "Unknown target: $TARGET" >&2
    usage
    exit 1
    ;;
esac
