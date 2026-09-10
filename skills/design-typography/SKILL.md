---
name: design-typography
description: >-
  Use when choosing fonts, defining or repairing a type scale, loading webfonts,
  or fixing text wrapping, truncation, numeric alignment, mixed-direction text,
  “tipografi”, “font apa”, “teks kepotong”, or “heading berantakan”.
---

# Design Typography

## Overview

Typography is a role system verified with real content, not a fashionable font choice. Preserve project fonts first; change them only when the task requires it.

## When to use

- Font selection, type roles, scales, hierarchy, or webfont loading
- Poor wrapping, truncation, measure, line-height, or numeric jitter
- Variable fonts, OpenType, localization, language, or bidi rendering

## When to skip

- Copy meaning or tone only → `content-design`
- Heading semantics only → `accessibility`
- Palette or surface styling only

## MUST

| Rule | Detail |
|---|---|
| **Recon first** | Inspect project fonts, tokens, content roles, languages, and rendered lengths |
| **Role-based system** | Use semantic roles; do not scatter unrelated sizes and weights |
| **Content safety** | Meaningful truncated text remains reachable |
| **Language-aware** | Set language/direction boundaries and test text expansion |
| **Evidence labels** | Numeric recipes are recommendations unless a standard/project owns them |
| **Rendered proof** | Verify realistic content at supported widths and zoom |

## Workflow

1. **Inventory** — font files, fallbacks, tokens, roles, languages, and failure cases.
2. **Choose** — keep the system or propose alternatives with licensing/loading tradeoffs.
3. **Systematize** — map roles to a restrained scale, weights, leading, measure, and features.
4. **Harden** — wrapping, long IDs, truncation recovery, numerics, fallback and bidi.
5. **Verify** — rendered content, loading behavior, 200% zoom, and target breakpoints.

## Boundaries

- **May decide:** role names and closest project-token mapping.
- **Must not:** replace brand fonts from taste, infer semantics from visual size, or hide essential text permanently.

## Checklist

- [ ] Project font and role inventory completed
- [ ] Scale, measure, wrapping, truncation, and numerics checked as relevant
- [ ] Language, fallback, loading, and zoom checked
- [ ] Recommendations distinguished from standards

## Depth

Full guide: `references/design-typography.md`.
