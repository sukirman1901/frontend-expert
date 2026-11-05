# Motion Reference

Lanes, tokens, and implementation recipes (Framer Motion / GSAP / CSS).

**Family & pattern vocabulary (pick by name, then hand-roll):** [`motion-families.md`](./motion-families.md) — 12 families · 144 named patterns.

## Motion lanes

| Lane | When | Default patterns |
|------|------|------------------|
| **Product / shell** | App chrome, dashboard, settings | `fade-up` / `page-crossfade`, `drawer-slide`, `press-scale`, `lift-hover` |
| **Marketing / expressive** | Landing, campaigns | Pick **1–2 families** from `motion-families.md` (e.g. Hero **or** Text — not both plus 3D) |

**Rule:** Implement by **hand-roll** from pattern definisi. Do **not** default to installing a third-party motion registry.

## Token defaults

| Scale | Duration | Use |
|-------|----------|-----|
| Micro | 100–200ms | Hover, press, toggles |
| UI | 200–400ms | Panels, drawers, fades |
| Section | 400–700ms | Marketing reveals (sparingly) |

Prefer **ease-out**; animate **`transform` / `opacity`**. Honor `prefers-reduced-motion`.

Budget: **2–3 intentional motions** per viewport.

---

## Animation Principles

### Easing Curves

```tsx
// Standard easing
const ease = {
  ease: [0.25, 0.1, 0.25, 1.0], // cubic-bezier
}

// Common presets
const easings = {
  easeOut: [0, 0, 0.2, 1],
  easeIn: [0.4, 0, 1, 1],
  easeInOut: [0.4, 0, 0.2, 1],
  spring: { type: 'spring', stiffness: 100, damping: 10 },
}
```

### Duration

```tsx
// Short: Micro-interactions (100-200ms)
const duration = { duration: 0.15 }

// Medium: UI transitions (200-400ms)
const duration = { duration: 0.3 }

// Long: Page transitions (400-700ms)
const duration = { duration: 0.5 }
```

### Stagger

```tsx
// Stagger children
const container = {
  hidden: { opacity: 0 },
  show: {
    opacity: 1,
    transition: {
      staggerChildren: 0.1,
    },
  },
}

const item = {
  hidden: { opacity: 0, y: 20 },
  show: { opacity: 1, y: 0 },
}

// Usage
<motion.ul variants={container} initial="hidden" animate="show">
  {items.map((item) => (
    <motion.li key={item.id} variants={item}>
      {item.name}
    </motion.li>
  ))}
</motion.ul>
```

## Framer Motion

### Basic Animations

```tsx
import { motion } from 'framer-motion'

// Fade in
<motion.div
  initial={{ opacity: 0 }}
  animate={{ opacity: 1 }}
  transition={{ duration: 0.3 }}
/>

// Slide up
<motion.div
  initial={{ opacity: 0, y: 20 }}
  animate={{ opacity: 1, y: 0 }}
  transition={{ duration: 0.3 }}
/>

// Scale
<motion.div
  initial={{ scale: 0.9, opacity: 0 }}
  animate={{ scale: 1, opacity: 1 }}
  transition={{ duration: 0.3 }}
/>
```

### Hover and Tap

```tsx
<motion.button
  whileHover={{ scale: 1.05 }}
  whileTap={{ scale: 0.95 }}
>
  Click me
</motion.button>

<motion.div
  whileHover={{ 
    scale: 1.02,
    boxShadow: '0 10px 30px rgba(0,0,0,0.1)',
  }}
  whileTap={{ scale: 0.98 }}
/>
```

### Variants

```tsx
const variants = {
  hidden: { opacity: 0, y: 20 },
  visible: { opacity: 1, y: 0 },
  exit: { opacity: 0, y: -20 },
}

<motion.div
  variants={variants}
  initial="hidden"
  animate="visible"
  exit="exit"
/>
```

### Layout Animations

```tsx
import { LayoutGroup, motion } from 'framer-motion'

function AnimatedList({ items }) {
  return (
    <LayoutGroup>
      <motion.ul layout>
        {items.map((item) => (
          <motion.li
            key={item.id}
            layout
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
          >
            {item.name}
          </motion.li>
        ))}
      </motion.ul>
    </LayoutGroup>
  )
}
```

### Gesture Animations

```tsx
import { motion, useDragControls } from 'framer-motion'

function DraggableCard() {
  const dragControls = useDragControls()
  
  return (
    <motion.div
      drag
      dragControls={dragControls}
      dragConstraints={{ left: 0, right: 300 }}
      dragElastic={0.1}
      whileDrag={{ scale: 1.05, boxShadow: '0 20px 40px rgba(0,0,0,0.2)' }}
    >
      <div onPointerDown={(e) => dragControls.start(e)}>
        Drag me
      </div>
    </motion.div>
  )
}
```

### Scroll Animations

```tsx
import { motion, useScroll, useTransform } from 'framer-motion'

function ScrollParallax() {
  const { scrollY } = useScroll()
  const y = useTransform(scrollY, [0, 1000], [0, -200])
  
  return (
    <motion.div style={{ y }}>
      Parallax content
    </motion.div>
  )
}

function ScrollReveal() {
  return (
    <motion.div
      initial={{ opacity: 0, y: 50 }}
      whileInView={{ opacity: 1, y: 0 }}
      viewport={{ once: true }}
      transition={{ duration: 0.5 }}
    >
      Revealed on scroll
    </motion.div>
  )
}
```

### AnimatePresence

```tsx
import { AnimatePresence, motion } from 'framer-motion'

function Modal({ isOpen, onClose }) {
  return (
    <AnimatePresence>
      {isOpen && (
        <motion.div
          initial={{ opacity: 0 }}
          animate={{ opacity: 1 }}
          exit={{ opacity: 0 }}
          onClick={onClose}
        >
          <motion.div
            initial={{ scale: 0.9, opacity: 0 }}
            animate={{ scale: 1, opacity: 1 }}
            exit={{ scale: 0.9, opacity: 0 }}
            onClick={(e) => e.stopPropagation()}
          >
            Modal content
          </motion.div>
        </motion.div>
      )}
    </AnimatePresence>
  )
}
```

## GSAP

### Basic Animations

```tsx
import { gsap } from 'gsap'

// Fade in
gsap.to(element, { 
  opacity: 1, 
  duration: 0.3 
})

// Slide up
gsap.from(element, { 
  y: 20, 
  opacity: 0, 
  duration: 0.3 
})

// Scale
gsap.from(element, { 
  scale: 0.9, 
  opacity: 0, 
  duration: 0.3 
})
```

### Timelines

```tsx
const tl = gsap.timeline()

tl.to(element1, { x: 100, duration: 0.5 })
  .to(element2, { x: 100, duration: 0.5 }, '-=0.3') // Overlap
  .to(element3, { x: 100, duration: 0.5 }, '-=0.3')
```

### ScrollTrigger

```tsx
import { ScrollTrigger } from 'gsap/ScrollTrigger'

gsap.registerPlugin(ScrollTrigger)

// Reveal on scroll
gsap.from(element, {
  scrollTrigger: {
    trigger: element,
    start: 'top 80%',
    end: 'bottom 20%',
    toggleActions: 'play none none reverse',
  },
  y: 50,
  opacity: 0,
  duration: 0.5,
})

// Parallax
gsap.to(element, {
  scrollTrigger: {
    trigger: element,
    start: 'top bottom',
    end: 'bottom top',
    scrub: true,
  },
  y: -100,
})
```

### React GSAP Hook

```tsx
import { useRef, useEffect } from 'react'
import { gsap } from 'gsap'

function AnimatedComponent() {
  const elementRef = useRef(null)
  
  useEffect(() => {
    gsap.from(elementRef.current, {
      y: 20,
      opacity: 0,
      duration: 0.5,
    })
  }, [])
  
  return <div ref={elementRef}>Animated content</div>
}
```

## Product-state motion contracts

**Classification: recommendations.** Project motion tokens and existing primitives take precedence. Name the existing family/pattern where applicable; data and scroll behavior need not acquire a decorative pattern. Record these decisions for each changed interaction:

| Field | Contract |
|---|---|
| Purpose + trigger | What action/change does motion explain? State changes immediately; animation completion must not authorize or delay the action |
| Identity + origin | Keep stable data keys/selection identity and a meaningful origin; do not remount unchanged content to replay entrance |
| Properties + timing | Choose transform/opacity first; bounded size/layout transitions when flow must change. Specify easing or spring role, not arbitrary bounce everywhere |
| Interruption | Retarget from the current visual state; cancel stale timers/completions on reversal, replacement and unmount |
| Input | Keyboard activation/focus, touch equivalent, pointercancel/lost capture cleanup, and a non-drag alternative where applicable |
| Reduced motion | Show the final state immediately or with a short opacity change; remove travel, scale, blur, stagger and decorative loops. Check child/CSS/layout animations too |
| Evidence | Separate source inspection, state assertions, target screenshots, temporal playback and measured performance; none substitutes for all the others |

### Disclosure and origin-aware morph

- For an accordion, animate a clipped outer shell only when surrounding flow must change. Measure the inner content (including late fonts/images or streamed text) and retarget its size; leave it intrinsically sized after settling. `height: auto` entry alone does not prove dynamic resizing is smooth. Avoid read/write layout loops and observation feedback on the animated shell.
- Keep a native trigger with `aria-expanded` and a stable `aria-controls` relationship. Closed/exiting content must not remain focusable; return focus to the trigger before hiding a focused descendant. Use an appropriate hidden/inert lifecycle, not opacity alone.
- For trigger-to-panel morphs, animate a shared shell/origin while keeping text/glyph scale undistorted. Bound the panel to the viewport. Focus the usable input without waiting for decorative motion; support Escape, dismissal and focus restoration.
- On rapid open/close, reverse from the current visual state rather than queueing full transitions. Semantic open/closed state is authoritative even if the exit is still painting.
- Reduced motion directly applies the open/closed endpoint with the same semantics. Verify a late content resize, repeated reversal, keyboard dismissal and focus return on the actual component.

### Selection, gestures and local choreography

- Selection indicators follow the selected ID; arrow-key navigation must not wait for the indicator. Direction-aware content swaps derive direction from item order/history, not a constant left/right entrance.
- Drag/snap declares activation threshold, bounds, resistance and velocity policy. Preserve page scrolling on the other axis; clean up on pointercancel, lost capture and unmount. Cancelled gestures must not fire stale click actions. Provide explicit buttons/keyboard actions for the same outcome.
- Hover is enhancement. Touch may use visible labels or an explicit reveal control; first-tap reveal/second-tap activation is an optional pattern, not a universal toolbar rule.
- Bound stagger to a small new group and a total delay budget. Do not stagger every streamed token or hold critical controls until an entrance completes.

### Live charts and numeric updates

- Treat loading, empty, error and valid data separately. Placeholder values are not real data; expose an accessible table/summary for actual values and keyboard-accessible inspection where interactive.
- Keep series/point IDs stable. Choose and disclose domain behavior; preserve missing-data gaps. A domain change must not appear to be a data change. Interpolation is visual continuity, not additional measured samples.
- Retarget/coalesce burst updates instead of queueing every transition. Never replay a full chart entrance on every update. Tooltip, selection and accessible values must refer coherently to the current data snapshot, not invented intermediate values.
- Use tabular numerals for rolling values, preserve precision/sign/units, and announce meaningful final changes rather than every animation frame. Reduced motion applies final geometry/value immediately.
- Verify burst updates, filtering/removal of the selected series, all-zero/missing data, domain changes, keyboard inspection and actual frame/layout performance before calling updates smooth.

### Streaming and follow-latest

- Follow incoming content only while the reader is near the latest content or explicitly enables follow. User scroll away suspends following; offer a keyboard-accessible jump/resume control and preserve reading position as content grows above it.
- Do not repeatedly smooth-scroll per token or use typewriter effects to delay available text. Batch meaningful updates; avoid live-region announcements on every token.
- Resume only on explicit action or return to the follow region. Reduced motion uses instant repositioning when following; it never overrides the user's reading position.

### Timing by role

Use a firm, short settling response for press/selection; a calmer shell transition for panels; stronger tracking for direct manipulation. Easing is useful for bounded fades/exits, springs for interruptible continuity. Spring stiffness/damping/mass are coupled and do not promise a fixed duration. Scale depends on surface size and density: a small expressive button's press scale is not a large panel's default. Tune from project tokens and inspect rapid reversals, not just a single ideal playback.

## Micro-interaction examples

### Button States

```tsx
// Hover effect
<motion.button
  whileHover={{ scale: 1.02 }}
  whileTap={{ scale: 0.98 }}
  className="transition-colors"
>
  Button
</motion.button>

```

For loading, use the retained-label `ButtonContent` / `SubmitButton` example in `component-patterns.md`: overlay an `aria-hidden` spinner, keep the accessible action name and footprint, and set `aria-busy`. Do not replace the label node with a spinner. Gate hover effects on hover capability, remove scale/spinner rotation under reduced motion, and suppress press scale in dense toolbars. An explicitly chosen measured-width morph uses the separate state-width policy there.

### Toggle Switch

```tsx
function Toggle({ isOn, onToggle, label, disabled = false, dir = 'ltr' }) {
  const reduce = useReducedMotion()
  return (
    <button
      type="button"
      role="switch"
      aria-checked={isOn}
      aria-label={label}
      disabled={disabled}
      dir={dir}
      onClick={onToggle}
      className={`flex w-12 h-6 items-center rounded-full p-1 transition-colors focus-visible:outline focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-ring disabled:opacity-50 ${
        isOn ? 'bg-primary' : 'bg-muted'
      }`}
    >
      <motion.span
        aria-hidden="true"
        className="block w-4 h-4 shrink-0 bg-background rounded-full"
        animate={{ x: isOn ? (dir === 'rtl' ? -24 : 24) : 0 }}
        transition={reduce ? { duration: 0 } : { type: 'spring', stiffness: 500, damping: 30 }}
      />
    </button>
  )
}
```

The switch sketch assumes 48px track, 16px thumb and 4px inset, giving 24px travel. Replace these together from the project control tuple, including a suitable interactive target and measured contrast. Supply a persistent action label, not a changing “on/off” name.

### Accordion

Use `accordion-focus` with the **Disclosure and origin-aware morph** contract above. For a simple fixed-content entry, `height: 0 → auto` plus opacity can work; dynamic content needs measurement/retargeting or an instant intrinsic-size fallback. Keep trigger semantics, focusability and reduced-motion behavior in the implementation rather than treating the animation snippet as a complete accordion.

### Toast Notification

```tsx
function Toast({ message, isVisible, onClose }) {
  return (
    <AnimatePresence>
      {isVisible && (
        <motion.div
          initial={{ opacity: 0, y: 50, scale: 0.9 }}
          animate={{ opacity: 1, y: 0, scale: 1 }}
          exit={{ opacity: 0, y: 20, scale: 0.9 }}
          className="fixed bottom-4 right-4 bg-gray-900 text-white px-4 py-2 rounded-lg shadow-lg"
        >
          {message}
          <button onClick={onClose} className="ml-4">
            ×
          </button>
        </motion.div>
      )}
    </AnimatePresence>
  )
}
```

### Page Transitions

```tsx
import { motion, AnimatePresence } from 'framer-motion'
import { useLocation } from 'react-router-dom'

function PageTransition({ children }) {
  const location = useLocation()
  
  return (
    <AnimatePresence mode="wait">
      <motion.div
        key={location.pathname}
        initial={{ opacity: 0, y: 20 }}
        animate={{ opacity: 1, y: 0 }}
        exit={{ opacity: 0, y: -20 }}
        transition={{ duration: 0.3 }}
      >
        {children}
      </motion.div>
    </AnimatePresence>
  )
}
```

## Performance

### DO

- Use `transform` and `opacity` for animations
- Use `will-change` sparingly
- Use `AnimatePresence` for exit animations
- Use `layout` for layout animations
- Use `useReducedMotion` hook

### DON'T

- Animate layout properties continuously across broad/deep trees without a measured need. Bounded disclosure/size morphs may animate width/height when flow must change; measure inner content, constrain the scope, retarget on interruption and profile layout cost. Transform scaling alone does not change occupied layout space
- Use too many animations at once
- Animate elements off-screen
- Ignore `prefers-reduced-motion`

### Reduced Motion

```tsx
import { motion, useReducedMotion } from 'framer-motion'

function AnimatedComponent() {
  const shouldReduceMotion = useReducedMotion()
  
  return (
    <motion.div
      initial={shouldReduceMotion ? false : { opacity: 0, y: 12 }}
      animate={{ opacity: 1, y: 0 }}
      transition={{ duration: shouldReduceMotion ? 0 : 0.3 }}
    >
      Content
    </motion.div>
  )
}
```
