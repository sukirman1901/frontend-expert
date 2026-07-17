#!/usr/bin/env bash
# design-system-enforcer session start hook

set -euo pipefail

if ! command -v jq >/dev/null 2>&1; then
  echo '{"priority": "INFO", "message": "design-system-enforcer: jq missing. Chat-first + judgment: for blank-canvas UI offer 2–3 approaches before coding. Slash optional."}'
  exit 0
fi

jq -cn \
  --arg message "design-system-enforcer loaded (chat-first + judgment).

Do NOT wait for slash commands.

Blank-canvas / ambiguous UI → frontend-judgment first (2–3 approaches + tradeoffs + recommendation), THEN:
  design-tokens → ui-components → anti-ai-slop → accessibility

- Design audit / AI slop → anti-ai-slop → design-tokens → accessibility → web-performance
- UI tests / TDD → frontend-testing → ui-components → accessibility
- Motion only if user asks to animate
- Skip judgment for tiny clear fixes or \"langsung saja\"

Optional shortcuts: /ui · /design · /audit · /test-ui
Agents: ui-developer · design-reviewer · test-engineer
Tokens: tokens/*.css (or project system). No purple defaults, raw hex, or Lorem ipsum." \
  '{priority: "IMPORTANT", message: $message}'
