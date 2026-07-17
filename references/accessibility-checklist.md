# Accessibility Checklist (WCAG 2.1 AA)

Every component must meet these standards. This checklist covers the most common accessibility requirements for web applications.

## Keyboard Navigation

### Interactive Elements

- [ ] All interactive elements are focusable
- [ ] Focus order is logical and intuitive
- [ ] Focus is visible (focus ring or outline)
- [ ] Focus is trapped in modals and dialogs
- [ ] Focus returns to trigger element when modal closes

### Keyboard Shortcuts

- [ ] Enter activates buttons and links
- [ ] Space activates buttons and toggles
- [ ] Arrow keys navigate within components (tabs, menus, lists)
- [ ] Escape closes modals and menus
- [ ] Tab moves focus forward, Shift+Tab moves focus backward

### Code Examples

```tsx
// Good: Keyboard accessible button
<button onClick={handleClick}>Click me</button>

// Good: Custom interactive element with keyboard support
<div
  role="button"
  tabIndex={0}
  onClick={handleClick}
  onKeyDown={(e) => {
    if (e.key === 'Enter' || e.key === ' ') {
      e.preventDefault()
      handleClick()
    }
  }}
>
  Click me
</div>

// Bad: Not keyboard accessible
<div onClick={handleClick}>Click me</div>
```

## ARIA Labels

### Form Inputs

- [ ] All inputs have associated labels
- [ ] Labels are visible (not just placeholder text)
- [ ] Required fields are indicated
- [ ] Error messages are associated with inputs

### Interactive Elements

- [ ] Buttons without visible text have `aria-label`
- [ ] Icons have `aria-label` or are decorative (`aria-hidden`)
- [ ] Toggle states are announced (`aria-pressed`, `aria-expanded`)
- [ ] Loading states are announced (`aria-busy`, `aria-live`)

### Navigation

- [ ] Navigation has `aria-label` when multiple nav elements exist
- [ ] Current page is indicated (`aria-current="page"`)
- [ ] Breadcrumbs are properly labeled

### Code Examples

```tsx
// Good: Labeled input
<label htmlFor="email">Email</label>
<input id="email" type="email" />

// Good: Icon button with label (Reicon)
import { CloseCircle } from "reicon-react"
<button type="button" aria-label="Close dialog">
  <CloseCircle size={20} aria-hidden />
</button>

// Good: Loading state announced
<div aria-busy="true" aria-label="Loading tasks">
  <TaskListSkeleton />
</div>

// Bad: No label
<input type="email" placeholder="Email" />

// Bad: Icon without label
<button><CloseCircle size={20} /></button>
```

## Focus Management

### Modals and Dialogs

- [ ] Focus moves to modal when opened
- [ ] Focus is trapped within modal
- [ ] Focus returns to trigger when modal closes
- [ ] Background content is inert (`aria-hidden="true"` or `inert`)

### Dynamic Content

- [ ] Focus moves to new content when it appears
- [ ] Focus is managed after user actions
- [ ] Skip links are provided for long navigation

### Code Examples

```tsx
// Good: Focus management in modal
function Dialog({ isOpen, onClose }: DialogProps) {
  const closeRef = useRef<HTMLButtonElement>(null)

  useEffect(() => {
    if (isOpen) closeRef.current?.focus()
  }, [isOpen])

  return (
    <dialog open={isOpen}>
      <button ref={closeRef} onClick={onClose}>Close</button>
      {/* dialog content */}
    </dialog>
  )
}

// Good: Focus after action
function TaskItem({ task, onDelete }: TaskItemProps) {
  const deleteRef = useRef<HTMLButtonElement>(null)

  const handleDelete = () => {
    onDelete(task.id)
    // Focus moves to next task or previous element
  }

  return (
    <li>
      <span>{task.title}</span>
      <button ref={deleteRef} onClick={handleDelete}>
        Delete
      </button>
    </li>
  )
}
```

## Color and Contrast

### Text Contrast

- [ ] Normal text has 4.5:1 contrast ratio
- [ ] Large text (18px+ or 14px+ bold) has 3:1 contrast ratio
- [ ] Placeholder text meets contrast requirements
- [ ] Disabled text is identifiable (not just low contrast)

### Interactive State Contrast

- [ ] Focus indicators have 3:1 contrast ratio
- [ ] Hover states are distinguishable
- [ ] Active states are distinguishable
- [ ] Selected states are distinguishable

### Non-Text Contrast

- [ ] Icons have 3:1 contrast ratio against background
- [ ] Form input borders have 3:1 contrast ratio
- [ ] Custom focus indicators have 3:1 contrast ratio

### Code Examples

```tsx
// Good: Semantic colors with sufficient contrast
<p className="text-[hsl(var(--foreground))]">Normal text</p>
<p className="text-[hsl(var(--muted-foreground))]">Secondary text</p>

// Bad: Low contrast text
<p className="text-gray-400">Hard to read text</p>

// Good: Focus indicator with sufficient contrast
<button className="focus:outline-none focus:ring-2 focus:ring-[hsl(var(--ring))] focus:ring-offset-2">
  Focus me
</button>
```

## Semantic HTML

### Headings

- [ ] One `<h1>` per page
- [ ] Heading levels are sequential (h1 → h2 → h3)
- [ ] Headings are used for structure, not styling
- [ ] Heading hierarchy makes sense when styles are removed

### Landmarks

- [ ] Page has landmark regions (`<header>`, `<nav>`, `<main>`, `<footer>`)
- [ ] Landmarks are properly labeled when multiple exist
- [ ] Main content is in `<main>` element
- [ ] Navigation is in `<nav>` element

### Lists

- [ ] Lists use `<ul>`, `<ol>`, or `<dl>`
- [ ] List items use `<li>`
- [ ] Description lists use `<dt>` and `<dd>`

### Code Examples

```tsx
// Good: Proper heading hierarchy
<main>
  <h1>Dashboard</h1>
  <section>
    <h2>Recent Activity</h2>
    <h3>Tasks</h3>
  </section>
  <section>
    <h2>Settings</h2>
  </section>
</main>

// Good: Landmarks
<header>
  <nav aria-label="Main navigation">
    {/* navigation items */}
  </nav>
</header>
<main>
  {/* main content */}
</main>
<footer>
  {/* footer content */}
</footer>

// Bad: Skipped heading levels
<h1>Dashboard</h1>
<h3>Recent Activity</h3>

// Bad: Divs for structure
<div class="header">...</div>
<div class="nav">...</div>
<div class="main">...</div>
```

## Forms

### Labels and Instructions

- [ ] All inputs have visible labels
- [ ] Required fields are indicated (not just color)
- [ ] Format requirements are provided
- [ ] Help text is associated with inputs

### Validation

- [ ] Error messages are specific and helpful
- [ ] Errors are associated with inputs (`aria-describedby`)
- [ ] Errors are announced to screen readers (`aria-live`)
- [ ] Focus moves to first error on submit

### Code Examples

```tsx
// Good: Accessible form
<div className="space-y-2">
  <Label htmlFor="email">
    Email <span aria-hidden="true">*</span>
  </Label>
  <Input
    id="email"
    type="email"
    required
    aria-describedby="email-hint email-error"
    aria-invalid={hasError}
  />
  <p id="email-hint" className="text-sm text-[hsl(var(--muted-foreground))]">
    We'll never share your email.
  </p>
  {hasError && (
    <p id="email-error" className="text-sm text-[hsl(var(--destructive))]" role="alert">
      Please enter a valid email address.
    </p>
  )}
</div>

// Bad: No label, no error association
<div>
  <input type="email" placeholder="Email" required />
  {hasError && <p className="text-red-500">Invalid email</p>}
</div>
```

## Images and Media

### Images

- [ ] Informative images have `alt` text
- [ ] Decorative images have empty `alt` or `aria-hidden`
- [ ] Complex images have extended descriptions
- [ ] Images don't convey information through color alone

### Media

- [ ] Videos have captions
- [ ] Videos have audio descriptions (if needed)
- [ ] Auto-playing media can be paused
- [ ] Media controls are keyboard accessible

### Code Examples

```tsx
// Good: Informative image
<img src="chart.png" alt="Sales increased 25% from January to March" />

// Good: Decorative image
<img src="divider.png" alt="" aria-hidden="true" />

// Bad: Missing alt
<img src="chart.png" />

// Bad: Decorative image with alt
<img src="divider.png" alt="divider line" />
```

## Tables

### Structure

- [ ] Tables have captions or labels
- [ ] Headers use `<th>` elements
- [ ] Headers have scope attributes
- [ ] Complex tables have id/headers associations

### Navigation

- [ ] Tables are keyboard navigable
- [ ] Sortable columns are indicated
- [ ] Sort state is announced

### Code Examples

```tsx
// Good: Accessible table
<table>
  <caption>Monthly Sales Report</caption>
  <thead>
    <tr>
      <th scope="col">Month</th>
      <th scope="col">Revenue</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">January</th>
      <td>$10,000</td>
    </tr>
  </tbody>
</table>

// Bad: No caption, no headers
<table>
  <tr>
    <td>Month</td>
    <td>Revenue</td>
  </tr>
  <tr>
    <td>January</td>
    <td>$10,000</td>
  </tr>
</table>
```

## Testing Tools

### Browser Extensions

- [ ] axe DevTools (Chrome/Firefox)
- [ ] WAVE Evaluation Tool
- [ ] IBM Equal Access Accessibility Checker

### Automated Testing

- [ ] axe-core in unit tests
- [ ] Lighthouse accessibility audit
- [ ] Pa11y for CI/CD integration

### Manual Testing

- [ ] Keyboard-only navigation
- [ ] Screen reader testing (VoiceOver, NVDA, JAWS)
- [ ] Zoom to 200%
- [ ] Windows High Contrast Mode

### Code Example

```tsx
// Good: axe-core test
import { render } from '@testing-library/react'
import { axe, toHaveNoViolations } from 'jest-axe'

expect.extend(toHaveNoViolations)

describe('Button', () => {
  it('should have no accessibility violations', async () => {
    const { container } = render(<Button>Click me</Button>)
    const results = await axe(container)
    expect(results).toHaveNoViolations()
  })
})
```

## Quick Checklist

Before considering UI complete:

- [ ] All interactive elements are keyboard accessible
- [ ] All form inputs have visible labels
- [ ] Color contrast meets WCAG 2.1 AA requirements
- [ ] Headings follow sequential hierarchy
- [ ] Landmark regions are properly used
- [ ] Images have appropriate alt text
- [ ] Tables have proper headers and captions
- [ ] Focus management works in modals/dialogs
- [ ] Screen reader can convey page structure
- [ ] No accessibility warnings in dev tools or axe-core
