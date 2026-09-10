#!/usr/bin/env bash
# Smoke-test Frontend Expert pack integrity.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
FAIL=0

ok() { echo "  OK  $1"; }
bad() { echo "  FAIL $1" >&2; FAIL=1; }

echo "== skills =="
CANONICAL_SKILLS=(
  frontend-expert
  design-direction
  prototype
  design-foundations
  tokens
  components
  responsive
  anti-slop-design
  anti-slop-code
  polish
  accessibility
  performance
  motion
  motion-inspection
  testing
  quality-loop
  webgl
  monitoring
  data-fetching
  forms
  app-shell
  architecture
  seo
  fidelity
  devtools
  marketing
  design-typography
  design-color
  design-surfaces
  content-design
  design-vocabulary
  engineering-vocabulary
  skill-authoring
)

REMOVED_ALIASES=(
  frontend-judgment design-tokens ui-components responsive-ui anti-ai-slop
  ui-feel web-performance frontend-testing ui-quality-loop app-shell-routing
  forms-validation marketing-landing fe-architecture fe-seo fe-devtools
  design-fidelity writing-skills
)

EXPECTED_SKILLS=("${CANONICAL_SKILLS[@]}")

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

for s in "${REMOVED_ALIASES[@]}"; do
  if [ -e "$ROOT/skills/$s" ]; then
    bad "removed alias still exists: skills/$s"
  else
    ok "no legacy alias skills/$s"
  fi
done

skill_entry_count=$(find "$ROOT/skills" -mindepth 2 -maxdepth 2 -name SKILL.md | wc -l | tr -d ' ')
[ "$skill_entry_count" -eq 33 ] && ok "33 canonical skills only" || bad "expected 33 canonical skill entries, found $skill_entry_count"

if command -v jq >/dev/null 2>&1; then
  if jq -e '.version == "2.4.2" and (.skills | length == 33)' "$ROOT/plugin.json" >/dev/null; then
    ok "plugin v2.4.2 registers exactly 33 skills"
  else
    bad "plugin must be v2.4.2 with exactly 33 skills"
  fi
  for s in "${EXPECTED_SKILLS[@]}"; do
    if jq -e --arg path "skills/$s" '.skills | index($path) != null' "$ROOT/plugin.json" >/dev/null; then
      ok "plugin registers skills/$s"
    else
      bad "plugin missing skills/$s"
    fi
  done
fi

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
[ -f "$ROOT/references/design-foundations.md" ] && ok "references/design-foundations.md" || bad "references/design-foundations.md"
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
[ -f "$ROOT/evals/marketing-landing.md" ] && ok "evals/marketing-landing.md (E23)" || bad "evals/marketing-landing.md"
[ -f "$ROOT/evals/design-foundations.md" ] && ok "evals/design-foundations.md (E28)" || bad "evals/design-foundations.md"
[ -f "$ROOT/evals/components.md" ] && ok "evals/components.md (E29)" || bad "evals/components.md"
[ -f "$ROOT/evals/anti-slop-code.md" ] && ok "evals/anti-slop-code.md (E30)" || bad "evals/anti-slop-code.md"
[ -f "$ROOT/evals/prototype.md" ] && ok "evals/prototype.md (E31)" || bad "evals/prototype.md"
[ -f "$ROOT/evals/motion-inspection.md" ] && ok "evals/motion-inspection.md (E32)" || bad "evals/motion-inspection.md"
[ -f "$ROOT/references/anti-slop-code.md" ] && ok "references/anti-slop-code.md" || bad "references/anti-slop-code.md"
[ -f "$ROOT/references/prototype.md" ] && ok "references/prototype.md" || bad "references/prototype.md"
[ -f "$ROOT/references/motion-inspection.md" ] && ok "references/motion-inspection.md" || bad "references/motion-inspection.md"
[ -f "$ROOT/references/landing-sections.md" ] && ok "landing-sections.md" || bad "landing-sections.md"
for f in evidence-policy design-typography design-color design-surfaces content-design; do
  [ -f "$ROOT/references/$f.md" ] && ok "$f.md" || bad "references/$f.md"
done
[ ! -e "$ROOT/references/source-ledger.md" ] && ok "no external source ledger" || bad "references/source-ledger.md should not be distributed"
if rg -q 'source-ledger' "$ROOT/README.md" "$ROOT/NOTICE.md" "$ROOT/skills" "$ROOT/references"; then
  bad "source-ledger references remain"
else
  ok "rules are internalized without source-ledger references"
fi
for f in design-typography design-color design-surfaces content-design; do
  [ -f "$ROOT/evals/$f.md" ] && ok "evals/$f.md" || bad "evals/$f.md"
done
[ -f "$ROOT/NOTICE.md" ] && ok "NOTICE.md" || bad "NOTICE.md"
[ -f "$ROOT/references/skill-aliases.md" ] && ok "migration map skill-aliases.md" || bad "references/skill-aliases.md"
if rg -qi 'authored for this pack' "$ROOT/NOTICE.md" && rg -qi 'not bundled' "$ROOT/NOTICE.md"; then
  ok "authorship and research-only provenance are explicit"
else
  bad "NOTICE.md must distinguish pack authorship from external research"
fi
if rg -qi 'adapted from|adapted as|ideas adapted|portions .* adapted' \
  "$ROOT/README.md" "$ROOT/NOTICE.md" "$ROOT/skills" "$ROOT/references"; then
  bad "ambiguous third-party adaptation wording remains"
else
  ok "no ambiguous third-party adaptation wording"
fi
if rg -qi 'jakubkrehel|make-interfaces-feel-better' \
  "$ROOT/README.md" "$ROOT/NOTICE.md" "$ROOT/skills" "$ROOT/references"; then
  bad "studied repository links must not appear in the distributed pack"
else
  ok "no studied-repository promotion in distributed docs"
fi
if ! rg -q 'avatar' "$ROOT/skills/app-shell/SKILL.md" || ! rg -q 'custom select' "$ROOT/skills/components/SKILL.md"; then
  bad "shell chrome rules missing in app-shell / components"
else
  ok "shell chrome rules in skills"
fi
if ! rg -q 'responsive' "$ROOT/hooks/session-start.sh" || ! rg -q 'motion' "$ROOT/hooks/session-start.sh"; then
  bad "hooks/session-start.sh missing responsive/motion"
else
  ok "hooks/session-start responsive+motion"
fi

echo "== install adapters =="
if rg -q 'plugin.json' "$ROOT/scripts/install.sh" && rg -q 'load_pack_skills' "$ROOT/scripts/install.sh"; then
  ok "install.sh reads plugin.json skills"
else
  bad "install.sh must load skills from plugin.json"
fi
tmp_install=$(mktemp -d)
if bash "$ROOT/scripts/install.sh" cursor "$tmp_install"; then
  copied=$(find "$tmp_install/.cursor/skills" -mindepth 2 -maxdepth 2 -name SKILL.md | wc -l | tr -d ' ')
  if [ "$copied" -eq 33 ]; then
    ok "install.sh cursor copies 33 skills"
  else
    bad "install.sh cursor copied $copied skills, expected 33"
  fi
  if [ -f "$tmp_install/.cursor/skills/tokens/SKILL.md" ]; then
    ok "tokens skill not overwritten by CSS"
  else
    bad "tokens skill missing after cursor install"
  fi
  if [ -d "$tmp_install/.cursor/skills/token-presets" ]; then
    ok "token-presets CSS copied"
  else
    bad "token-presets CSS missing after cursor install"
  fi
  alias_left=0
  for s in "${REMOVED_ALIASES[@]}"; do
    if [ -e "$tmp_install/.cursor/skills/$s" ]; then
      alias_left=1
      bad "install.sh cursor copied removed alias $s"
    fi
  done
  [ "$alias_left" -eq 0 ] && ok "install.sh cursor has no removed aliases"
else
  bad "install.sh cursor failed"
fi
if bash "$ROOT/scripts/install.sh" gemini "$tmp_install"; then
  if [ -f "$tmp_install/.gemini/commands/ui.toml" ] && [ -f "$tmp_install/.gemini/commands/polish.toml" ]; then
    ok "install.sh gemini copies slash commands"
  else
    bad "install.sh gemini missing command toml"
  fi
else
  bad "install.sh gemini failed"
fi
rm -rf "$tmp_install"

echo "== eval routing =="
chmod +x "$ROOT/scripts/eval-routing-contract.sh" 2>/dev/null || true
[ -f "$ROOT/evals/PASTE.md" ] && ok "evals/PASTE.md" || bad "evals/PASTE.md"
[ -f "$ROOT/evals/runs/2026-09-10-desk.md" ] && ok "evals/runs/2026-09-10-desk.md" || bad "evals/runs/2026-09-10-desk.md"
[ -f "$ROOT/evals/runs/2026-09-10-install.md" ] && ok "evals/runs/2026-09-10-install.md" || bad "evals/runs/2026-09-10-install.md"
if bash "$ROOT/scripts/eval-routing-contract.sh"; then
  ok "eval-routing-contract"
else
  bad "eval-routing-contract"
fi

if [ "$FAIL" -ne 0 ]; then
  echo
  echo "smoke-test: FAILED" >&2
  exit 1
fi

echo
echo "smoke-test: PASSED"
