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

check_skills ui frontend-judgment design-tokens ui-components responsive-ui motion anti-ai-slop ui-feel accessibility
check_skills design anti-ai-slop ui-feel design-tokens responsive-ui accessibility web-performance design-fidelity fe-devtools motion
check_skills test-ui frontend-testing ui-components accessibility fe-devtools
check_skills audit design-reviewer
check_skills polish ui-quality-loop ui-feel motion
# audit is an alias — must mention design workflow
if ! rg -q 'design' "$ROOT/commands/audit.md"; then
  echo "MISSING design reference in commands/audit.md" >&2
  FAIL=1
fi

echo "== ui token decision tree =="
for f in \
  "$ROOT/commands/ui.md" \
  "$ROOT/.claude/commands/ui.md" \
  "$ROOT/.gemini/commands/ui.toml"
do
  if ! rg -q 'decision tree|token-preset-scoring' "$f"; then
    echo "MISSING decision tree / token-preset-scoring in $f" >&2
    FAIL=1
  fi
done

echo "== ui responsive must =="
for f in \
  "$ROOT/commands/ui.md" \
  "$ROOT/.claude/commands/ui.md" \
  "$ROOT/.gemini/commands/ui.toml"
do
  if ! rg -q 'responsive-ui' "$f"; then
    echo "MISSING responsive-ui in $f" >&2
    FAIL=1
  fi
done

if [ "$FAIL" -ne 0 ]; then
  echo "sync-commands: FAILED" >&2
  exit 1
fi

echo "sync-commands: OK (ui, design, audit, test-ui, polish adapters aligned)"
