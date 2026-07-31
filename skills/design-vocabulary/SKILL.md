---
name: design-vocabulary
description: >-
  Name a design or UI concept from a loose description. Reverse-lookup for
  design terms — user describes something vaguely ("card floating over blur",
  "zig-zag layout"), skill returns the proper name + brief definition. Use when
  the user uses informal language for a UI concept, or when you need the correct
  term to search references or communicate precisely.
---

# Design Vocabulary

## Overview

Bridge the gap between **casual descriptions** and **precise design terms**. When a user (or you) describes a UI concept loosely, look it up here before implementing.

## When to use

- User describes a UI element informally ("yang ngambang itu", "efek kaca")
- You need the precise term to search `references/` or implementation patterns
- Communicating design decisions in a handoff or audit

## When to skip

- User already uses the correct term
- Pure code fix with no design concept involved

## Lookup table

### Layout & Structure

| Description (loose) | Term | Definition |
|---------------------|------|------------|
| Cards in different sizes grid | **Bento grid / Masonry** | Asymmetric grid where items have varied sizes |
| Zig-zag text and image | **Alternating layout** | Rows alternate image-left/image-right |
| Content in the center, nothing on sides | **Centered container / Max-width wrapper** | Content constrained to a max-width, centered |
| Two columns, one narrow one wide | **Sidebar layout / Holy grail** | Classic sidebar + main content split |
| Full-width edge-to-edge | **Full-bleed** | Content extends to viewport edges |
| Overlapping elements | **Z-stack / Overlapping composition** | Elements layered via absolute/grid overlap |
| Split screen half and half | **Split hero / 50-50 layout** | Two equal panels side by side |
| Sticky thing that follows scroll | **Sticky element** | `position: sticky` — stays in view within parent |
| Content that pins while other scrolls | **Scroll-linked pinning** | One panel fixed while adjacent content scrolls |
| Cards that can be dragged to reorder | **Drag-and-drop sortable** | Reorderable list/grid via drag interaction |

### Components & Patterns

| Description (loose) | Term | Definition |
|---------------------|------|------------|
| Popup that asks "are you sure?" | **Confirmation dialog / Alert dialog** | Modal requiring explicit confirm/cancel |
| Small notification that auto-hides | **Toast / Snackbar** | Temporary status message, auto-dismisses |
| Menu that appears on right-click | **Context menu** | Action menu anchored to pointer position |
| Box floating near a button | **Popover / Tooltip** | Non-modal overlay anchored to a trigger |
| Menu from the side | **Drawer / Sheet / Sidebar panel** | Slide-in panel from screen edge |
| Bottom sheet on mobile | **Bottom sheet** | Drawer that slides up from bottom on mobile |
| Dot on an icon showing count | **Badge / Notification badge** | Small count/status indicator on an element |
| Expandable section with arrow | **Accordion / Disclosure** | Collapsible content section with toggle |
| Tabs but vertical | **Vertical tabs / Tab rail** | Tab navigation stacked vertically |
| Stepper showing progress | **Stepper / Wizard progress** | Multi-step form progress indicator |
| Chips you can select/remove | **Tag / Chip / Pill** | Compact element for input, filter, or display |
| Search with dropdown suggestions | **Combobox / Autocomplete** | Input + filtered suggestion dropdown |
| Toggle that slides | **Switch / Toggle** | Binary on/off control with sliding thumb |
| Skeleton boxes before content loads | **Skeleton screen / Placeholder** | Animated loading placeholders mimicking layout |
| Lightbox for images | **Lightbox / Image modal** | Full-screen overlay for viewing images |
| Infinite scroll | **Infinite scroll / Pagination by scroll** | Load more items when nearing bottom |
| Breadcrumb trail | **Breadcrumbs** | Hierarchical navigation trail (Home > Category > Item) |
| Floating button bottom-right | **FAB (Floating Action Button)** | Persistent primary action floating on page |
| Card with image on top | **Media card / Card with hero** | Card component with prominent top image |
| Data table with sorting | **Data table / Data grid** | Table with sort, filter, pagination features |
| Command palette (Cmd+K) | **Command palette / Command bar** | Quick-action search overlay |

### Visual Effects & Style

| Description (loose) | Term | Definition |
|---------------------|------|------------|
| Frosted glass / blur behind card | **Glassmorphism** | Translucent surface + backdrop blur + subtle border |
| Soft 3D raised look | **Neumorphism** | Soft inner/outer shadows simulating extrusion |
| Dark mode with depth | **Dark surface hierarchy** | Multiple dark tones creating elevation layers |
| Gradient border | **Gradient border / Border image** | Border using gradient instead of solid color |
| Glow around element | **Glow effect / Box-shadow glow** | Colored box-shadow simulating light emission |
| Parallax / background moves slower | **Parallax scrolling** | Background layers scroll at different rates |
| Text over image with overlay | **Hero overlay / Scrim** | Semi-transparent layer between image and text |
| Grain / noise texture | **Film grain / Noise overlay** | Subtle texture via SVG filter or CSS |
| Mesh of colors | **Mesh gradient** | Multi-point gradient with organic color blending |
| Blob shapes | **Blob / Organic shape** | Amorphous rounded shapes as decorative elements |

### Typography & Text

| Description (loose) | Term | Definition |
|---------------------|------|------------|
| Small text under input | **Helper text / Caption** | Guidance text below a form field |
| Small label above input | **Floating label** | Label that animates from inside to above input |
| Text that appears letter by letter | **Typewriter effect / Text reveal** | Sequential character animation |
| Big bold hero text | **Display heading / Hero heading** | Oversized heading for primary visual impact |
| Text that fades in on scroll | **Scroll reveal / Fade-in on scroll** | Content enters view with opacity transition |
| Highlighted/colored word in heading | **Accent text / Highlighted span** | Emphasizing key word with color/weight |
| Truncated text with "..." | **Text truncation / Ellipsis** | Overflow hidden with `text-overflow: ellipsis` |
| Strikethrough on old price | **Strikethrough / Price comparison** | Line through original price showing discount |

### Interaction & Motion

| Description (loose) | Term | Definition |
|---------------------|------|------------|
| Button shrinks when pressed | **Press feedback / Scale-on-press** | `scale(0.96)` on active state |
| Card lifts on hover | **Lift hover / Elevation on hover** | Increased shadow + translateY on hover |
| Smooth page switch | **Page transition / View transition** | Animated route change |
| Element morphs into another | **Shared element transition / Morph** | Element animates between two states/positions |
| Scroll-linked progress bar | **Scroll progress indicator** | Progress bar tied to scroll position |
| Sticky header that shrinks | **Collapsing header / Shrink-on-scroll** | Header reduces height after scrolling |
| Content slides in from side | **Slide-in / Reveal entrance** | Element enters viewport with translateX/Y |
| Staggered cards appearing | **Stagger animation** | Sequential delay on sibling element entrances |
| Logo carousel that never stops | **Infinite marquee / Logo ticker** | Continuous horizontal scroll loop |
| Image carousel with snap | **Snap carousel / Filmstrip** | Horizontal scroll with CSS scroll-snap |

### Page Types

| Description (loose) | Term | Definition |
|---------------------|------|------------|
| Settings page with sections | **Settings panel / Preferences** | Grouped configuration UI |
| Landing page | **Marketing landing / SaaS landing** | Conversion-focused page with section stack |
| Dashboard with charts | **Analytics dashboard** | Data visualization + metrics overview |
| Login/signup page | **Auth screen / Sign-in flow** | Authentication entry point |
| 404 page | **Error page / Not found** | Graceful dead-end with navigation options |
| Pricing table | **Pricing page / Plan comparison** | Tier comparison with CTAs |
| Profile/account page | **Account settings / Profile page** | User information management |
| Blog listing | **Blog index / Article feed** | Chronological content listing |

## Workflow

1. **Listen** for loose/informal UI descriptions
2. **Match** against the lookup table above
3. **Return** the proper term + brief definition
4. **Use** the term in your implementation and communication

## Checklist

- [ ] Loose description identified
- [ ] Correct design term applied
- [ ] Term used consistently in code (class names, comments)
- [ ] Implementation matches the pattern definition

## Depth

Cross-reference with:
- Component patterns: `references/component-patterns.md`
- Layout: `references/responsive.md`
- Motion: `references/motion-families.md`
- Landing sections: `references/landing-sections.md`
- UX foundations: `references/ux-foundations.md`
