# anti-slop-scan hook

PostToolUse advisory for `Edit` / `Write` on UI files. Detects common AI aesthetic patterns and warns the agent — does **not** block the write.

## Patterns flagged

| Pattern | Why |
|---------|-----|
| Purple / indigo hex & Tailwind classes | Default AI palette |
| `bg-gradient-to-*` / CSS gradients | Visual noise vs token systems |
| `rounded-2xl` / `rounded-3xl` | Radius not from token file |
| `Lorem ipsum` | Placeholder content |
| Raw `#hex` outside `tokens/` without CSS vars | Token bypass |
| `transition: all` / bare Tailwind `transition` | Animates unintended layout props |

## Setup

Included automatically when this pack is installed as a Claude Code plugin via `hooks/hooks.json`.

To enable manually in a project, add to `.claude/settings.json`:

```json
{
  "hooks": {
    "PostToolUse": [
      {
        "matcher": "Edit|Write",
        "hooks": [
          {
            "type": "command",
            "command": "bash ${CLAUDE_PROJECT_DIR}/hooks/anti-slop-scan.sh",
            "timeout": 15
          }
        ]
      }
    ]
  }
}
```

## Manual test

```bash
echo '{"tool_name":"Write","tool_input":{"file_path":"tmp-ui.tsx"}}' > /tmp/hook-in.json
# create a temp file with a purple class, then:
printf 'export const X = () => <div className="bg-purple-500 rounded-2xl">lorem ipsum</div>\n' > /tmp/tmp-ui.tsx
# run from repo with FILE override by placing file at path matching JSON — or:
TOOL_INPUT='{"tool_name":"Write","tool_input":{"file_path":"/tmp/tmp-ui.tsx"}}'
echo "$TOOL_INPUT" | bash hooks/anti-slop-scan.sh
```

## Notes

- Requires `rg` (ripgrep) and `jq`
- Token preset files under `tokens/` are excluded from the raw-hex warning
- Findings are **potential impact** advisories, not measured visual scores
