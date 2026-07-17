#!/usr/bin/env bash
# Smoke-test Design System Enforcer pack integrity.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
FAIL=0

ok() { echo "  OK  $1"; }
bad() { echo "  FAIL $1" >&2; FAIL=1; }

echo "== skills =="
EXPECTED_SKILLS=(
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
)

for s in "${EXPECTED_SKILLS[@]}"; do
  f="$ROOT/skills/$s/SKILL.md"
  if [ ! -f "$f" ]; then
    bad "missing $f"
    continue
  fi
  if ! head -5 "$f" | rg -q '^name:'; then
    bad "no name: frontmatter in $f"
  elif ! head -10 "$f" | rg -q '^description:'; then
    bad "no description: frontmatter in $f"
  else
    # name should match folder
    name=$(rg -m1 '^name:\s*' "$f" | sed 's/^name:[[:space:]]*//')
    if [ "$name" != "$s" ]; then
      bad "name '$name' != folder '$s' in $f"
    else
      ok "skills/$s"
    fi
  fi
done

if [ -d "$ROOT/skills/frontend-expert" ] || [ -d "$ROOT/skills/using-frontend-expert" ]; then
  bad "legacy monolith skill folder still present"
else
  ok "no legacy monolith skills"
fi

echo "== agents =="
for a in ui-developer design-reviewer test-engineer; do
  [ -f "$ROOT/agents/$a.md" ] && ok "agents/$a.md" || bad "agents/$a.md"
done

echo "== tokens =="
token_count=$(find "$ROOT/tokens" -name '*.css' | wc -l | tr -d ' ')
[ "$token_count" -ge 9 ] && ok "tokens ($token_count css)" || bad "expected >=9 token css files"

echo "== plugin paths =="
for p in \
  "$ROOT/plugin.json" \
  "$ROOT/.claude-plugin/plugin.json" \
  "$ROOT/.codex-plugin/plugin.json" \
  "$ROOT/.agents/plugins/marketplace.json" \
  "$ROOT/hooks/hooks.json"
do
  [ -f "$p" ] && ok "$(basename "$(dirname "$p")")/$(basename "$p")" || bad "$p"
done

# Resolve paths declared in claude plugin.json
if command -v jq >/dev/null 2>&1; then
  while IFS= read -r rel; do
    # skip globs / arrays handled loosely
    [ -z "$rel" ] && continue
    rel="${rel#./}"
    if [ -e "$ROOT/$rel" ]; then
      ok "claude plugin path $rel"
    else
      bad "claude plugin path missing: $rel"
    fi
  done < <(jq -r '
    .skills // empty,
    (.commands // [])[],
    (.agents // [])[],
    .hooks // empty
  ' "$ROOT/.claude-plugin/plugin.json" 2>/dev/null | sed '/\[/d')
else
  bad "jq not installed (skip plugin path resolve)"
fi

echo "== hooks =="
for h in session-start.sh anti-slop-scan.sh; do
  script="$ROOT/hooks/$h"
  if [ ! -x "$script" ]; then
    chmod +x "$script" 2>/dev/null || true
  fi
  if [ -x "$script" ]; then
    ok "executable $h"
  else
    bad "not executable $h"
  fi
done

if command -v jq >/dev/null 2>&1; then
  out=$(bash "$ROOT/hooks/session-start.sh" 2>/dev/null || true)
  if echo "$out" | jq -e '.priority and .message' >/dev/null 2>&1; then
    ok "session-start JSON"
  else
    bad "session-start did not emit valid JSON"
  fi
fi

echo "== command sync =="
if bash "$ROOT/scripts/sync-commands.sh"; then
  ok "sync-commands"
else
  bad "sync-commands"
fi

echo "== references map =="
[ -f "$ROOT/references/README.md" ] && ok "references/README.md" || bad "references/README.md"
[ -f "$ROOT/docs/pack-layers.md" ] && ok "docs/pack-layers.md" || bad "docs/pack-layers.md"

if [ "$FAIL" -ne 0 ]; then
  echo
  echo "smoke-test: FAILED" >&2
  exit 1
fi

echo
echo "smoke-test: PASSED"
