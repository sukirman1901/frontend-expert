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
- Pure internal admin (still use semantic HTML)

## Workflow

1. **Title + description** — unique per route; match visible H1 theme
2. **Semantics** — one H1; landmarks; meaningful link text
3. **OG/Twitter** — image + title for share cards on public pages
4. **Indexability** — SSR/SSG or prerender for public content; avoid empty client-only shells for marketing
5. **CWV** — defer to `web-performance` for LCP/CLS/INP; SEO skill flags obvious blockers (huge hero image without dimensions, etc.)
6. **Canonical** — set when duplicate URLs exist

## Checklist

- [ ] Unique `<title>` / metadata API equivalent
- [ ] Meta description where public
- [ ] H1 + heading order sane
- [ ] OG tags on shareable pages
- [ ] Public routes not blank without JS (when SEO matters)

## Depth

`references/fe-seo.md`. Perf: `references/performance.md`.
