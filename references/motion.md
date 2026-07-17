# Motion Reference

Framer Motion, GSAP, animation principles, and micro-interactions.

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

## Micro-Interactions

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

// Loading state
function LoadingButton({ isLoading, children }) {
  return (
    <motion.button
      whileHover={{ scale: 1.02 }}
      whileTap={{ scale: 0.98 }}
      disabled={isLoading}
    >
      <AnimatePresence mode="wait">
        {isLoading ? (
          <motion.div
            key="spinner"
            initial={{ opacity: 0 }}
            animate={{ opacity: 1, rotate: 360 }}
            exit={{ opacity: 0 }}
            transition={{ rotate: { repeat: Infinity, duration: 1 } }}
          >
            <Spinner />
          </motion.div>
        ) : (
          <motion.span
            key="text"
            initial={{ opacity: 0 }}
            animate={{ opacity: 1 }}
            exit={{ opacity: 0 }}
          >
            {children}
          </motion.span>
        )}
      </AnimatePresence>
    </motion.button>
  )
}
```

### Toggle Switch

```tsx
function Toggle({ isOn, onToggle }) {
  return (
    <div
      onClick={onToggle}
      className={`w-12 h-6 rounded-full p-1 cursor-pointer transition-colors ${
        isOn ? 'bg-green-500' : 'bg-gray-300'
      }`}
    >
      <motion.div
        className="w-4 h-4 bg-white rounded-full"
        animate={{ x: isOn ? 24 : 0 }}
        transition={{ type: 'spring', stiffness: 500, damping: 30 }}
      />
    </div>
  )
}
```

### Accordion

```tsx
function Accordion({ title, children }) {
  const [isOpen, setIsOpen] = useState(false)
  
  return (
    <div>
      <button
        onClick={() => setIsOpen(!isOpen)}
        className="flex items-center justify-between w-full p-4"
      >
        <span>{title}</span>
        <motion.span
          animate={{ rotate: isOpen ? 180 : 0 }}
          transition={{ duration: 0.2 }}
        >
          ▼
        </motion.span>
      </button>
      
      <AnimatePresence>
        {isOpen && (
          <motion.div
            initial={{ height: 0, opacity: 0 }}
            animate={{ height: 'auto', opacity: 1 }}
            exit={{ height: 0, opacity: 0 }}
            transition={{ duration: 0.3 }}
            className="overflow-hidden"
          >
            <div className="p-4">{children}</div>
          </motion.div>
        )}
      </AnimatePresence>
    </div>
  )
}
```

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

- Animate `width`, `height`, `top`, `left`, `margin`, `padding`
- Use too many animations at once
- Animate elements off-screen
- Ignore `prefers-reduced-motion`

### Reduced Motion

```tsx
import { useReducedMotion } from 'framer-motion'

function AnimatedComponent() {
  const shouldReduceMotion = useReducedMotion()
  
  return (
    <motion.div
      animate={shouldReduceMotion ? {} : { opacity: 1, y: 0 }}
      transition={{ duration: shouldReduceMotion ? 0 : 0.3 }}
    >
      Content
    </motion.div>
  )
}
```
