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

check_skills ui design-direction design-foundations tokens components anti-slop-code responsive motion anti-slop-design polish accessibility marketing
check_skills design design-foundations anti-slop-design polish tokens responsive accessibility performance fidelity devtools motion marketing
check_skills test-ui testing components accessibility devtools
check_skills audit design-reviewer
check_skills polish quality-loop polish motion
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
  if ! rg -q 'responsive' "$f"; then
    echo "MISSING responsive in $f" >&2
    FAIL=1
  fi
done

echo "== semantic phrases (portable + adapters) =="
require_phrase() {
  local label="$1"
  local phrase="$2"
  shift 2
  for f in "$@"; do
    if ! rg -q -- "$phrase" "$f"; then
      echo "MISSING '$phrase' ($label) in $f" >&2
      FAIL=1
    fi
  done
}

require_phrase "ui shell chrome" "avatar|account menu|custom select|theme in topbar|topbar icon" \
  "$ROOT/commands/ui.md" "$ROOT/.claude/commands/ui.md" "$ROOT/.gemini/commands/ui.toml"

require_phrase "ui marketing" "marketing" \
  "$ROOT/commands/ui.md" "$ROOT/.claude/commands/ui.md" "$ROOT/.gemini/commands/ui.toml"
require_phrase "design marketing" "marketing" \
  "$ROOT/commands/design.md" "$ROOT/.claude/commands/design.md" "$ROOT/.gemini/commands/design.toml"
require_phrase "session-start marketing" "marketing" "$ROOT/hooks/session-start.sh"

require_phrase "design motion" "motion" \
  "$ROOT/commands/design.md" "$ROOT/.claude/commands/design.md" "$ROOT/.gemini/commands/design.toml"
require_phrase "polish motion" "motion" \
  "$ROOT/commands/polish.md" "$ROOT/.claude/commands/polish.md" "$ROOT/.gemini/commands/polish.toml"
require_phrase "session-start chain" "responsive" "$ROOT/hooks/session-start.sh"
require_phrase "session-start motion" "motion" "$ROOT/hooks/session-start.sh"

echo "== evals E1–E30 present =="
for ev in \
  purple-reject scorecard-honesty loop-cap rapihin-routing reicon-webgl-compliance \
  token-preset-scoring responsive-all-devices data-fetching forms-validation \
  app-shell-routing ship-feature-e2e dashboard-shell visual-hierarchy typography-ladder \
  auto-layout-fill-cta design-fidelity fe-seo fe-architecture monitoring motion-families \
  frontend-testing-devtools frontend-shell-chrome marketing-landing \
  design-typography design-color design-surfaces content-design design-foundations \
  components anti-slop-code
do
  need "$ROOT/evals/${ev}.md"
done

if [ "$FAIL" -ne 0 ]; then
  echo "sync-commands: FAILED" >&2
  exit 1
fi

echo "sync-commands: OK (ui, design, audit, test-ui, polish adapters aligned)"
