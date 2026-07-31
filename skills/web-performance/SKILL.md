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
- User reports "slow", "lemot", "loading lama"

## Targets

| Metric | Target | Measures |
|--------|--------|----------|
| **LCP** | ≤ 2.5s | Largest visible content element render time |
| **INP** | ≤ 200ms | Interaction to visual response time |
| **CLS** | ≤ 0.1 | Unexpected layout shift score |

## Decision trees

### Image format decision

```
Is it a photo or complex image?
  YES → Is AVIF supported by your target browsers?
         YES → AVIF (smallest, best quality)
         NO  → WebP (wide support, good compression)
  NO  → Is it an icon or simple graphic?
         YES → SVG (scalable, tiny) or Reicon
         NO  → Is transparency needed?
               YES → WebP or PNG (WebP preferred)
               NO  → WebP or JPEG (WebP preferred)
```

### Font loading strategy

```
Is the font critical for LCP text?
  YES → Preload + font-display: swap
        <link rel="preload" as="font" href="/font.woff2" type="font/woff2" crossorigin>
  NO  → Is it a secondary/accent font?
        YES → font-display: swap (load async)
        NO  → Is it used only on specific pages?
              YES → Lazy load via JS / @font-face on that page only
              NO  → font-display: optional (may skip if slow)
```

### LCP resource priority

```
What is the LCP element?
  IMAGE → fetchpriority="high" + preload + NO lazy-load + width/height set
  TEXT  → Preload the font + inline critical CSS for that heading
  VIDEO → Preload poster image + fetchpriority="high" on poster
  
Is there a render-blocking script above LCP?
  YES → Move to bottom / add defer / async
  NO  → Good
```

## Workflow

### 1. Loading

- Preconnect critical origins
- Preload LCP resources (`<link rel="preload">`)
- `fetchpriority="high"` on LCP image — **never lazy-load it**
- Self-host fonts with `font-display: swap` and `woff2` format
- Modern image formats (WebP/AVIF) with `<picture>` fallback
- Code-split routes and heavy features (`lazy()` + `Suspense`)

**Recipe — optimal LCP image:**
```html
<!-- Preload in <head> -->
<link rel="preload" as="image" href="/hero.webp" type="image/webp">

<!-- In body — no lazy, explicit dimensions -->
<img 
  src="/hero.webp" 
  alt="Hero description"
  width="1200" height="600"
  fetchpriority="high"
>
```

### 2. Rendering

- Avoid unnecessary re-renders (memoize when profiling shows waste)
- Virtualize long lists (>100 items) — `@tanstack/react-virtual` or equivalent
- Animate only `transform` / `opacity` / `filter` for compositor-friendly motion
- Avoid layout thrashing (batch DOM reads before writes)
- Use `content-visibility: auto` for off-screen sections

**Recipe — avoid layout thrashing:**
```js
// BAD: interleaved read-write
elements.forEach(el => {
  const h = el.offsetHeight;    // read → forces layout
  el.style.height = `${h}px`;   // write → invalidates layout
});

// GOOD: batch reads, then writes
const heights = elements.map(el => el.offsetHeight); // all reads
elements.forEach((el, i) => {
  el.style.height = `${heights[i]}px`; // all writes
});
```

### 3. CLS prevention

| Cause | Fix |
|-------|-----|
| Images without dimensions | Always set `width` + `height` or `aspect-ratio` |
| Dynamic content above fold | Reserve space with min-height or skeleton |
| Web fonts FOUT | `font-display: optional` for non-critical fonts |
| Late-loading ads/embeds | Fixed-size container placeholder |
| Injected banners/bars | Reserve space or use transform animation |

### 4. INP optimization

| Symptom | Fix |
|---------|-----|
| Click feels slow (>200ms) | Break long tasks — `scheduler.yield()` or `requestIdleCallback` |
| Typing lag in inputs | Debounce heavy handlers (300ms); keep onChange lightweight |
| Scroll jank | Use passive event listeners; avoid heavy scroll handlers |
| Heavy computation on interaction | Move to Web Worker or defer with `requestIdleCallback` |

**Recipe — break long task:**
```js
async function processItems(items) {
  for (const item of items) {
    processItem(item);
    // Yield to let browser handle pending interactions
    if (navigator.scheduling?.isInputPending?.()) {
      await scheduler.yield();
    }
  }
}
```

### 5. Network

- Cache hashed static assets (`max-age=31536000, immutable`)
- HTML: `no-cache` (always revalidate)
- API: appropriate cache or `no-store` for private data
- Compression: brotli preferred > gzip
- Paginate API responses; field selection when available

## Performance budget

| Resource | Budget |
|----------|--------|
| Total JavaScript | < 200KB gzipped |
| Total CSS | < 50KB gzipped |
| Total Images (above fold) | < 500KB |
| Total Fonts | < 100KB |
| First Contentful Paint | < 1.8s |
| Largest Contentful Paint | < 2.5s |
| Total Blocking Time | < 200ms |
| Cumulative Layout Shift | < 0.1 |

## Quick audit method

1. **Lighthouse** — run in Incognito, mobile throttling → check LCP, INP, CLS scores
2. **Performance panel** — record interaction, look for long tasks (>50ms red blocks)
3. **Network panel** — check waterfall: is LCP resource the first to load?
4. **Coverage tab** — how much CSS/JS is unused on this page?
5. **web-vitals library** — add to app for real-user monitoring

## Checklist

- [ ] CWV targets known for the change
- [ ] LCP resource identified + prioritized (`fetchpriority="high"`, preload)
- [ ] LCP image NOT lazy-loaded
- [ ] Image format decision tree followed (WebP/AVIF)
- [ ] Font loading strategy chosen (preload critical, swap/optional others)
- [ ] No obvious CLS (reserved sizes for media, skeletons for dynamic content)
- [ ] Heavy features code-split
- [ ] INP: no long tasks blocking interactions
- [ ] Motion uses compositor-friendly properties (`transform`/`opacity`)
- [ ] Performance budget within limits

## Depth

Full guide: `references/performance.md`.
