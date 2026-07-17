#!/usr/bin/env bash
# Smoke-test Design System Enforcer pack integrity.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
FAIL=0

ok() { echo "  OK  $1"; }
bad() { echo "  FAIL $1" >&2; FAIL=1; }

echo "== skills =="
EXPECTED_SKILLS=(
  frontend-expert
  frontend-judgment
  design-tokens
  ui-components
  responsive-ui
  anti-ai-slop
  ui-feel
  accessibility
  web-performance
  motion
  frontend-testing
  ui-quality-loop
  webgl
  monitoring
  data-fetching
  forms-validation
  app-shell-routing
  fe-architecture
  fe-seo
  design-fidelity
  fe-devtools
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

if [ -d "$ROOT/skills/using-frontend-expert" ]; then
  bad "legacy using-frontend-expert folder still present"
else
  ok "no legacy using-frontend-expert skill"
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
[ -f "$ROOT/tokens/README.md" ] && ok "tokens/README.md" || bad "tokens/README.md"
[ -f "$ROOT/evals/README.md" ] && ok "evals/README.md" || bad "evals/README.md"
[ -f "$ROOT/evals/token-preset-scoring.md" ] && ok "evals/token-preset-scoring.md (E6)" || bad "evals/token-preset-scoring.md"
[ -f "$ROOT/references/fe-lifecycle.md" ] && ok "fe-lifecycle.md" || bad "fe-lifecycle.md"
[ -f "$ROOT/references/token-preset-scoring.md" ] && ok "token-preset-scoring.md" || bad "token-preset-scoring.md"
[ -f "$ROOT/references/compliance-gates.md" ] && ok "compliance-gates.md" || bad "compliance-gates.md"
[ -f "$ROOT/references/responsive.md" ] && ok "responsive.md" || bad "responsive.md"
[ -f "$ROOT/docs/pillars.md" ] && ok "docs/pillars.md" || bad "docs/pillars.md"
[ -f "$ROOT/evals/responsive-all-devices.md" ] && ok "evals/responsive-all-devices.md" || bad "evals/responsive-all-devices.md"
[ -f "$ROOT/evals/ship-feature-e2e.md" ] && ok "evals/ship-feature-e2e.md" || bad "evals/ship-feature-e2e.md"
[ -f "$ROOT/evals/dashboard-shell.md" ] && ok "evals/dashboard-shell.md" || bad "evals/dashboard-shell.md"
[ -f "$ROOT/evals/motion-families.md" ] && ok "evals/motion-families.md (E20)" || bad "evals/motion-families.md"
[ -f "$ROOT/evals/frontend-testing-devtools.md" ] && ok "evals/frontend-testing-devtools.md (E21)" || bad "evals/frontend-testing-devtools.md"
[ -f "$ROOT/evals/frontend-shell-chrome.md" ] && ok "evals/frontend-shell-chrome.md (E22)" || bad "evals/frontend-shell-chrome.md"
if ! rg -q 'avatar' "$ROOT/skills/app-shell-routing/SKILL.md" || ! rg -q 'custom select' "$ROOT/skills/ui-components/SKILL.md"; then
  bad "shell chrome rules missing in app-shell / ui-components"
else
  ok "shell chrome rules in skills"
fi
if ! rg -q 'responsive-ui' "$ROOT/hooks/session-start.sh" || ! rg -q 'motion' "$ROOT/hooks/session-start.sh"; then
  bad "hooks/session-start.sh missing responsive-ui/motion"
else
  ok "hooks/session-start responsive+motion"
fi

if [ "$FAIL" -ne 0 ]; then
  echo
  echo "smoke-test: FAILED" >&2
  exit 1
fi

echo
echo "smoke-test: PASSED"
