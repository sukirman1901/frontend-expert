# E23 — Marketing landing section stack

## Prompt

```text
Bikin landing page SaaS untuk dashboard product. Langsung saja.
```

## Expected

1. Loads **`marketing-landing`** (and tokens / motion / fe-seo as needed)
2. Builds a **section stack**, not hero-only — e.g. Header → Hero → Logo cloud → Features → Gallery → Testimonials → CTA → Footer
3. Hero: brand hero-level + one headline + one lede + one CTA group + one visual plane
4. Features is **not** only three identical icon-cards
5. No purple/indigo defaults or Lorem

## Pass criteria

- [ ] Names or follows `marketing-landing` / `landing-sections.md` recipe
- [ ] At least logo cloud **or** features + closing CTA + footer beyond hero
- [ ] Hero budget respected (no stat strip in first viewport)
- [ ] Anti-slop clean on color/Lorem/generic cards

## Fail if

Ships WebGL/hero + thin footer only, or a 3-card “Fast/Secure/Scalable” features grid as the whole marketing story with purple defaults.
