---
name: engineering-vocabulary
description: >-
  Name a frontend engineering concept from a loose description. Reverse-lookup
  for FE technical terms — user describes a pattern informally ("supaya gak
  fetch ulang", "render cuma yang keliatan"), skill returns the proper name +
  brief definition. Use when the user uses informal language for a technical
  concept, or when you need the correct term to pick the right implementation.
---

# Engineering Vocabulary

## Overview

Bridge the gap between **casual engineering descriptions** and **precise technical terms**. When a user describes a frontend pattern loosely, look it up here to pick the right implementation approach.

## When to use

- User describes a pattern informally ("yang nge-cache itu", "biar gak nge-lag")
- You need the precise term to search docs or pick the right library
- Communicating architecture decisions clearly

## When to skip

- User already uses the correct term
- Non-frontend (backend, DevOps, database) concepts

## Lookup table

### State Management

| Description (loose) | Term | Definition |
|---------------------|------|------------|
| Share data without passing through every component | **Context / Provider pattern** | React Context or equivalent for cross-tree state |
| Data cached so it doesn't fetch again | **SWR / Stale-while-revalidate** | Return cached data, revalidate in background |
| Store that any component can read | **Global store (Zustand/Redux)** | Centralized client state container |
| State in the URL (filters, tabs) | **URL state / Search params** | Shareable, bookmarkable state via URL |
| Pass data down without prop chains | **State hoisting / Lifting state** | Move state to nearest common ancestor |
| Optimistic update before server confirms | **Optimistic UI / Optimistic mutation** | Show expected result immediately, rollback on error |
| Undo/redo support | **Command pattern / History stack** | Stack of reversible actions |
| Form state that tracks dirty/touched | **Form state management** | Libraries like React Hook Form, Formik |
| Derived value computed from other state | **Computed / Derived state / Selector** | Value calculated from source state, memoized |

### Data Fetching & Async

| Description (loose) | Term | Definition |
|---------------------|------|------------|
| Loading skeleton before data | **Skeleton screen / Placeholder UI** | Shimmer placeholders mimicking final layout |
| Retry on failure | **Retry with backoff** | Re-attempt failed requests with increasing delay |
| Cancel request when leaving page | **Abort controller / Request cancellation** | `AbortController` signal to cancel in-flight fetch |
| Load more as you scroll | **Infinite scroll / Cursor pagination** | Fetch next page when nearing scroll bottom |
| Fetch once, use everywhere | **Query cache / React Query** | Centralized async state with cache + revalidation |
| Pre-fetch data before user navigates | **Prefetching / Preloading data** | Anticipate next route, start fetching early |
| Debounce search input | **Debounced input** | Delay execution until user stops typing (~300ms) |
| Show stale data while loading new | **Stale-while-revalidate (SWR)** | Display cached result, refresh in background |
| Parallel requests instead of sequential | **Promise.all / Parallel fetching** | Fire independent requests simultaneously |
| Server sends updates without polling | **WebSocket / Server-Sent Events** | Real-time push from server to client |

### Rendering & Performance

| Description (loose) | Term | Definition |
|---------------------|------|------------|
| Render only visible list items | **Virtualization / Windowing** | Render only viewport-visible items (react-virtual, etc.) |
| Component doesn't re-render unnecessarily | **Memoization (React.memo/useMemo)** | Skip re-render when props/deps unchanged |
| Load component only when needed | **Lazy loading / Code splitting** | Dynamic `import()` + `Suspense` for deferred loading |
| Render on the server first | **SSR (Server-Side Rendering)** | Generate HTML on server, hydrate on client |
| Static HTML at build time | **SSG (Static Site Generation)** | Pre-render pages at build time |
| Mix of server and client components | **Islands architecture / Partial hydration** | Static shell + interactive client islands |
| Avoid layout thrashing | **Layout batching / Read-write separation** | Batch DOM reads before writes |
| Animate without jank | **Compositor-friendly animation** | Use only `transform`/`opacity` for smooth 60fps |
| Heavy computation off main thread | **Web Worker** | Run CPU-intensive work in background thread |
| Throttle scroll/resize handlers | **Throttling** | Limit handler execution to N times per second |

### Component Architecture

| Description (loose) | Term | Definition |
|---------------------|------|------------|
| Component that renders its children | **Compound component** | Parent + children share implicit state (Tabs + Tab) |
| Component that accepts a render function | **Render props** | Pass rendering logic as a function prop |
| Wrap component to add behavior | **HOC (Higher-Order Component)** | Function that returns an enhanced component |
| Reusable logic extracted from component | **Custom hook** | `useXxx()` function encapsulating stateful logic |
| Component that just displays, no logic | **Presentational component / Dumb component** | Pure UI, receives all data via props |
| Component that fetches and manages state | **Container component / Smart component** | Handles data, passes to presentational children |
| Slot where parent injects content | **Children / Slots / Composition** | `props.children` or named slots for flexible layouts |
| Component that handles its own errors | **Error boundary** | Catches render errors, shows fallback UI |
| Forwarding ref to inner element | **forwardRef** | Expose inner DOM node to parent via ref |
| Polymorphic "render as" different element | **Polymorphic component / `as` prop** | Component that can render as different HTML elements |

### CSS & Styling

| Description (loose) | Term | Definition |
|---------------------|------|------------|
| Styles scoped to one component | **CSS Modules / Scoped styles** | Class names hashed to prevent collision |
| CSS variables for theming | **Design tokens / CSS custom properties** | `--color-primary` etc. in `:root` for systematic theming |
| Responsive without media queries | **Container queries** | Style based on parent size, not viewport |
| Apply styles based on parent state | **`:has()` selector** | Parent selector — style parent based on child state |
| Dark/light mode toggle | **Color scheme / Theme switching** | `prefers-color-scheme` + manual toggle |
| Utility classes like Tailwind | **Utility-first CSS** | Single-purpose classes composed in markup |
| CSS-in-JS at build time | **Zero-runtime CSS-in-JS** | Styles extracted at build (Vanilla Extract, Panda) |
| Smooth number transitions | **`tabular-nums` / CSS counter animation** | Fixed-width numerals for stable layout |
| Balanced heading line breaks | **`text-wrap: balance`** | Browser-native even line distribution |

### Architecture & Patterns

| Description (loose) | Term | Definition |
|---------------------|------|------------|
| Folder per feature, not per type | **Feature-based architecture** | `features/auth/`, not `components/` + `hooks/` + `utils/` |
| One source of truth for routes | **Centralized routing** | Route config in one place (React Router, Next.js pages) |
| Shared UI library across features | **UI primitives / Design system** | Reusable base components (Button, Input, Card) |
| API calls in one place | **API layer / Service layer** | Centralized API functions, not fetch() in components |
| Types shared between FE and BE | **Shared types / Contract-first** | TypeScript interfaces shared or generated from schema |
| Feature flags | **Feature toggle / Remote config** | Enable/disable features without deploy |
| Event-driven communication | **Event bus / Pub-sub** | Loosely coupled component communication |
| Guard routes based on auth | **Route guard / Protected route** | Redirect unauthenticated users |
| Micro frontend | **Module federation / Micro-frontend** | Independent deployable frontend modules |
| Monorepo with shared packages | **Monorepo (Turborepo/Nx)** | Multiple apps/packages in one repository |

### Testing

| Description (loose) | Term | Definition |
|---------------------|------|------------|
| Test one component in isolation | **Unit test / Component test** | Render + assert on single component |
| Test user flows end-to-end | **E2E test (Playwright/Cypress)** | Simulate real user interaction in browser |
| Test visual appearance | **Visual regression / Snapshot test** | Compare screenshots against baseline |
| Test accessibility automatically | **axe-core / a11y audit** | Automated WCAG violation detection |
| Mock API responses | **MSW (Mock Service Worker)** | Intercept network requests with mock responses |
| Test from user perspective | **Testing Library philosophy** | Query by role/label, not implementation details |

## Workflow

1. **Listen** for informal engineering descriptions
2. **Match** against the lookup table above
3. **Return** the proper term + brief definition
4. **Implement** using the named pattern/library

## Checklist

- [ ] Loose description identified
- [ ] Correct engineering term applied
- [ ] Right library/approach chosen based on the pattern
- [ ] Implementation follows established conventions for that pattern

## Depth

Cross-reference with:
- State architecture: `references/architecture.md`
- FE architecture: `fe-architecture` skill + `references/fe-architecture.md`
- Data patterns: `data-fetching` skill + `references/data-fetching.md`
- Performance: `web-performance` skill + `references/performance.md`
- Testing: `frontend-testing` skill + `references/testing.md`
