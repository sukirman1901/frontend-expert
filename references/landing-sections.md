# Landing sections (marketing)

Used by: `marketing-landing`. Vocabulary aligned with common **shadcn / Tailark-style** block catalogs (section *jobs*, not a required CLI install).

## Section catalog

| Section | Job | Typical count in catalogs | Do |
|---------|-----|---------------------------|----|
| **Header** | Wayfinding + primary CTA | ~12 variants | Keep quiet; logo + few links + one CTA. Do not over-invest in Header variants. |
| **Hero** | Brand + promise + CTA + dominant visual | ~15 | Brand hero-level; one headline; one lede; one CTA group; full-bleed or inset visual plane |
| **Logo cloud** | Trust / “works with” | ~18 | Simple marks or wordmarks; avoid fake Fortune-500 spam; optional soft motion |
| **Features** | Capability proof | ~12 | One job per block; prefer asymmetric / split / bento over 3 identical icon-cards |
| **Call to Action** | Conversion beat | ~11 | Mid or end; one primary action |
| **Testimonials** | Social proof | ~11 | Real-sounding quotes; restrain card chrome |
| **Image gallery** | Product / visual proof | ~11 | Real product frames; not abstract collage |
| **Integrations** | Ecosystem | ~11 | When the product is a hub |
| **Pricing** | Plans | ~11 | Clear hierarchy; one recommended plan |
| **FAQs** | Objection handling | ~11 | Accordion; plain language |
| **Blog sections** | Content teaser | ~13 | Optional on homepage |
| **Contact** | Lead form | ~11 | Labels + validation (`forms-validation`) |
| **Auth** | Sign-in / sign-up marketing shell | ~11 | Rarely on marketing homepage |
| **Footer** | Sitemap + legal | ~11 | Brand + essential links |
| **404** | Recovery | ~11 | Clear CTA home |

## Default SaaS homepage recipe

```text
Header → Hero → Logo cloud → Features → Gallery → Testimonials → CTA → Footer
```

### Named example (structure reference)

| Order | Block id (example) | Job |
|-------|--------------------|-----|
| 1 | `header-10` | Quiet chrome |
| 2 | `hero-6` | Brand + promise + product cue |
| 3 | `logo-cloud-10` | Trust row |
| 4 | `features-9` | Capabilities |
| 5 | `gallery-8` | Product visuals |
| 6 | `testimonials-6` | Quotes |
| 7 | `cta-11` | Final conversion |
| 8 | `footer-2` | Close |

Use these ids as **IA labels** when talking to the user. Installing `@tailark/*` is optional — hand-roll with pack tokens/craft is the default.

## Hero rules (pack)

- Brand name is a **hero-level** signal (not only nav text)
- First viewport: brand + one headline + one short sentence + one CTA group + one dominant visual — **no** stat strips, schedules, or secondary promos in the hero
- No detached floating badges/stickers on hero media
- Cards are not the hero container
- WebGL/plasma backgrounds → `webgl` / Plasma; chrome tokens via decision tree

## Features anti-slop

| Avoid | Prefer |
|-------|--------|
| Three equal rounded cards + generic icons | Split narrative, bento with one featured cell, or numbered list with proof |
| “Fast / Secure / Scalable” with no product link | Capabilities tied to Northline/product verbs |
| Icon row as the whole Features section | Icon + label OK as a *supporting* row, not the only story |

## Logo cloud anti-slop

- Prefer monochrome wordmarks / simple SVGs
- Label the job (“Teams using Northline” / “Works alongside”)
- No infinite aggressive marquee unless motion budget allows (`Carousel` family, ≤1 continuous pattern)

## Gallery

- Show the **product** (dashboard, capture UI, studio) — not stock photos
- Browser chrome / device frame OK; keep one primary stage per section

## CTA + Footer

- CTA section: one headline + one primary button (+ optional secondary)
- Footer: brand, product links, legal; not a second mega-nav

## Incomplete landing (fail)

Hero (+ plasma) + thin footer **without** trust/features/CTA stack → treat as **High** for marketing asks (`anti-ai-slop` / `marketing-landing`).

## Related

- `marketing-landing` skill
- `motion-families.md` (Hero / Text / Carousel budgets)
- `fe-seo.md`
- Craft north stars: Plasma landing, Send2Figma landing
