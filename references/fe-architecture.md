# FE architecture (suite)

Used by: `fe-architecture`. Complements `references/architecture.md` (state ladder detail).

## Default layout

```text
src/
  app/ or routes/     # routing entry
  features/
    users/
      components/
      api/ or queries/
      users-page.tsx
  shared/ui/          # primitives (button, input)
  shared/lib/
```

Adjust names to the framework; keep **feature cohesion**.

## State decision tree

```text
Is it remote data?     → data-fetching / query / loader
Is it in the URL?      → searchParams / path
Is it one component?   → useState
2–3 siblings?          → lift state
Theme/auth/locale?     → context or framework session
Still tangled globally? → consider a store (rare)
```

**Agent default:** refuse Redux/Zustand for form fields and API entity caches unless the ladder was exhausted.

## Server/client boundary

- Prefer server-rendered data for SEO-critical and first paint
- Client components for interactivity only
- Don’t fetch the same entity in five client components — lift to parent/loader

## Anti-patterns

- `store/` for every form field
- Circular imports between features
- God-context with unrelated values
- Copy-pasting fetch logic instead of a shared query

## Related

- `app-shell-routing`, `data-fetching`, `ui-components`
