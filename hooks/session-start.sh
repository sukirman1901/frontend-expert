#!/usr/bin/env bash
# frontend-expert session start hook

set -euo pipefail

if ! command -v jq >/dev/null 2>&1; then
  echo '{"priority": "INFO", "message": "frontend-expert: jq missing. Chat-first: map UI intent to skills (AGENTS.md). Include responsive + motion. Polish: quality-loop. Slash optional."}'
  exit 0
fi

jq -cn \
  --arg message "frontend-expert loaded (chat-first + FE lifecycle + quality loop · 31 skills).

Do NOT wait for slash commands. See AGENTS.md + docs/pillars.md.

Lifecycle: pahami → putuskan → sistem → bangun → haluskan → a11y → bukti → audit → fix (cap 3) → ship
See references/fe-lifecycle.md

- Build UI → design-direction* → design-foundations → tokens → (+ typography/color/surfaces/content owners as relevant) → (+ marketing if landing) → (+ shell/data/forms) → components → anti-slop-code → responsive → motion → anti-slop-design → polish → accessibility
- Test → testing (+ devtools when measuring) (test-engineer)
- Audit → anti-slop-design → polish → tokens → design-foundations (if structural layout) → responsive → motion (if animated) → marketing (if landing) → a11y → performance (+ fidelity / devtools as needed) [/design|/audit]
- Polish until good → quality-loop [/polish]: build→test→audit→fix (max 3)
- Feels off / rapihin detail → polish (one pass). Layout berantakan → design-foundations. Rapihin sampai bagus → quality-loop

* Skip judgment for tiny fixes or \"langsung saja\"
Optional: /ui · /test-ui · /design · /audit · /polish
Agents: ui-developer · test-engineer · design-reviewer
Tokens: decision tree (custom → explicit → Plasma hard-gate → score). Responsive MUST (320–1440 + full-width CTA <768). Hierarchy + Typography ship gates. Shell: theme in topbar; avatar→menu; custom selects. Landing: section stack hand-roll (not hero-only / not registry). Motion: families/patterns named; hand-roll (not registry default). Icons: MUST use Reicon in markup (or waive). WebGL/plasma → skill webgl / Plasma.init.
Before DONE: Conventions check — Tokens / Icons / States / Responsive / Hierarchy / Typography / Shell / Landing / Motion / A11y / WebGL (references/compliance-gates.md)." \
  '{priority: "IMPORTANT", message: $message}'
