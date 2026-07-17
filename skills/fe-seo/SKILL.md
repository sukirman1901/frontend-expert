---
name: fe-seo
description: >-
  Technical SEO for web apps — title/meta, OG, semantics, indexable content,
  CWV overlap. Use for landing pages, marketing routes, "SEO", "meta tags",
  "Open Graph", or making app routes discoverable.
---

# FE SEO

## Overview

Ship **indexable, shareable** pages. Don’t duplicate full LCP guides — pair with `web-performance` for CWV.

## When to use

- Marketing/landing pages
- Public docs or content routes
- Adding meta/OG/Twitter cards
- SPA routes that should be crawlable

## When to skip

- Authenticated-only app chrome with `noindex`
- Pure internal admin (still use semantic HTML + one h1)

## MUST (public / shareable routes)

| Item | Rule |
|------|------|
| **Title** | Unique per route; aligns with visible H1 theme |
| **Description** | Meta description present and useful |
| **H1** | One primary heading; sequential ladder (`frontend-judgment`) |
| **OG** | `og:title`, `og:description`, `og:image` (valid URL) on shareable pages |
| **Indexability** | SSR/SSG/prerender for marketing; avoid empty client-only shells |

Private app routes: prefer `noindex` rather than fake marketing meta.

## Workflow

1. **Title + description** — unique per route; match visible H1 theme
2. **Semantics** — one H1; landmarks; meaningful link text
3. **OG/Twitter** — image + title for share cards on public pages
4. **Indexability** — SSR/SSG or prerender for public content
5. **CWV** — defer to `web-performance` / `fe-devtools` for measured LCP/CLS
6. **Canonical** — set when duplicate URLs exist

## Agent boundaries

- **May decide:** Metadata API vs static tags; `summary` vs `summary_large_image`
- **Must not:** Same title on every route; keyword-stuffed invisible blocks; claim rankings without evidence

## Checklist

- [ ] Unique `<title>` / metadata API equivalent
- [ ] Meta description where public
- [ ] H1 + heading order sane (one h1)
- [ ] OG tags on shareable pages (image not 404)
- [ ] Public routes not blank without JS (when SEO matters)
- [ ] `noindex` on private app chrome when appropriate

## Depth

`references/fe-seo.md`. Perf: `references/performance.md`. Type: `frontend-judgment` Typography ladder.
