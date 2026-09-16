#!/usr/bin/env bash
# Smoke-test Frontend Expert pack integrity.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
FAIL=0

ok() { echo "  OK  $1"; }
bad() { echo "  FAIL $1" >&2; FAIL=1; }

if command -v jq >/dev/null 2>&1; then
  RELEASE_VERSION=$(jq -er '.version | select(type == "string" and length > 0)' "$ROOT/plugin.json" 2>/dev/null || true)
  if [ -n "$RELEASE_VERSION" ]; then
    ok "root plugin defines canonical release v$RELEASE_VERSION"
  else
    bad "root plugin must define a non-empty string version"
  fi
else
  RELEASE_VERSION=""
  bad "jq is required to validate release consistency"
fi

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

if [ -n "$RELEASE_VERSION" ]; then
  if jq -e '.skills | length == 33' "$ROOT/plugin.json" >/dev/null; then
    ok "plugin v$RELEASE_VERSION registers exactly 33 skills"
  else
    bad "plugin v$RELEASE_VERSION must register exactly 33 skills"
  fi
  if jq -e --arg version "$RELEASE_VERSION" '.version == $version' "$ROOT/.codex-plugin/plugin.json" >/dev/null; then
    ok ".codex-plugin manifest matches v$RELEASE_VERSION"
  else
    bad ".codex-plugin manifest must match v$RELEASE_VERSION"
  fi
  for s in "${EXPECTED_SKILLS[@]}"; do
    if jq -e --arg path "skills/$s" '.skills | index($path) != null' "$ROOT/plugin.json" >/dev/null; then
      ok "plugin registers skills/$s"
    else
      bad "plugin missing skills/$s"
    fi
  done
  if sed -n '/^metadata:/,/^---$/p' "$ROOT/skills/frontend-expert/SKILL.md" | rg -Fxq "  version: \"$RELEASE_VERSION\""; then
    ok "frontend-expert skill metadata matches v$RELEASE_VERSION"
  else
    bad "frontend-expert skill metadata must match v$RELEASE_VERSION"
  fi

  if rg -Fq "Current pack version is **$RELEASE_VERSION**." "$ROOT/docs/pillars.md"; then
    ok "pillars current version matches v$RELEASE_VERSION"
  else
    bad "pillars current version must match v$RELEASE_VERSION"
  fi

  latest_changelog_version=$(sed -nE 's/^## \[([^]]+)\].*/\1/p' "$ROOT/CHANGELOG.md" | head -1)
  if [ "$latest_changelog_version" = "$RELEASE_VERSION" ]; then
    ok "latest changelog heading matches v$RELEASE_VERSION"
  else
    bad "latest changelog heading must match v$RELEASE_VERSION (found ${latest_changelog_version:-none})"
  fi
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
    (.agents // [])[]
  ' "$ROOT/.claude-plugin/plugin.json" 2>/dev/null | sed '/\[/d')
  if jq -e '.hooks != null' "$ROOT/.claude-plugin/plugin.json" >/dev/null; then
    bad "claude plugin.json must omit hooks (Claude auto-loads hooks/hooks.json; duplicate load error)"
  else
    ok "claude plugin.json omits hooks (auto-load)"
  fi
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
if [ -f "$ROOT/evals/button-optical-alignment.md" ] \
  && head -n 1 "$ROOT/evals/button-optical-alignment.md" | rg -qi '^# Eval E33:'; then
  ok "evals/button-optical-alignment.md (E33)"
else
  bad "evals/button-optical-alignment.md must exist and be labeled E33"
fi
e33="$ROOT/evals/button-optical-alignment.md"
e33_pass=$(awk '
  /^## Pass criteria[[:space:]]*$/ { in_section=1; next }
  in_section && /^##[[:space:]]/ { exit }
  in_section { print }
' "$e33")
e33_fail=$(awk '
  /^## Fail signals[[:space:]]*$/ { in_section=1; next }
  in_section && /^##[[:space:]]/ { exit }
  in_section { print }
' "$e33")
if printf '%s\n' "$e33_pass" | rg -qi 'populated[[:space:]]+`?- Control geometry:' \
  && printf '%s\n' "$e33_pass" | rg -qi 'actual project radius token' \
  && printf '%s\n' "$e33_pass" | rg -qi 'rendered text-only/leading-icon/trailing-icon/icon-only' \
  && printf '%s\n' "$e33_pass" | rg -qi 'relevant states' \
  && printf '%s\n' "$e33_pass" | rg -qi 'observed optical-balance outcome' \
  && printf '%s\n' "$e33_pass" | rg -qi 'actual inspected target.*component.*URL' \
  && printf '%s\n' "$e33_pass" | rg -qi 'render provenance.*browser.*screenshot.*DOM artifact.*real render method' \
  && printf '%s\n' "$e33_pass" | rg -qi 'prose simulation.*stand-in fixture.*(invalid|fail|not target evidence)' \
  && printf '%s\n' "$e33_pass" | rg -qi '`not evaluated`.*(incomplete|fail).*(not.*pass|cannot pass)' \
  && printf '%s\n' "$e33_pass" | rg -qi 'literal schema placeholder.*fail' \
  && printf '%s\n' "$e33_pass" | rg -qi '`n/a`.*fail' \
  && printf '%s\n' "$e33_fail" | rg -qi '(prose simulation|stand-in fixture)' \
  && printf '%s\n' "$e33_fail" | rg -qi '`not evaluated`.*(pass|complete)'; then
  ok "E33 requires real rendered Control geometry evidence"
else
  bad "E33 must require target + render provenance, reject simulated/stand-in evidence, and keep not-evaluated outcomes incomplete"
fi
[ -f "$ROOT/references/anti-slop-code.md" ] && ok "references/anti-slop-code.md" || bad "references/anti-slop-code.md"

good_ui="$ROOT/references/good-ui-principles.md"
anti_patterns="$ROOT/references/anti-patterns.md"
anti_slop_skill="$ROOT/skills/anti-slop-design/SKILL.md"
references_map="$ROOT/references/README.md"

if [ -f "$good_ui" ]; then
  ok "references/good-ui-principles.md"
else
  bad "references/good-ui-principles.md"
fi

good_ui_map_row=$(rg -F '| `good-ui-principles.md` | `anti-slop-design`' "$references_map" || true)
good_ui_map_complete=1
for owner in design-foundations design-color design-typography components forms accessibility; do
  if ! printf '%s\n' "$good_ui_map_row" | rg -Fq "\`$owner\`"; then
    good_ui_map_complete=0
  fi
done
if [ -n "$good_ui_map_row" ] && [ "$good_ui_map_complete" -eq 1 ]; then
  ok "references map links Good UI principles and domain owners"
else
  bad "Good UI references-map row must link anti-slop-design and every intended domain owner"
fi

if rg -Fq 'references/good-ui-principles.md' "$anti_slop_skill"; then
  ok "anti-slop-design links Good UI principles"
else
  bad "anti-slop-design must link references/good-ui-principles.md"
fi

anti_pattern_section() {
  local heading="$1"
  LC_ALL=C awk -v heading="### $heading" '
    { sub(/\r$/, "") }
    $0 == heading { in_section=1 }
    in_section && $0 != heading && (/^###[[:space:]]/ || /^##[[:space:]]/) { exit }
    in_section { print }
  ' "$anti_patterns"
}

if [ -f "$anti_patterns" ]; then
  high_contrast_section=$(anti_pattern_section "High Contrast Without Purpose")
  arbitrary_spacing_section=$(anti_pattern_section "Arbitrary Pixel Values")

  if [ -n "$high_contrast_section" ] \
    && printf '%s\n' "$high_contrast_section" | rg -Fq 'references/good-ui-principles.md' \
    && printf '%s\n' "$high_contrast_section" | rg -qi 'decision hierarchy|project.*tokens?' \
    && printf '%s\n' "$high_contrast_section" | rg -qi 'measur(e|ed).*rendered.*(pair|contrast)|rendered.*(pair|contrast).*measur'; then
    ok "Legacy high-contrast anti-pattern routes decisions to evidence-aware project guidance"
  else
    bad "High Contrast Without Purpose must route to Good UI decision hierarchy/project tokens and measured rendered pairs"
  fi

  # Evidence-policy review is required for any edit to these two high-risk legacy
  # sections. Update a snapshot only after intentionally reviewing the full section.
  high_contrast_hash=$(anti_pattern_section "High Contrast Without Purpose" | git hash-object --stdin)
  arbitrary_spacing_hash=$(anti_pattern_section "Arbitrary Pixel Values" | git hash-object --stdin)
  if [ "$high_contrast_hash" = "ee1a084a10efd2015bba4791b797d289b5e91ee3" ]; then
    ok "Legacy high-contrast guidance matches its evidence-reviewed snapshot"
  else
    bad "High Contrast Without Purpose changed; require evidence-policy review and intentional snapshot update"
  fi

  if [ -n "$arbitrary_spacing_section" ] \
    && printf '%s\n' "$arbitrary_spacing_section" | rg -Fq 'references/good-ui-principles.md' \
    && printf '%s\n' "$arbitrary_spacing_section" | rg -qi 'project.*(tokens?|spacing scale)' \
    && printf '%s\n' "$arbitrary_spacing_section" | rg -qi 'relationship' \
    && printf '%s\n' "$arbitrary_spacing_section" | rg -qi '(4|8).*(fallback|heuristic)|(fallback|heuristic).*(4|8)'; then
    ok "Legacy spacing anti-pattern routes off-scale values through project relationships and fallback heuristics"
  else
    bad "Arbitrary Pixel Values must route to Good UI project tokens/relationships and label 4/8 rhythm as fallback heuristic"
  fi

  if [ "$arbitrary_spacing_hash" = "00490074936ec62bdd98b2753264d663b139c276" ]; then
    ok "Legacy spacing guidance matches its evidence-reviewed snapshot"
  else
    bad "Arbitrary Pixel Values changed; require evidence-policy review and intentional snapshot update"
  fi
else
  bad "references/anti-patterns.md"
fi

if [ -f "$good_ui" ] \
  && rg -qi 'evidence (class|classification)|classification' "$good_ui" \
  && rg -qi 'project (system|default).*first|existing project.*(tokens|components|conventions)' "$good_ui" \
  && rg -qi 'heuristic|fallback' "$good_ui"; then
  ok "Good UI principles classify evidence and define decision hierarchy"
else
  bad "Good UI principles must classify evidence, prefer the project system, and label numeric recipes as fallbacks/heuristics"
fi

if [ -f "$good_ui" ] \
  && rg -qi 'rendered (evidence|context|verification)|actual render' "$good_ui" \
  && rg -qi 'source inspection.*(not|cannot)|cannot.*source inspection' "$good_ui"; then
  ok "Good UI principles require rendered verification for visual claims"
else
  bad "Good UI principles must require actual rendered evidence and reject source-only visual claims"
fi

if [ -f "$good_ui" ] \
  && rg -qi 'achromatic' "$good_ui" \
  && rg -qi 'tinted neutral' "$good_ui" \
  && rg -qi 'context|token' "$good_ui"; then
  ok "Good UI principles allow contextual achromatic or tinted neutrals"
else
  bad "Good UI principles must allow achromatic and tinted neutrals according to context and tokens"
fi

if [ -f "$good_ui" ] \
  && rg -qi 'conditional recipe|apply when|when .* applies|context-dependent' "$good_ui" \
  && rg -qi 'accessibility.*(canonical|owner)|canonical.*accessibility' "$good_ui"; then
  ok "Good UI principles keep recipes conditional and route accessibility"
else
  bad "Good UI principles must make recipes conditional and route formal accessibility to its canonical owner"
fi

if [ -f "$good_ui" ] \
  && ! rg -Fq 'spacing/margin/dimension = multiples of 8 (4 for fine detail). Never arbitrary.' "$good_ui" \
  && ! rg -Fq 'spacing/margin/dimension = multiples of 8 (4 for fine detail). Never arbitrary.' "$anti_slop_skill"; then
  ok "Good UI guidance avoids universal 8-point sentence"
else
  bad "Good UI guidance must not contain the universal 8-point sentence"
fi

good_ui_section() {
  local heading="$1"
  awk -v heading="## $heading" '
    $0 == heading { in_section=1; next }
    in_section && /^##[[:space:]]/ { exit }
    in_section { print }
  ' "$good_ui"
}

good_ui_domain_contract() {
  local heading="$1"
  local label="$2"
  shift 2
  local section
  local pattern
  local complete=1
  section=$(good_ui_section "$heading")
  [ -n "$section" ] || complete=0
  for pattern in "$@"; do
    if ! printf '%s\n' "$section" | rg -qi "$pattern"; then
      complete=0
    fi
  done
  if [ "$complete" -eq 1 ]; then
    ok "Good UI principles preserve $label guidance"
  else
    bad "Good UI principles $heading section must preserve explicit $label guidance"
  fi
}

if [ -f "$good_ui" ]; then
  good_ui_domain_contract "Spacing and layout" "spacing and layout" 'project.*spacing scale' '4- or 8-unit.*heuristic' 'mobile-first.*responsive viewports'
  color_section=$(good_ui_section "Color")
  if [ -n "$color_section" ] \
    && printf '%s\n' "$color_section" | rg -qi 'achromatic neutrals' \
    && printf '%s\n' "$color_section" | rg -qi 'tinted neutrals' \
    && printf '%s\n' "$color_section" | rg -qi 'brand|context|token'; then
    ok "Good UI principles preserve contextual neutral-color guidance"
  else
    bad "Good UI principles Color section must preserve achromatic/tinted neutral choice by context or tokens"
  fi
  good_ui_domain_contract "Shadows and gradients" "shadows and gradients" 'elevation.*layering' 'light direction' 'Gradients.*hierarchy' 'banding.*text contrast'
  good_ui_domain_contract "Typography" "typography" 'type roles' 'two families' 'one page-level `<h1>`' 'sequential lower heading levels' 'wrapping.*truncation'
  good_ui_domain_contract "Buttons" "button hierarchy and states" 'primary.*secondary.*tertiary' 'hover.*focus.*pressed.*disabled.*loading' 'target.*fallback'
  good_ui_domain_contract "Forms" "forms and validation" 'labels.*placeholder' 'validation.*field' 'pending.*failure.*recovery.*success'
  good_ui_domain_contract "Cards" "card structure and interaction" 'bounded object or action' 'whole card interactive' 'truncation.*bottom-aligned' 'Spacing ranges.*heuristic'
  good_ui_domain_contract "Hero" "hero composition and hierarchy" 'F-like.*Z-like' 'one CTA primary' 'social proof' 'marketing.*section stack'
  good_ui_domain_contract "Modal and destructive actions" "modal and destructive-action safety" 'close or cancel' 'reversible.*destructive' 'Confirmation dialogs' 'progress.*recovery'
  good_ui_domain_contract "Dropdown and search" "dropdown and search states" 'radios.*chips.*select.*combobox' 'Long lists' 'recent queries.*autocomplete.*conditional' 'no-results.*keyboard states'
  good_ui_domain_contract "Navigation" "navigation" 'current-location state' 'Sticky headers' 'information architecture' 'app-shell'
  good_ui_domain_contract "Style system" "style guide and system" 'semantic color.*type.*spacing.*radius.*elevation.*motion' 'shared system' 'token.*repeated decision' 'component.*stable responsibility'

  good_ui_expansion_structure=1
  for heading in \
    "Content and microcopy" \
    "Interaction and input patterns" \
    "Cognitive load and navigation" \
    "Pricing and choice architecture"; do
    if ! rg -Fxq "## $heading" "$good_ui"; then
      good_ui_expansion_structure=0
    fi
  done
  if [ "$good_ui_expansion_structure" -eq 1 ]; then
    ok "Good UI principles preserve expansion H2 structure"
  else
    bad "Good UI principles must keep each expansion domain as an exact H2 section"
  fi

  good_ui_domain_contract "Content and microcopy" "truthful content routing" \
    'Protect product truth' \
    'Destination navigation labels may omit verbs.*different from an action control' \
    'Dialog actions need unambiguous outcome labels.*affected object' \
    'Canonical owner: `content-design`'
  good_ui_domain_contract "Color" "contextual color and media verification" \
    'black and white may be correct.*near-black and off-white may reduce glare' \
    'choice is conditional on project tokens.*measured contrast' \
    'Dark-mode tone ranges and the number of selection colors are similarly contextual' \
    'Text over imagery may need an overlay, scrim.*or image replacement' \
    'measure rendered contrast.*representative crops and responsive viewports'
  good_ui_domain_contract "Spacing and layout" "expanded layout classification" \
    'single-column.*default.*not universal' \
    'Dividers.*real boundaries' \
    'long-form.*heuristic' \
    'prose scroll.*data.*code.*list scroll.*valid' \
    'Gutenberg.*inspiration only'
  good_ui_domain_contract "Interaction and input patterns" "interaction routing" \
    'Choose a choice control from comparison needs.*semantics.*accessibility.not a fixed option count' \
    'slider for an approximate range.*provide a precise alternative' \
    'Input masks must preserve paste, autofill.*locale-aware formats' \
    'Swipe actions require a visible single-pointer alternative and a keyboard alternative' \
    'Inline errors route to `forms` and `accessibility`' \
    'canonical conditional relation `outer ≈ inner \+ inset`.*concentric geometry applies' \
    'canonical 24px accessibility standard.*44px recommendation'
  good_ui_domain_contract "Cognitive load and navigation" "cognitive-load safeguards" \
    'Reduce choices contextually.*do not hide necessary comparison' \
    'Other.*free text only when the domain permits an unmodeled answer' \
    'danger semantic token.*plus non-color cues' \
    'Serial-position research can inform evaluation.*never put important navigation items at corners' \
    'two typefaces in line with project and brand needs'
  good_ui_domain_contract "Pricing and choice architecture" "pricing safeguards" \
    'Emphasize a plan only from verified user value or product data' \
    'transparent comparison of features and prices.*avoid dark patterns' \
    'CTA hierarchy plus measured contrast.*do not blindly apply the primary token'

  good_ui_forbidden=0
  content_section=$(good_ui_section "Content and microcopy")
  color_section=$(good_ui_section "Color")
  interaction_section=$(good_ui_section "Interaction and input patterns")
  dropdown_section=$(good_ui_section "Dropdown and search")
  cognitive_section=$(good_ui_section "Cognitive load and navigation")
  pricing_section=$(good_ui_section "Pricing and choice architecture")
  pricing_guard_text=$(printf '%s\n' "$pricing_section" | sed -E \
    's/((must|should|may|can|is|are|was|were)[[:space:]]+)?(never|not)[[:space:]]+(be[[:space:]]+)?(fabricat(e|ed|ing)|invent(ed|ing)?)/ /Ig')
  if printf '%s\n' "$content_section" | rg -qi \
    '((recommend|prefer|should|must|always)[^.\n]*(invent(ed)?|fabricat(ed)?)[^.\n]*(urgency|scarcity|popularity))|(^|[.!?][[:space:]]+)Use[[:space:]]+(invented|fabricated)[^.\n]*(urgency|scarcity|popularity)|((recommend|prefer|should|must|always|use)[^.\n]*Don.t Cancel)|(Don.t Cancel[^.\n]*(recommended|preferred|required))'; then
    good_ui_forbidden=1
  fi
  if printf '%s\n' "$color_section" | rg -qi \
    '((never|forbid|must not)[^.\n]*(literal|pure)?[ -]*(black|white))|((always|must|required)[^.\n]*(near-black|off-white))|(dark(-mode)? (tone|palette)s?[^.\n]*(must|require|always)[^.\n]*[0-9]+)|(selection colou?rs?[^.\n]*(must|require|limit|cap|always)[^.\n]*[0-9]+)'; then
    good_ui_forbidden=1
  fi
  if printf '%s\n%s\n' "$interaction_section" "$dropdown_section" | rg -qi \
    '((dropdown|select|combobox|radio|chips?)[^.\n]*(must|required|only|always)[^.\n]*[0-9]+)|([0-9]+[^.\n]*(options?|choices?)[^.\n]*(must|required|always)[^.\n]*(dropdown|select|combobox|radio|chips?))|swipe[- ]only|only (by )?swip(e|ing)|((always|must|required)[^.\n]*(halve|half)[^.\n]*radius)|(inner radius[^.\n]*(must|always|required)[^.\n]*(half|50%))'; then
    good_ui_forbidden=1
  fi
  if printf '%s\n' "$cognitive_section" | rg -qi \
    '(danger|destructive)[^.\n]*(colou?r only|only colou?r)|serial-position[^.\n]*(requires?|must|always)[^.\n]*corners|(requires?|must|always)[^.\n]*corners[^.\n]*serial-position'; then
    good_ui_forbidden=1
  fi
  if printf '%s\n' "$pricing_guard_text" | rg -qi \
    '((fabricat(e|ed|ing)|invent(ed|ing)?)[^.\n]*Most Popular)|(Most Popular[^.\n]*(fabricat(e|ed|ing)|invent(ed|ing)?))|(Most Popular[^.\n]*(without|regardless of)[^.\n]*(evidence|data))|(Most Popular( badge)?[[:space:]]+(should|must|always|is required to)[[:space:]]+(be[[:space:]]+)?(used|added|shown|required))|(CTA[^.\n]*(must|always|required)[^.\n]*primary (token|colou?r))|(primary (token|colou?r)[^.\n]*(must|always|required)[^.\n]*CTA)'; then
    good_ui_forbidden=1
  fi
  if [ "$good_ui_forbidden" -eq 0 ]; then
    ok "Good UI principles reject unsafe opposite formulations"
  else
    bad "Good UI principles contain a universal, deceptive, inaccessible, or unsafe opposite formulation"
  fi

  good_ui_h1_count=$(rg -c '^# ' "$good_ui")
  if [ "$good_ui_h1_count" -eq 1 ] \
    && rg -qi 'Pixsel Academy.*craft heuristic.*inspiration' "$good_ui" \
    && ! rg -qi 'source-ledger|^##?[[:space:]]+NEW([[:space:]]|$)|\*\*NEW\*\*|^# .*Pixsel|^# .*50 UI|\[[^]]*(Pixsel|Adrian|Kuleszo)[^]]*\]\(https?://|https?://[^[:space:])]*(pixsel|kuleszo)' "$good_ui"; then
    ok "Good UI principles keep one H1 and classified craft provenance"
  else
    bad "Good UI principles must keep one H1, classified craft provenance, and no source-dump bookkeeping or promotional source link"
  fi
else
  bad "Good UI domain contracts require references/good-ui-principles.md"
fi
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
if rg -Fqx -- '- Control geometry: <radius token + text/icon optical balance + relevant states checked | n/a | waiver: …>' \
  "$ROOT/references/compliance-gates.md" \
  || rg -Fqx -- '- Control geometry: <radius token + text/icon optical balance + relevant states checked | n/a | waiver: ...>' \
    "$ROOT/references/compliance-gates.md"; then
  ok "control geometry conventions gate"
else
  bad "references/compliance-gates.md missing canonical positive '- Control geometry:' conventions bullet"
fi
polish_control_geometry=$(awk '
  /^## Control geometry[[:space:]]*$/ { in_section=1; next }
  in_section && /^##[[:space:]]/ { exit }
  in_section { print }
' "$ROOT/skills/polish/SKILL.md")
polish_matrix=0
while IFS= read -r line; do
  if printf '%s\n' "$line" | rg -qi '^[[:space:]]*(-[[:space:]]+\[[ xX]\]|[-*]|\|)' \
    && printf '%s\n' "$line" | rg -qi 'matrix|variants?[[:space:]]*:' \
    && printf '%s\n' "$line" | rg -qi 'text[[:space:]-]*only' \
    && printf '%s\n' "$line" | rg -qi 'leading[[:space:]-]+icon' \
    && printf '%s\n' "$line" | rg -qi 'trailing[[:space:]-]+icon' \
    && printf '%s\n' "$line" | rg -qi 'icon[[:space:]-]*only' \
    && printf '%s\n' "$line" | rg -qi 'render(ed|ing)?|optical' \
    && ! printf '%s\n' "$line" | rg -qi '\b(do not|don.t|skip|ignore|omit)[[:space:]]+(verify|render|test|check|compare)'; then
    polish_matrix=1
    break
  fi
done <<< "$polish_control_geometry"
if [ -n "$polish_control_geometry" ] && [ "$polish_matrix" -eq 1 ]; then
  ok "polish control variant matrix"
else
  bad "skills/polish/SKILL.md missing affirmative ## Control geometry matrix line with all four variants + rendered/optical proof"
fi
if rg -qi 'icon[[:space:]-]+slot' "$ROOT/skills/components/SKILL.md"; then
  ok "components icon slot contract"
else
  bad "skills/components/SKILL.md missing icon slot contract"
fi
if rg -Fqx -- '| **Control geometry** | radius follows project tokens; text/icon variants are optically balanced; pending/disabled/focus states do not shift geometry |' \
  "$ROOT/skills/quality-loop/SKILL.md"; then
  ok "quality-loop Control Geometry check"
else
  bad "skills/quality-loop/SKILL.md missing canonical positive Control geometry gate row"
fi
if rg -Fqx -- '- **Control Geometry:** High for primary or repeated control geometry violations; Medium for isolated secondary control geometry violations.' \
  "$ROOT/agents/design-reviewer.md"; then
  ok "design-reviewer Control Geometry check"
else
  bad "agents/design-reviewer.md missing canonical positive Control Geometry severity rule"
fi
agents_hard_rules=$(awk '
  /^## Hard rules[[:space:]]*$/ { in_section=1; next }
  in_section && /^##[[:space:]]/ { exit }
  in_section { print }
' "$ROOT/AGENTS.md")
if printf '%s\n' "$agents_hard_rules" | rg -q 'Before DONE .*Conventions check.*Control [Gg]eometry'; then
  ok "AGENTS hard Conventions rule includes Control geometry"
else
  bad "AGENTS.md hard Conventions rule must include Control geometry"
fi
if rg -Fq -- '- Control geometry: <radius token + text/icon optical balance + relevant states checked | n/a | waiver: …>' \
  "$ROOT/hooks/session-start.sh"; then
  ok "session hook injects canonical Control geometry gate"
else
  bad "hooks/session-start.sh must inject canonical Control geometry gate"
fi
readme_conventions=$(awk '
  /^## Conventions check[[:space:]]*$/ { in_section=1; next }
  in_section && /^##[[:space:]]/ { exit }
  in_section { print }
' "$ROOT/README.md")
if printf '%s\n' "$readme_conventions" | rg -Fqx -- '- Control geometry: <radius token + text/icon optical balance + relevant states checked | n/a | waiver: …>'; then
  ok "README canonical Control geometry convention"
else
  bad "README Conventions check must include canonical Control geometry line"
fi
for public_index in "$ROOT/README.md" "$ROOT/CLAUDE.md" "$ROOT/references/README.md"; do
  public_label=${public_index#"$ROOT/"}
  if rg -q 'E1[–-]E33' "$public_index" && ! rg -q 'E1[–-]E32' "$public_index"; then
    ok "$public_label publishes E1–E33"
  else
    bad "$public_index must publish E1–E33 without stale E1–E32 claims"
  fi
done
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
e33_paste=$(awk '
  /^## E33 .*button optical alignment/ { in_section=1; next }
  in_section && /^##[[:space:]]/ { exit }
  in_section { print }
' "$ROOT/evals/PASTE.md")
if [ -f "$ROOT/evals/PASTE.md" ] \
  && rg -q '^## E33 .*button optical alignment' "$ROOT/evals/PASTE.md" \
  && printf '%s\n' "$e33_paste" | rg -qi 'text-only.*leading icon.*trailing icon.*icon-only' \
  && printf '%s\n' "$e33_paste" | rg -qi 'Control geometry' \
  && printf '%s\n' "$e33_paste" | rg -qi 'actual.*target.*(component|URL)' \
  && printf '%s\n' "$e33_paste" | rg -qi 'render provenance' \
  && printf '%s\n' "$e33_paste" | rg -qi 'not evaluated.*incomplete'; then
  ok "evals/PASTE.md includes runnable E33 prompt"
else
  bad "evals/PASTE.md missing runnable E33 button optical alignment prompt"
fi
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
