---
name: frontend-expert
description: Best practices, design patterns, modern UI/UX principles, CSS architecture, dynamic state management, responsive design, accessibility, and print/PDF layout for frontend web applications.
---

# Frontend Expert Skill

This skill provides comprehensive guidelines and best practices for creating modern, aesthetic, responsive, accessible, and high-performance frontend web applications.

## 1. Design & Aesthetics
- **Color Systems:** Use curated CSS custom properties (HSL or HEX) for theme tokens. Maintain sufficient contrast (WCAG AA standard: 4.5:1 for normal text).
- **Typography:** Import clean, modern fonts (e.g., Inter, Outfit, Segoe UI, system fallbacks) with a clear type scale and hierarchy.
- **Glassmorphism & Depth:** Combine subtle borders (`1px solid rgba(...)`), soft backdrop filters (`backdrop-filter: blur(10px)`), and multi-layered box shadows (`0 8px 32px rgba(...)`).
- **Micro-Interactions:** Add subtle transition effects (`transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1)`) on hover, focus, and active states.

## 2. Modern CSS Layouts
- **CSS Grid:** Ideal for 2D card grids, dashboard layouts, and header/content/sidebar split screens.
- **Flexbox:** Ideal for 1D alignments, button groups, badge lists, and form rows.
- **Responsive Web Design:** Use mobile-first or desktop-first media queries (`@media (min-width: ...)` / `@media (max-width: ...)`).
- **CSS Variables:** Define tokens in `:root` for colors, radiuses, shadows, font-sizes, and spacing.

## 3. Print & PDF Layout (`@media print`)
When building printable web documents (Invoices, Receipts, Reports, Certificates):
- **Page Setup:** Specify exact print page size and margin (`@page { size: A4 portrait; margin: 10mm; }`).
- **Color Preservation:** Force exact color rendering (`-webkit-print-color-adjust: exact; print-color-adjust: exact;`).
- **Hiding UI Elements:** Wrap non-printable UI elements (sidebars, toolbars, buttons, inputs) in screen-only containers or hide them with `@media print { .no-print { display: none !important; } }`.
- **Page Break Control:** Prevent awkward splitting of cards, tables, and total sections using `page-break-inside: avoid;` or `break-inside: avoid;`.

## 4. Interactive Forms & State Management
- **Controlled Inputs:** Bind input events (`input`, `change`) to state models to enable live previews.
- **Dynamic Tables:** Support adding, removing, and re-ordering rows (e.g. invoice line items).
- **Calculated Fields:** Automatically derive subtotal, tax/PPN, discounts, and total values in real-time.
- **User Feedback:** Clear validation styles (`:focus-visible`, valid/invalid state styling) and toast notifications for user actions.

## 5. Accessibility (A11y) & Semantic HTML
- Use proper semantic tags (`<header>`, `<main>`, `<section>`, `<article>`, `<nav>`, `<footer>`, `<aside>`).
- Ensure interactive elements are keyboard reachable with visible focus rings.
- Label all inputs using `<label for="...">` or `aria-label`.
