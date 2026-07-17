#!/usr/bin/env bash
# Verify command entry points stay in sync across portable / Claude / Gemini adapters.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
FAIL=0

need() {
  if [ ! -e "$1" ]; then
    echo "MISSING: $1" >&2
    FAIL=1
  fi
}

echo "== command basename parity =="
for cmd in ui design test-ui audit polish; do
  need "$ROOT/commands/${cmd}.md"
  need "$ROOT/.claude/commands/${cmd}.md"
  need "$ROOT/.gemini/commands/${cmd}.toml"
done

echo "== skill mentions (must appear in each adapter) =="
check_skills() {
  local cmd="$1"
  shift
  local portable="$ROOT/commands/${cmd}.md"
  local claude="$ROOT/.claude/commands/${cmd}.md"
  local gemini="$ROOT/.gemini/commands/${cmd}.toml"
  for skill in "$@"; do
    for f in "$portable" "$claude" "$gemini"; do
      if ! rg -q -- "$skill" "$f"; then
        echo "MISSING skill '$skill' in $f" >&2
        FAIL=1
      fi
    done
  done
}

check_skills ui frontend-judgment design-tokens ui-components anti-ai-slop accessibility
check_skills design anti-ai-slop design-tokens accessibility web-performance
check_skills test-ui frontend-testing ui-components accessibility
check_skills audit design-reviewer
check_skills polish ui-quality-loop
# audit is an alias — must mention design workflow
if ! rg -q 'design' "$ROOT/commands/audit.md"; then
  echo "MISSING design reference in commands/audit.md" >&2
  FAIL=1
fi

if [ "$FAIL" -ne 0 ]; then
  echo "sync-commands: FAILED" >&2
  exit 1
fi

echo "sync-commands: OK (ui, design, audit, test-ui, polish adapters aligned)"
