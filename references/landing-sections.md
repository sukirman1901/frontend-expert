# Landing sections (marketing)

Used by: `marketing-landing`. Section **jobs** and recipes for marketing pages. Implement by hand with pack tokens/craft — never install a third-party block registry.

## Section jobs

| Section | Job |
|---------|-----|
| **Header** | Quiet wayfinding + one primary CTA |
| **Hero** | Brand (hero-level) + promise + CTA + one dominant visual |
| **Logo cloud** | Trust / “works with” |
| **Features** | Capability proof (not three identical icon-cards) |
| **Gallery** | Real product visuals |
| **Testimonials** | Social proof |
| **CTA** | Conversion beat (mid or end) |
| **Footer** | Brand + essential links |

Optional when the product needs them: **Integrations**, **Pricing**, **FAQs**, **Contact**, **Blog teaser**, **Auth shell**, **404**.

## Default SaaS homepage recipe

```text
Header → Hero → Logo cloud → Features → Gallery → Testimonials → CTA → Footer
```

Example labels (IA only — not packages):

`header` · `hero` · `logo-cloud` · `features` · `gallery` · `testimonials` · `cta` · `footer`

If the user names a denser recipe (e.g. with pricing/FAQ), keep **one job per section** and the same anti-slop rules.

## Hero rules

- Brand name is a **hero-level** signal (not only nav text)
- First viewport: brand + one headline + one short sentence + one CTA group + one dominant visual — **no** stat strips or secondary promos in the hero
- No detached floating badges on hero media; cards are not the hero container
- WebGL/plasma → `webgl` / Plasma; chrome tokens via decision tree

## Features anti-slop

| Avoid | Prefer |
|-------|--------|
| Three equal rounded cards + generic icons | Split / asymmetric / numbered list tied to the product |
| “Fast / Secure / Scalable” with no product link | Capabilities with concrete verbs |

## Logo cloud anti-slop

- Monochrome wordmarks / simple marks
- Label the job (“Teams using …” / “Works alongside”)
- No aggressive infinite marquee unless motion budget allows

## Incomplete landing (fail)

Hero (+ plasma) + thin footer **without** trust/features/CTA stack → **High** for marketing asks.

## Related

- `marketing-landing` skill
- `motion-families.md` · `fe-seo.md`
- Craft north stars: Plasma landing, Send2Figma landing
