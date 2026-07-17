#!/usr/bin/env bash
# frontend-expert session start hook

set -euo pipefail

if ! command -v jq >/dev/null 2>&1; then
  echo '{"priority": "INFO", "message": "frontend-expert: jq missing. Chat-first: map UI intent to skills (AGENTS.md). Include responsive-ui + motion. Polish: ui-quality-loop. Slash optional."}'
  exit 0
fi

jq -cn \
  --arg message "frontend-expert loaded (chat-first + FE lifecycle + quality loop · 20 skills).

Do NOT wait for slash commands. See AGENTS.md + docs/pillars.md.

Lifecycle: pahami → putuskan → sistem → bangun → haluskan → a11y → bukti → audit → fix (cap 3) → ship
See references/fe-lifecycle.md

- Build UI → frontend-judgment* → design-tokens → (+ shell/data/forms) → ui-components → responsive-ui → motion (light shell; marketing = motion-families hand-roll) → anti-ai-slop → ui-feel → accessibility
- Test → frontend-testing (+ fe-devtools when measuring) (test-engineer)
- Audit → anti-ai-slop → ui-feel → tokens → responsive-ui → motion (if animated) → a11y → web-performance (+ design-fidelity / fe-devtools as needed) [/design|/audit]
- Polish until good → ui-quality-loop [/polish]: build→test→audit→fix (max 3)
- Feels off / rapihin detail → ui-feel (one pass). Rapihin sampai bagus → ui-quality-loop

* Skip judgment for tiny fixes or \"langsung saja\"
Optional: /ui · /test-ui · /design · /audit · /polish
Agents: ui-developer · test-engineer · design-reviewer
Tokens: decision tree (custom → explicit → Plasma hard-gate → score). Responsive MUST (320–1440 + full-width CTA <768). Hierarchy + Typography ship gates. Motion: families/patterns named; hand-roll (not registry default). Icons: MUST use Reicon in markup (or waive). WebGL/plasma → skill webgl / Plasma.init.
Before DONE: Conventions check — Tokens / Icons / States / Responsive / Hierarchy / Typography / Motion / A11y / WebGL (references/compliance-gates.md)." \
  '{priority: "IMPORTANT", message: $message}'
