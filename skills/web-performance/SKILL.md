---
name: web-performance
description: >-
  Optimize frontend Core Web Vitals (LCP, INP, CLS) and loading/rendering/network.
  Use when the UI feels slow, images/fonts/bundles need work, or during design
  audits that touch performance — phrases like "lemot", "optimize", "LCP", or
  "Core Web Vitals" without requiring a slash command.
---

# Web Performance

## Overview

Measure-first performance for user-facing UI. Hit Core Web Vitals targets; prefer compositor-friendly work and sensible loading.

## When to Use

- Performance regressions or budgets
- Deep `/design` audits
- Image/font/bundle optimization work

## Workflow

1. **Targets**
   - LCP ≤ 2.5s
   - INP ≤ 200ms
   - CLS ≤ 0.1

2. **Loading**
   - Preconnect critical origins; preload LCP resources
   - Self-host fonts with `font-display: swap`
   - Modern image formats (WebP/AVIF); do not lazy-load LCP image
   - Code-split routes and heavy features

3. **Rendering**
   - Avoid unnecessary re-renders
   - Virtualize long lists
   - Animate `transform` / `opacity` only when possible
   - Avoid layout thrashing

4. **Network**
   - Cache hashed static assets
   - Paginate API responses
   - Compression (gzip/brotli)

## Checklist

- [ ] CWV targets known for the change
- [ ] LCP resource prioritized
- [ ] No obvious CLS (reserved sizes for media)
- [ ] Heavy features code-split
- [ ] Motion uses compositor-friendly properties

## Depth

Full guide: `references/performance.md`.
