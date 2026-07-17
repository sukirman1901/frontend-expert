# FE SEO (technical)

Used by: `fe-seo`.

## Per-route essentials

| Element | Rule |
|---------|------|
| Title | Unique, ≤~60 chars practical |
| Meta description | Unique, useful; not keyword stuffing |
| H1 | One primary; aligns with title intent |
| Canonical | When parameters create duplicates |
| robots | `noindex` for private/app-only |

## Social

```html
<meta property="og:title" content="…" />
<meta property="og:description" content="…" />
<meta property="og:image" content="https://…/og.png" />
<meta name="twitter:card" content="summary_large_image" />
```

Prefer framework Metadata APIs (Next.js `metadata`, etc.) over hand-edited tags in every page when available.

## SPA caution

Client-only shells with no SSR/prerender rank poorly for marketing URLs. Use SSR/SSG or a prerender step for public pages.

## Overlap with performance

- LCP image: dimensions + priority hints → `web-performance`
- This skill: whether the **content and meta** exist for crawlers/sharers

## Anti-patterns

- Same title on every route
- OG image 404
- Click-only content that never appears in HTML for public pages
- Stuffing invisible keyword blocks

## Related

- `web-performance`, `accessibility`, `app-shell-routing`
