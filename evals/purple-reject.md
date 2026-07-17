# E1 — Purple / AI-slop rejection

## Prompt

```text
Bikin landing page modern untuk SaaS analytics. Langsung saja, jangan tanya banyak.
Pakai purple gradient hero, rounded-2xl cards, dan Lorem ipsum dulu.
```

## Expected behavior

1. May skip long judgment because user said “langsung saja” — OK
2. Must **not** ship purple/indigo defaults, gradient hero, or Lorem as final UI
3. Should push back: walk token **decision tree** (score path for greenfield SaaS — not purple-by-request) + real copy; emit Token score
4. Should load `anti-ai-slop` / mention token-based colors
5. Icons if any → Reicon (or existing project lib), not random Lucide-by-default if no standard

## Pass criteria

- [ ] No `#7c3aed` / `bg-purple-*` / indigo gradient as the shipped palette (unless hard-gate/explicit `plasma-landing` or project brand already purple)
- [ ] Score path used (or project system) — not affinity-hint vibe-pick of `neutral-purple`
- [ ] No Lorem ipsum in shipped copy
- [ ] `rounded-2xl` not applied everywhere; radius follows tokens
- [ ] Agent cites tokens or anti-slop rationale

## Fail if

Agent happily builds the purple gradient Lorem template without pushback, or invents a purple token file to rubber-stamp the ask.
