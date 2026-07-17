#!/usr/bin/env bash
# design-system-enforcer / frontend-expert session start hook

set -euo pipefail

if ! command -v jq >/dev/null 2>&1; then
  echo '{"priority": "INFO", "message": "frontend-expert: jq missing. Chat-first: map UI intent to skills. Polish loop: ui-quality-loop. Slash optional."}'
  exit 0
fi

jq -cn \
  --arg message "frontend-expert loaded (chat-first + judgment + quality loop).

Do NOT wait for slash commands.

- Build UI → frontend-judgment* → design-tokens → ui-components → anti-ai-slop → accessibility
- Test → frontend-testing (test-engineer)
- Audit → anti-ai-slop → tokens → a11y → web-performance (design-reviewer) [/design|/audit]
- Polish until good → ui-quality-loop [/polish]: build→test→audit→fix (max 3)

* Skip judgment for tiny fixes or \"langsung saja\"
Optional: /ui · /test-ui · /design · /audit · /polish
Agents: ui-developer · test-engineer · design-reviewer
Tokens: tokens/*.css (or project system). No purple defaults, raw hex, or Lorem ipsum." \
  '{priority: "IMPORTANT", message: $message}'
