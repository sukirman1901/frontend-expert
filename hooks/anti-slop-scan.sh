#!/usr/bin/env bash
# anti-slop-scan — PostToolUse hook for Edit|Write
# Warns when written UI files contain common AI aesthetic patterns.
# Does not block the write; emits an advisory message on stderr/stdout.

set -euo pipefail

INPUT=$(cat || true)

if ! command -v jq >/dev/null 2>&1; then
  exit 0
fi

TOOL=$(echo "$INPUT" | jq -r '.tool_name // .toolName // empty' 2>/dev/null || true)
FILE=$(echo "$INPUT" | jq -r '
  .tool_input.file_path
  // .tool_input.path
  // .tool_input.filePath
  // .input.file_path
  // .input.path
  // empty
' 2>/dev/null || true)

# Fallback: try common nested shapes
if [ -z "$FILE" ]; then
  FILE=$(echo "$INPUT" | jq -r '.. | objects | .file_path // .path // empty' 2>/dev/null | head -1 || true)
fi

case "$FILE" in
  *.css|*.scss|*.sass|*.less|*.tsx|*.jsx|*.vue|*.svelte|*.html|*.css.ts|*.module.css) ;;
  *) exit 0 ;;
esac

if [ -z "$FILE" ] || [ ! -f "$FILE" ]; then
  exit 0
fi

HITS=()

# Purple / indigo defaults common in AI output
if rg -n -i --no-heading \
  '(#7c3aed|#6366f1|#8b5cf6|#a855f7|#4f46e5|text-purple-|bg-purple-|text-indigo-|bg-indigo-|from-purple|to-indigo|via-violet)' \
  "$FILE" >/tmp/dse-anti-slop-color.$$ 2>/dev/null; then
  HITS+=("purple/indigo palette not from tokens")
fi

# Excessive gradients
if rg -n -i --no-heading \
  '(bg-gradient-to-|linear-gradient|radial-gradient)' \
  "$FILE" >/tmp/dse-anti-slop-grad.$$ 2>/dev/null; then
  HITS+=("gradient usage — prefer flat token colors unless intentional")
fi

# Rounded everything
if rg -n --no-heading 'rounded-2xl|rounded-3xl' "$FILE" >/tmp/dse-anti-slop-radius.$$ 2>/dev/null; then
  HITS+=("large border-radius (rounded-2xl/3xl) — use token radius")
fi

# Lorem ipsum
if rg -n -i --no-heading 'lorem ipsum' "$FILE" >/tmp/dse-anti-slop-lorem.$$ 2>/dev/null; then
  HITS+=("Lorem ipsum placeholder text")
fi

# transition: all — animates unintended properties (ui-feel)
# CSS: transition: all … | Tailwind bare `transition` / `transition-all` (not transition-transform, etc.)
if rg -n --no-heading \
  -e 'transition\s*:\s*all\b' \
  -e 'transition-all\b' \
  "$FILE" >/tmp/dse-anti-slop-transition.$$ 2>/dev/null; then
  HITS+=("transition: all / transition-all — name properties (see ui-feel)")
fi

# Tailwind \`transition\` utility alone (maps to all) — advisory, skip if already more specific
if rg -n --no-heading -e 'class(Name)?=\{?["'\''][^"'\'']*\btransition\b' "$FILE" >/tmp/dse-anti-slop-tw-tr.$$ 2>/dev/null; then
  if rg -n --no-heading -e 'class(Name)?=\{?["'\''][^"'\'']*\btransition\b' "$FILE" 2>/dev/null \
    | rg -v 'transition-(all|none|transform|opacity|colors|shadow|blur|\[)' >/tmp/dse-anti-slop-tw-bare.$$ 2>/dev/null; then
    if [ -s /tmp/dse-anti-slop-tw-bare.$$ ]; then
      HITS+=("Tailwind bare transition utility — prefer transition-transform or transition-[…]")
    fi
  fi
fi

# Raw hex in style/class contexts (advisory — tokens may embed hex in CSS var files)
if [[ "$FILE" != *"/tokens/"* ]] && rg -n --no-heading \
  '#[0-9a-fA-F]{3,8}\b' "$FILE" >/tmp/dse-anti-slop-hex.$$ 2>/dev/null; then
  # Ignore if file mostly uses CSS variables
  if ! rg -q -- '--[a-zA-Z0-9-]+:' "$FILE" 2>/dev/null; then
    HITS+=("raw hex colors — prefer CSS custom properties from tokens")
  fi
fi

rm -f /tmp/dse-anti-slop-*.$$ 2>/dev/null || true

if [ ${#HITS[@]} -eq 0 ]; then
  exit 0
fi

MSG="[design-system-enforcer] AI aesthetic warning in ${FILE} (tool=${TOOL:-Edit/Write}):"
for h in "${HITS[@]}"; do
  MSG="$MSG
- $h"
done
MSG="$MSG

Load anti-ai-slop / ui-feel (references/anti-patterns.md, references/ui-feel.md) and fix before shipping. Prefer tokens/ CSS variables."

# Claude Code surfaces stderr from hooks to the model
echo "$MSG" >&2
exit 0
