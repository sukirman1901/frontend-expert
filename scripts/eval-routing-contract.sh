#!/usr/bin/env bash
# Static routing contract for the eval slice (E4, E27, E30–E32, E1, E22, E23).
# This is not a live behavioral run — it fails if trigger phrases drift off their owners.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
FAIL=0

ok() { echo "  OK  $1"; }
bad() { echo "  FAIL $1" >&2; FAIL=1; }

need() {
  local file="$1" phrase="$2" label="$3"
  if rg -q -- "$phrase" "$ROOT/$file"; then
    ok "$label"
  else
    bad "$label (missing '$phrase' in $file)"
  fi
}

forbid() {
  local file="$1" phrase="$2" label="$3"
  if rg -q -- "$phrase" "$ROOT/$file"; then
    bad "$label (still has '$phrase' in $file)"
  else
    ok "$label"
  fi
}

echo "== eval routing contract =="

# E4
need AGENTS.md 'rapihin \*\*detail\*\*' "E4A rapihin detail → polish"
need AGENTS.md 'sampai bagus' "E4B sampai bagus → quality-loop"
need skills/design-direction/SKILL.md 'bikin dashboard' "E4C vague new UI → design-direction"
need AGENTS.md 'Rapikan struktur' "E4D struktur → design-foundations"
forbid skills/quality-loop/SKILL.md 'User asks to polish, rapihin,' "E4 quality-loop does not steal bare rapihin"

# E27
need skills/content-design/SKILL.md 'tulisan AI' "E27 description trigger tulisan AI"
need AGENTS.md 'tulisan AI' "E27 rapihin copy ≠ polish"

# E30
need AGENTS.md 'Rapikan kode' "E30 rapikan kode → anti-slop-code"
need AGENTS.md 'error handling generik' "E30 generic errors stay on anti-slop-code"

# E31
need AGENTS.md 'bandingkan arah' "E31 bandingkan → prototype"

# E32
need AGENTS.md 'frame by frame' "E32 frame-by-frame → motion-inspection"

# E1 / E22 / E23
need skills/anti-slop-design/SKILL.md 'purple' "E1 anti-slop purple"
need skills/app-shell/SKILL.md 'avatar' "E22 shell avatar"
need skills/marketing/SKILL.md 'landing page' "E23 marketing landing"

if [ "$FAIL" -ne 0 ]; then
  echo "eval-routing-contract: FAILED" >&2
  exit 1
fi
echo "eval-routing-contract: OK"
