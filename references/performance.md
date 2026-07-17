# Performance Reference

Core Web Vitals targets, optimization patterns, and anti-patterns.

## Core Web Vitals

### LCP (Largest Contentful Paint)

**Target:** ≤ 2.5 seconds

**What it measures:** Time for largest visible content element to render

**Common LCP elements:**
- Hero images
- Heading text blocks
- Video posters

**Optimization:**
- Preload LCP resources: `<link rel="preload" as="image" href="hero.webp">`
- Use `fetchpriority="high"` on LCP image
- Don't lazy-load LCP image
- Self-host fonts with `font-display: swap`
- Server-side render or statically generate

**Anti-patterns:**
- Lazy-loading hero images
- Large unoptimized images
- Slow server responses
- Render-blocking resources

### INP (Interaction to Next Paint)

**Target:** ≤ 200 milliseconds

**What it measures:** Time from user interaction to visual response

**Common interactions:**
- Button clicks
- Link taps
- Form submissions
- Keyboard input

**Optimization:**
- Break long tasks (> 50ms)
- Use `scheduler.yield()` in long loops
- Debounce event handlers
- Use `requestIdleCallback` for non-urgent work
- Avoid synchronous heavy work

**Anti-patterns:**
- Long tasks blocking main thread
- Synchronous XHR in event handlers
- Excessive DOM manipulation
- Heavy computation in render

### CLS (Cumulative Layout Shift)

**Target:** ≤ 0.1

**What it measures:** Visual stability — unexpected layout shifts

**Common causes:**
- Images without dimensions
- Ads/embeds without placeholders
- Dynamic content injection
- Web fonts causing FOIT/FOUT

**Optimization:**
- Always set `width` and `height` on images
- Use `aspect-ratio` CSS property
- Reserve space for ads/embeds
- Use `font-display: optional` for non-critical fonts
- Avoid injecting content above existing content

**Anti-patterns:**
- Images loading without dimensions
- Late-loading ads
- Dynamic banners/popups
- Web fonts causing text reflow

## Loading Optimization

### Resource Hints

```html
<!-- Preconnect to critical origins -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://cdn.example.com" crossorigin>

<!-- DNS prefetch for less critical origins -->
<link rel="dns-prefetch" href="https://analytics.example.com">

<!-- Preload LCP resources -->
<link rel="preload" as="image" href="/hero.webp" type="image/webp">
<link rel="preload" as="font" href="/font.woff2" type="font/woff2" crossorigin>
```

### Font Optimization

```css
/* Self-host fonts */
@font-face {
  font-family: 'CustomFont';
  src: url('/fonts/custom.woff2') format('woff2');
  font-display: swap; /* Show fallback, swap when loaded */
  unicode-range: U+0000-00FF; /* Subset to needed characters */
}
```

### Image Optimization

```html
<!-- Modern formats with srcset -->
<picture>
  <source srcset="hero.avif" type="image/avif">
  <source srcset="hero.webp" type="image/webp">
  <img 
    src="hero.jpg" 
    alt="Description"
    width="1200" 
    height="600"
    loading="lazy"
    decoding="async"
  >
</picture>

<!-- LCP image: don't lazy-load, use fetchpriority -->
<img 
  src="hero.webp" 
  alt="Description"
  width="1200" 
  height="600"
  fetchpriority="high"
>
```

### Code Splitting

```tsx
// Route-based splitting
const Dashboard = lazy(() => import('./pages/Dashboard'))
const Settings = lazy(() => import('./pages/Settings'))

// Component-based splitting
const HeavyChart = lazy(() => import('./components/HeavyChart'))

// Usage
<Suspense fallback={<Skeleton />}>
  <Dashboard />
</Suspense>
```

## Rendering Optimization

### React Performance

```tsx
// Avoid unnecessary re-renders with React.memo
const ExpensiveComponent = React.memo(({ data }) => {
  return <div>{/* complex rendering */}</div>
})

// Use useMemo for expensive computations
const sortedItems = useMemo(() => {
  return items.sort((a, b) => a.value - b.value)
}, [items])

// Use useCallback for stable function references
const handleClick = useCallback(() => {
  doSomething(id)
}, [id])

// Avoid inline objects/functions in JSX
// Bad
<Component style={{ color: 'red' }} onClick={() => doSomething()} />

// Good
const style = useMemo(() => ({ color: 'red' }), [])
const handleClick = useCallback(() => doSomething(), [])
<Component style={style} onClick={handleClick} />
```

### Virtualization

```tsx
// For long lists, use virtualization
import { useVirtualizer } from '@tanstack/react-virtual'

function VirtualList({ items }) {
  const parentRef = useRef(null)
  
  const virtualizer = useVirtualizer({
    count: items.length,
    getScrollElement: () => parentRef.current,
    estimateSize: () => 50,
  })

  return (
    <div ref={parentRef} style={{ height: '400px', overflow: 'auto' }}>
      <div style={{ height: virtualizer.getTotalSize() }}>
        {virtualizer.getVirtualItems().map(virtualRow => (
          <div key={virtualRow.key} style={{
            position: 'absolute',
            top: virtualRow.start,
            height: virtualRow.size,
          }}>
            {items[virtualRow.index].name}
          </div>
        ))}
      </div>
    </div>
  )
}
```

### Animation Performance

```css
/* Good: Compositor-only animations */
.animated {
  transition: transform 0.3s ease, opacity 0.3s ease;
}

/* Bad: Layout-triggering animations */
.animated {
  transition: width 0.3s ease, height 0.3s ease, margin 0.3s ease;
}
```

```tsx
// Good: Use transform for animations
<div style={{ transform: `translateX(${offset}px)` }} />

// Bad: Use left/top for animations
<div style={{ left: `${offset}px` }} />
```

### Avoid Layout Thrashing

```tsx
// Bad: Read then write in loop
elements.forEach(el => {
  const height = el.offsetHeight // Read
  el.style.height = `${height + 10}px` // Write
})

// Good: Batch reads, then batch writes
const heights = elements.map(el => el.offsetHeight) // All reads
elements.forEach((el, i) => {
  el.style.height = `${heights[i] + 10}px` // All writes
})
```

## Network Optimization

### Caching

```
# Static assets with content hashing
Cache-Control: public, max-age=31536000, immutable

# HTML documents
Cache-Control: no-cache

# API responses
Cache-Control: private, no-store
```

### Compression

```nginx
# Nginx configuration
gzip on;
gzip_types text/plain text/css application/json application/javascript text/xml;
gzip_min_length 256;

# Brotli (better compression)
brotli on;
brotli_types text/plain text/css application/json application/javascript;
```

### API Optimization

```tsx
// Bad: Sequential requests
const user = await fetchUser(id)
const posts = await fetchPosts(id)
const comments = await fetchComments(id)

// Good: Parallel requests
const [user, posts, comments] = await Promise.all([
  fetchUser(id),
  fetchPosts(id),
  fetchComments(id),
])

// Good: Pagination
const response = await fetch('/api/posts?page=1&limit=20')

// Good: Field selection
const response = await fetch('/api/posts?fields=id,title,excerpt')
```

## Performance Budget

| Resource | Budget |
|----------|--------|
| Total JavaScript | < 200KB gzipped |
| Total CSS | < 50KB gzipped |
| Total Images | < 500KB |
| Total Fonts | < 100KB |
| First Contentful Paint | < 1.8s |
| Largest Contentful Paint | < 2.5s |
| Total Blocking Time | < 200ms |
| Cumulative Layout Shift | < 0.1 |

## Testing Performance

```bash
# Lighthouse CLI
npx lighthouse https://example.com --output json

# Web Vitals library
import { onLCP, onINP, onCLS } from 'web-vitals'

onLCP(console.log)
onINP(console.log)
onCLS(console.log)

# Chrome DevTools
# 1. Open DevTools → Performance tab
# 2. Click Record
# 3. Interact with page
# 4. Stop recording
# 5. Analyze flame chart
```
