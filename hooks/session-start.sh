#!/usr/bin/env bash
# design-system-enforcer / frontend-expert session start hook

set -euo pipefail

if ! command -v jq >/dev/null 2>&1; then
  echo '{"priority": "INFO", "message": "frontend-expert: jq missing. Chat-first: map UI intent to skills. Polish loop: ui-quality-loop. Slash optional."}'
  exit 0
fi

jq -cn \
  --arg message "frontend-expert loaded (chat-first + FE lifecycle + quality loop).

Do NOT wait for slash commands.

Lifecycle: pahami → putuskan → sistem → bangun → haluskan → a11y → bukti → audit → fix (cap 3) → ship
See references/fe-lifecycle.md

- Build UI → frontend-judgment* → design-tokens → ui-components → anti-ai-slop → ui-feel → accessibility
- Test → frontend-testing (test-engineer)
- Audit → anti-ai-slop → ui-feel → tokens → a11y → web-performance (design-reviewer) [/design|/audit]
- Polish until good → ui-quality-loop [/polish]: build→test→audit→fix (max 3)
- Feels off / rapihin detail → ui-feel (one pass). Rapihin sampai bagus → ui-quality-loop

* Skip judgment for tiny fixes or \"langsung saja\"
Optional: /ui · /test-ui · /design · /audit · /polish
Agents: ui-developer · test-engineer · design-reviewer
Tokens: decision tree (custom → explicit → Plasma hard-gate → score). Responsive MUST (320–1440). Icons: MUST use Reicon in markup (or waive). WebGL/plasma → skill webgl / Plasma.init.
Before DONE: Conventions check (references/compliance-gates.md)." \
  '{priority: "IMPORTANT", message: $message}'
