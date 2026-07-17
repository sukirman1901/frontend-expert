---
name: marketing-landing
description: >-
  Marketing / SaaS landing page structure — section stack (hero, logo cloud,
  features, gallery, testimonials, CTA, footer), not a lone hero. Use when
  building or auditing landing pages, marketing sites, "landing page",
  "homepage marketing", Tailark/shadcn block-style pages, or when the page
  feels incomplete after only a hero. Pair with motion, fe-seo, anti-ai-slop.
---

# Marketing Landing

## Overview

A landing page is a **stack of section jobs**, not a WebGL hero with a footer. Use the section vocabulary in `references/landing-sections.md` (Tailark / shadcn-blocks style).

## When to use

- New marketing homepage / landing / launch page
- User names section types (hero, logo cloud, features, testimonials, CTA…)
- Audit says “incomplete landing” / hero-only / AI slop marketing

## When to skip

- App shell / dashboard chrome → `app-shell-routing`
- Tiny copy tweak on an existing section → `ui-feel`
- Pure SEO meta without layout → `fe-seo`

## Canonical stack (default SaaS)

Build in this order unless the user specifies otherwise:

```text
Header (simple) → Hero → Logo cloud → Features → Gallery (or product) →
Testimonials → CTA → Footer
```

Example recipe (Tailark-style ids — structure, not a required install):

`header-10` · `hero-6` · `logo-cloud-10` · `features-9` · `gallery-8` · `testimonials-6` · `cta-11` · `footer-2`

Ignore obsessing over Header *variants* — keep header quiet; invest in Hero → Footer jobs.

## MUST

| Rule | Detail |
|------|--------|
| **Section jobs** | Each section has one purpose, one headline, one short support line |
| **Hero budget** | Brand (hero-level) + one headline + one lede + one CTA group + one dominant visual plane |
| **No hero-only page** | At least Logo cloud **or** Features + CTA + Footer beyond the hero |
| **Proof order** | Trust (logos) before deep features when possible |
| **Anti-slop** | No purple defaults, no 3 identical icon-cards as the whole Features story, no Lorem, no equal-weight CTA row in hero |
| **Motion** | ≤2 families from `motion-families.md`; hand-roll; honor reduced-motion |
| **SEO** | Unique title/description/OG via `fe-seo` |

## Workflow

1. Confirm surface = **marketing landing** (not dashboard)
2. Pick a **recipe** from `references/landing-sections.md` (or user-named blocks)
3. Tokens via decision tree (`design-tokens`) — landing surface signal OK
4. Implement sections in order; Reicon for icons (`ui-components`)
5. Responsive + full-width primary CTA <768 (`responsive-ui`)
6. Light marketing motion (`motion`) — not decorative spam
7. Scan `anti-ai-slop` + Conventions check

## Checklist

- [ ] Stack matches a known recipe (not hero + footer only)
- [ ] Hero brand is hero-level; one primary CTA
- [ ] Logo cloud / features / proof present when SaaS
- [ ] Gallery or product visual is real product context
- [ ] Closing CTA section before footer
- [ ] Footer: brand + essential links
- [ ] No purple/Lorem/generic 3-card feature grid as the only Features pattern

## Depth

`references/landing-sections.md`  
Motion: `motion` + `motion-families.md`  
SEO: `fe-seo`  
Craft refs: Plasma / Send2Figma-quality heroes — atmosphere without template slop
