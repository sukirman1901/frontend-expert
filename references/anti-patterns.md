# AI Aesthetic Anti-Patterns

AI-generated UI has recognizable patterns that signal low quality. This document lists these patterns and how to fix them.

## Color Anti-Patterns

### Purple/Indigo Everything

**Problem:** AI models default to visually "safe" palettes (purple, indigo, violet) making every app look identical.

**Detection:**
- Check for hex values like `#7c3aed`, `#6366f1`, `#8b5cf6`
- Check for HSL values with hue around 260-280
- Check for class names like `text-purple-*`, `bg-indigo-*`

**Fix:** Use colors from the token file. If no token file exists, create one with curated colors.

### Excessive Gradients

**Problem:** Gradients add visual noise and clash with most design systems.

**Detection:**
- Check for `linear-gradient`, `radial-gradient` in CSS
- Check for `bg-gradient-to-*` Tailwind classes
- Check for gradient backgrounds on major sections

**Fix:** Use flat colors from the token file. If gradients are needed, use subtle variations from the same color family.

### High Contrast Without Purpose

**Problem:** Using extreme contrast (black/white) without design justification.

**Detection:**
- Check for `#000000` or `#ffffff` as primary colors
- Check for `text-black`, `bg-white` without token reference

**Fix:** Use semantic tokens: `hsl(var(--foreground))`, `hsl(var(--background))`

## Spacing Anti-Patterns

### Arbitrary Pixel Values

**Problem:** Using values not on the spacing scale (13px, 2.3rem, etc.)

**Detection:**
- Check for pixel values not divisible by 4
- Check for rem values not on 0.25rem increments
- Check for inline styles with arbitrary values

**Fix:** Follow the spacing scale: `0.25rem` increments (4px, 8px, 12px, 16px, etc.)

### Oversized Padding

**Problem:** Equal generous padding everywhere destroys visual hierarchy.

**Detection:**
- Check for `p-8`, `p-10`, `p-12` on every element
- Check for consistent large padding regardless of element importance
- Check for padding that wastes screen space

**Fix:** Use varying padding based on element importance:
- Primary content: `p-6` to `p-8`
- Secondary content: `p-4` to `p-5`
- Tertiary content: `p-3` to `p-4`
- Inline elements: `p-2` to `p-3`

### No Spacing Hierarchy

**Problem:** Same spacing between unrelated elements.

**Detection:**
- Check for `gap-4` or `space-y-4` everywhere
- Check for consistent spacing between different element types

**Fix:** Create spacing hierarchy:
- Related elements: smaller gap (`gap-2`, `gap-3`)
- Section boundaries: larger gap (`gap-6`, `gap-8`)
- Page sections: largest gap (`gap-8`, `gap-10`)

## Typography Anti-Patterns

### Skipping Heading Levels

**Problem:** Using h3 after h1, or using heading styles for non-heading content.

**Detection:**
- Check for `<h1>` followed by `<h3>` (missing h2)
- Check for heading classes on `<div>`, `<span>`, `<p>`
- Check for multiple `<h1>` elements on one page

**Fix:** Follow the type hierarchy:
- h1: Page title (one per page)
- h2: Section title
- h3: Subsection title
- body: Default text
- small: Secondary/helper text

### Inconsistent Font Usage

**Problem:** Using multiple font families without design justification.

**Detection:**
- Check for multiple `font-family` declarations
- Check for font families not in the token file
- Check for mixing serif and sans-serif without purpose

**Fix:** Use the font family from the token file. Limit to 1-2 font families maximum.

### Poor Readability

**Problem:** Text that's hard to read due to size, color, or spacing.

**Detection:**
- Check for font sizes below 14px for body text
- Check for low contrast text (below 4.5:1 ratio)
- Check for tight line-height (below 1.5)

**Fix:**
- Body text: 16px minimum
- Contrast: 4.5:1 for normal text, 3:1 for large text
- Line height: 1.5 for body text, 1.2 for headings

## Layout Anti-Patterns

### Generic Hero Sections

**Problem:** Template-driven layouts with no connection to actual content.

**Detection:**
- Check for "Welcome to..." or "Start building..." headlines
- Check for centered content with large padding
- Check for generic call-to-action buttons

**Fix:** Build content-first layouts:
- Headline should describe the actual value
- Content should be specific to the use case
- CTAs should be relevant to the user's goal

### Stock Card Grids

**Problem:** Uniform grids that ignore information priority and scanning patterns.

**Detection:**
- Check for `grid-cols-3` or `grid-cols-4` with identical cards
- Check for cards with same height regardless of content
- Check for no visual hierarchy between cards

**Fix:** Build purpose-driven layouts:
- Vary card sizes based on importance
- Use different layouts for different content types
- Create visual hierarchy through size, position, and styling

### Centered Everything

**Problem:** Centering all content without design justification.

**Detection:**
- Check for `text-center` on every element
- Check for `flex items-center justify-center` everywhere
- Check for centered content that should be left-aligned

**Fix:** Align based on content type:
- Headlines: often centered
- Body text: left-aligned (or justified for long form)
- Navigation: left or right aligned
- Forms: left-aligned labels, full-width inputs

## Component Anti-Patterns

### Over-Configured Components

**Problem:** Components with many props that could be composed.

**Detection:**
- Check for components with 10+ props
- Check for boolean props that toggle features
- Check for variant props with many options

**Fix:** Prefer composition:
- Split into smaller, focused components
- Use children for content injection
- Use context for shared state

### Missing States

**Problem:** Components that don't handle loading, error, or empty states.

**Detection:**
- Check for components that assume data exists
- Check for no loading indicators
- Check for no error messages
- Check for no empty state handling

**Fix:** Handle all states:
- Loading: skeleton screens or spinners
- Error: error messages with retry options
- Empty: helpful empty states with CTAs

### No Keyboard Accessibility

**Problem:** Interactive elements that can't be used with keyboard.

**Detection:**
- Check for `<div onClick>` without `tabIndex` and `onKeyDown`
- Check for custom buttons without `role="button"`
- Check for missing focus styles

**Fix:** Make all interactive elements keyboard accessible:
- Use `<button>` for actions
- Add `tabIndex={0}` for custom interactive elements
- Add `onKeyDown` for Enter and Space keys
- Ensure visible focus styles

## Responsive Anti-Patterns

### Desktop-First Design

**Problem:** Designing for desktop and then trying to make it work on mobile.

**Detection:**
- Check for no mobile breakpoints
- Check for fixed widths that break on small screens
- Check for content that overflows on mobile

**Fix:** Design mobile-first:
- Start with mobile layout
- Add breakpoints for larger screens
- Use relative units (%, rem, vw) instead of fixed pixels

### Hidden Mobile Content

**Problem:** Hiding content on mobile instead of adapting it.

**Detection:**
- Check for `hidden md:block` on important content
- Check for mobile-specific layouts that hide desktop content
- Check for content that's only visible on one breakpoint

**Fix:** Adapt content for all breakpoints:
- Prioritize content for mobile
- Use progressive disclosure
- Ensure all content is accessible on all devices

## Interaction & robustness anti-patterns

Cherry-picked from design-lab principles (pack-relevant only):

| Pattern | Why it hurts | Fix |
|---------|--------------|-----|
| `transition: all` / bare Tailwind `transition` | Animates unintended layout props | Name properties (`transition-transform`, etc.) — see `ui-feel` |
| Hover-only affordances without `@media (hover: hover)` | Sticky “hover” on touch | Gate hover styles; provide press/focus equivalents |
| `onPaste` + `preventDefault` | Blocks paste | Allow paste; validate after |
| Placeholder as the only label | A11y + disappears on type | Visible `<label>` (or `aria-label`) |
| Validate on every keystroke harshly | Anxiety, noise | Validate on blur/submit; live-validate gently |
| Destructive action without confirm/undo | Data loss | Confirm dialog or soft-delete + undo |
| Filters/tabs only in React state | Unshareable, broken back | Prefer URL state for shareable view state |
| Tiny touch targets | Mis-taps | ≥44px touch / ≥40px dense desktop (`ui-feel`) |

## Quick Checklist

Before considering UI complete, scan for:

- [ ] No purple/indigo colors unless in token file
- [ ] No excessive gradients
- [ ] No arbitrary pixel values
- [ ] No oversized padding everywhere
- [ ] No skipped heading levels
- [ ] No generic hero sections
- [ ] No stock card grids
- [ ] No centered everything
- [ ] No over-configured components
- [ ] No missing loading/error/empty states
- [ ] No keyboard accessibility issues
- [ ] No desktop-first design
- [ ] No hidden mobile content
- [ ] No `transition: all` / bare `transition`
- [ ] Destructive actions confirmable / recoverable
- [ ] Shareable filters use URL state when appropriate
