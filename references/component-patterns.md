# Component Patterns

Skill entry: `skills/components/SKILL.md`. Examples may use typical product primitives — prefer the **project’s** existing components over installing a new kit. Token values come from the project system or the pack decision tree, not from raw purple/indigo.

## Task-shaped component anatomy

**Classification: recommendations, not a new component kit.** Start with the project's primitives and the selected block job (`design-foundations.md`). Specify the regions inside the component before choosing its surface treatment. Read only the recipe relevant to the task.

| Region | Construction question |
|---|---|
| Identity | Which name, marker or thumbnail lets the reader recognize the object across states? |
| Primary content | What must remain readable and dominant? Give this flexible width and an explicit wrapping rule |
| Context | Which metadata belongs on the same baseline, a subordinate line, or in disclosure? |
| State | Where do selected/pending/error/success appear without moving the action target or hiding the object? |
| Action edge | Which action is local, which is primary, and what space is reserved for it? |
| Boundary | Does this need a surface, divider, whitespace or no extra container? Nested cards require a grouping reason |

### Repeated editor / scheduler

- Compose a stable label/toggle track, a flexible field region and a compact secondary-action edge. Repeat their alignment across rows; do not repeat a large section heading or card padding for every field.
- Bound field widths by the information they edit. A time pair should not stretch to fill an entire wide panel merely because space exists. Conversely, stack start/end controls when native rendering, localization or font size cannot fit; `min-width: 0` does not make clipped text readable.
- Keep add/remove/copy attached to the affected row. Preserve input and scroll/focus context after validation; put the correction beside the field, and save status at the save boundary.
- Off/disabled rows can be quieter but still identifiable and reversible. Adding a range preserves the day anchor; motion explains insertion rather than animating all rows on every keystroke.
- Check repeated-row height against the editing task: aligned fields alone do not establish compactness. If secondary actions and empty spacing dominate each row, test a shared action track on wide screens while preserving labels and hit areas.
- Verify actual native control rendering where used: time segments, AM/PM, calendar affordance and zoom. Cross-browser differences require evidence or an explicit verification gap.

### Queue row / object inspector

- Keep object identity, critical status and one relevant action visible; secondary metadata receives less weight. Use aligned fields for comparison and a stable selection cue tied to the object's ID.
- Contextual detail should answer the next decision, not duplicate the entire row in a new ornamental card. Keep list selection and detail heading visibly connected.
- On narrow screens, use an inline expansion or explicit list/detail mode with a return path and preserved filters/scroll. If stacking is chosen, bring the requested detail into view without losing the selected identity.
- A long name must not push actions outside the container. Inspect local clipping and hit-area overlap; use row reflow or disclosure rather than hiding the problem with overflow clipping.

### Chart as an analytic component

- Separate title/definition/range, series controls, plot, inspector and accessible data alternative. Units and missing-data meaning belong near the plot; quiet controls must not overwhelm the comparison.
- Size axes and labels in readable CSS pixels. Recalculate plot width, gutters, tick count and date stride at each available width; do not shrink a fixed desktop viewBox with all its text and stroke widths. Fewer labeled ticks plus exact inspection is preferable to microscopic labels.
- Data geometry and text geometry have different constraints: keep a useful plot height, stable text scale and non-clipping edge labels. Reserve an inspector position or clamp it inside the visible region; keyboard and touch can inspect the same data.
- Choose encoding by question: line for ordered trend, bars for magnitude comparison, distribution for spread. Do not default to a smooth area chart for every dataset, bridge missing samples, or add decorative trends.
- Keep series IDs and definitions aligned with tooltips/table. Read **Live charts and numeric updates** in `motion.md` for interpolation, burst updates and state truth.

### Agent workspace: conversation, activity, evidence and artifact

- Distinguish four content roles. **Conversation** records intent; **activity** reports tool progress; **evidence** exposes sources; **artifact** is the output the user reviews/edits/uses. Their weight follows the task—do not render all four as identical bubbles/cards.
- For review work, prioritize the artifact, then the relevant evidence; keep completed activity compact and inspectable. Error activity stays attached to its tool/item with a usable retry. Respect user-opened details rather than repeatedly auto-collapsing them.
- Source markers point to actual supplied excerpts/links. Put source access near the supported claim or artifact; at mobile widths disclose it locally rather than burying it below a tall composer. No decorative citation numbers or invented provenance.
- Verify that mobile reading order actually implements that relationship: provide source disclosure beside the artifact or before the composer, with matching DOM/focus order. A desktop sidebar that simply stacks after the entire workspace does not meet this intent.
- Composer anatomy: bounded auto-growing text area, optional attachments/context, then an action rail. Keep Send/Stop in a stable slot; separate generation status from acceptance. Enter/Shift+Enter behavior respects IME composition; preserve recoverable input/partial output on failure.
- Allocate explicit space to transcript/artifact/composer if using a viewport workspace. Put scrolling on the intended content region (`min-height: 0` where needed), avoid nested accidental scrollers, and never clip status or recovery behind a fixed footer. Natural document flow is also valid; choose deliberately.
- When the product requires approval or acceptance, display the actual action and consequence separately from generated output. Generation completion is not execution/approval. Do not add approval UI to unrelated workflows.
- For streaming, use the follow-latest contract in `motion.md`; inspect long content, Stop, Retry, source expansion and narrow-screen reading position.

### Craft pass across the family

Render one representative component through its states before multiplying it across a page. Compare text-start alignment, label/value proximity, icon-slot weight, action edge, border/inset relationship and state continuity. Keep shared values in tokens; deliberate differences should follow role/density, not accidental one-off styling. Review at actual size, not only enlarged screenshots or a component isolated from its neighbors.

## Props and public API

```yaml
principle: Composition over prop bags
classification: recommendation
recommendation: optional regions are slots/children; visuals stay in tokens
exceptions: [leaf primitives from an existing design system]
verification: [public prop count, exclusive modes, rendered states]
last_verified: 2026-09
```

| Smell | Fix |
|-------|-----|
| `showHeader`, `showIcon`, `hasFooter` | `CardHeader` / icon slot / don’t render the slot |
| `color`, `shadow`, `rounded`, `padding` on a product component | Token classes or `design-surfaces` |
| `variant` + overlapping booleans | One discriminant (`variant: 'filter' \| 'display'`) |
| 12 optional props added in one PR | Wrapper, split, or composition |
| Fetch inside every presentational card | Container fetches; child receives data |

### Good: data + events + slots

```tsx
type OrderCardProps = {
  order: Order
  onOpen: (id: string) => void
  children?: React.ReactNode
}

export function OrderCard({ order, onOpen, children }: OrderCardProps) {
  return (
    <article>
      <h3>{order.title}</h3>
      <button type="button" onClick={() => onOpen(order.id)}>Open</button>
      {children}
    </article>
  )
}
```

### Bad: style and boolean soup

```tsx
type OrderCardProps = {
  title: string
  showHeader?: boolean
  showFooter?: boolean
  isLoading?: boolean
  color?: string
  shadow?: boolean
  rounded?: string
  padding?: number
}
```

Do not treat `className` as a substitute for a missing slot, and do not treat `className` as forbidden — it is an escape hatch, not the layout API.

## Button

### Control size contract

**Classification: recommendation.** Use the project's control tokens first. Define each density/size as one tuple, not independently chosen padding and font values:

| Dimension | Decision |
|---|---|
| Min-height + line-height | Fit the actual label and zoom; choose wrap, truncation with an accessible full label, or row reflow deliberately |
| Padding-inline + gap | Symmetric outer padding, logical start/end slots; density belongs to the control family |
| Icon slot | Fixed non-shrinking box; glyph bounds can be smaller and optically corrected inside it |
| Radius | Project token; nested relationships belong to `design-surfaces.md` |
| Interactive target + focus ring | Measure separately from the visible surface and glyph; hit-area expansion must not overlap adjacent actions |

For scale comparison only, a compact/regular/large button might use heights 32/40/48px, inline padding 12/20/24px, gaps 6/8/8px and text 12/14/16px. These are **illustrative inspiration**, not accessibility thresholds or a required preset. A 64px expressive CTA and a dense toolbar control serve different purposes. Prefer min-height where text can wrap; verify long translations, narrow widths, zoom and relevant RTL before accepting the tuple.

### State width policy

| Policy | Use when | Contract |
|---|---|---|
| **Stable footprint (default)** | Submit actions, dense toolbars, adjacent click targets | Retain label/slot dimensions during pending; overlay feedback without shifting neighboring actions |
| **Measured morph (explicit exception)** | A status control deliberately changes size and has room | Measure intrinsic content, constrain width to available space, reserve a stable surrounding action region, and animate the shell without scaling text |

An intentional morph is not an accidental loading shift. State the policy before implementation. Both policies preserve the accessible action name while pending, expose busy/status semantics, prevent duplicate actions, retarget on rapid state changes, and retain a usable instant reduced-motion endpoint. A changed action may have a new accessible name; do not announce every animated letter. Verify final labels and focus, not just the shell animation. Report a measured morph as an explicit geometry exception in the existing Conventions check, with rendered evidence; it does not waive optical inspection.

### Button content geometry

Keep button content as one stable inline layout. Outer inline padding is symmetric and tokenized; the gap and icon size also come from control tokens. Logical `start`/`end` slots preserve reading-order semantics in both LTR and RTL.

```tsx
type ButtonContentProps = {
  pending?: boolean
} & (
  | { iconOnly: true; icon: React.ReactNode; children?: never; iconPosition?: never }
  | { iconOnly?: false; children: React.ReactNode; icon?: React.ReactNode; iconPosition?: "start" | "end" }
)

export function ButtonContent({
  children,
  icon,
  iconOnly = false,
  iconPosition = "start",
  pending = false,
}: ButtonContentProps) {
  const iconSlot = icon ? (
    <span
      aria-hidden
      className="inline-flex size-[--control-icon-size] shrink-0 items-center justify-center"
    >
      {icon}
    </span>
  ) : null

  return (
    <span className="relative inline-flex items-center justify-center gap-[--control-gap] px-[--control-padding-inline]">
      <span className={pending ? "inline-flex items-center gap-[--control-gap] opacity-0" : "inline-flex items-center gap-[--control-gap]"}>
        {iconPosition === "start" && iconSlot}
        {!iconOnly && <span>{children}</span>}
        {iconPosition === "end" && iconSlot}
      </span>
      {pending && <span className="absolute inset-0 inline-flex items-center justify-center"><Spinner aria-hidden /></span>}
    </span>
  )
}
```

The fixed `shrink-0` icon slot prevents glyph bounds from changing the gap. `iconOnly` omits the label node entirely, so no empty flex item creates a gap; its accessible name belongs on the outer `<button>` via `aria-label`, not on this presentational content wrapper. The outer button must set `aria-busy={pending}` and preserve its accessible name while pending. `opacity-0` retains labeled content in both layout and the accessibility tree while the overlaid spinner stays `aria-hidden`; if progress needs an announcement, provide a separate status/live region. Replacing or accessibility-hiding the label can lose its name as well as shift width. Apply optical correction only inside the icon wrapper or glyph, and only after rendered evidence shows a mismatch. In RTL, keep the API and layout expressed as `start`/`end`, not physical left/right.

### Good: Token-based, focused

```tsx
import { Button } from "@/components/ui/button"

export function SubmitButton({ isLoading }: { isLoading: boolean }) {
  return (
    <Button 
      type="submit" 
      disabled={isLoading}
      aria-busy={isLoading}
      className="bg-[hsl(var(--primary))] text-[hsl(var(--primary-foreground))]"
    >
      <ButtonContent pending={isLoading}>Submit</ButtonContent>
    </Button>
  )
}
```

### Bad: Over-configured, raw colors

```tsx
export function SubmitButton({ 
  variant, 
  size, 
  color, 
  gradient,
  shadow,
  rounded 
}: SubmitButtonProps) {
  return (
    <button
      className={`px-4 py-2 bg-purple-600 text-white rounded-2xl shadow-lg 
        ${gradient ? 'bg-gradient-to-r from-purple-600 to-indigo-600' : ''}`}
    >
      Submit
    </button>
  )
}
```

## Card

Choose one inset/gap density for the card family (for example 16px compact or 24px relaxed only if those project tokens fit). Separate header, content and action regions; do not repeat the entire card padding inside each nested child. Radius/inset geometry is owned by `design-surfaces.md`, not by the padding example.

### Good: Composable, token-based

```tsx
import { Card, CardHeader, CardTitle, CardContent } from "@/components/ui/card"

export function TaskCard({ task }: { task: Task }) {
  return (
    <Card className="border-[hsl(var(--border))]">
      <CardHeader>
        <CardTitle className="text-[hsl(var(--foreground))]">
          {task.title}
        </CardTitle>
      </CardHeader>
      <CardContent>
        <p className="text-[hsl(var(--muted-foreground))]">
          {task.description}
        </p>
      </CardContent>
    </Card>
  )
}
```

### Bad: Over-configured, no tokens

```tsx
export function TaskCard({ 
  title, 
  description, 
  variant, 
  shadow, 
  border,
  padding 
}: TaskCardProps) {
  return (
    <div className="p-8 bg-white rounded-2xl shadow-xl border border-gray-200">
      <h3 className="text-xl font-bold text-gray-900">{title}</h3>
      <p className="text-gray-600 mt-2">{description}</p>
    </div>
  )
}
```

## Input

### Good: Accessible, token-based

```tsx
import { Input } from "@/components/ui/input"
import { Label } from "@/components/ui/label"

export function EmailField() {
  return (
    <div className="space-y-2">
      <Label 
        htmlFor="email" 
        className="text-[hsl(var(--foreground))]"
      >
        Email
      </Label>
      <Input
        id="email"
        type="email"
        placeholder="Enter your email"
        className="border-[hsl(var(--input))] focus:ring-[hsl(var(--ring))]"
      />
    </div>
  )
}
```

### Bad: No label, raw colors

```tsx
export function EmailField() {
  return (
    <div>
      <input
        type="email"
        placeholder="Enter your email"
        className="p-3 border border-gray-300 rounded-2xl focus:ring-2 focus:ring-purple-500"
      />
    </div>
  )
}
```

## List

### Good: Separated data/presentation, accessible

```tsx
import { List, ListItem } from "@/components/ui/list"

// Container: handles data
export function TaskListContainer() {
  const { tasks, isLoading, error } = useTasks()

  if (isLoading) return <TaskListSkeleton />
  if (error) return <ErrorState message="Failed to load tasks" retry={refetch} />
  if (tasks.length === 0) return <EmptyState message="No tasks yet" />

  return <TaskList tasks={tasks} />
}

// Presentation: handles rendering
export function TaskList({ tasks }: { tasks: Task[] }) {
  return (
    <List role="list" className="divide-y divide-[hsl(var(--border))]">
      {tasks.map(task => (
        <ListItem key={task.id}>
          <TaskItem task={task} />
        </ListItem>
      ))}
    </List>
  )
}
```

### Bad: Mixed concerns, no states

```tsx
export function TaskList() {
  const [tasks, setTasks] = useState([])
  
  useEffect(() => {
    fetchTasks().then(setTasks)
  }, [])

  return (
    <div className="space-y-4">
      {tasks.map(task => (
        <div key={task.id} className="p-4 bg-white rounded-2xl shadow-lg">
          <h3 className="font-bold">{task.title}</h3>
        </div>
      ))}
    </div>
  )
}
```

## Dialog

### Good: Focus management, accessible

```tsx
import { Dialog, DialogContent, DialogHeader, DialogTitle } from "@/components/ui/dialog"

export function ConfirmDialog({ isOpen, onClose, onConfirm }: ConfirmDialogProps) {
  const confirmRef = useRef<HTMLButtonElement>(null)

  useEffect(() => {
    if (isOpen) confirmRef.current?.focus()
  }, [isOpen])

  return (
    <Dialog open={isOpen} onOpenChange={onClose}>
      <DialogContent className="border-[hsl(var(--border))]">
        <DialogHeader>
          <DialogTitle className="text-[hsl(var(--foreground))]">
            Confirm Action
          </DialogTitle>
        </DialogHeader>
        <p className="text-[hsl(var(--muted-foreground))]">
          Are you sure you want to proceed?
        </p>
        <div className="flex justify-end gap-3">
          <Button variant="outline" onClick={onClose}>
            Cancel
          </Button>
          <Button ref={confirmRef} onClick={onConfirm}>
            Confirm
          </Button>
        </div>
      </DialogContent>
    </Dialog>
  )
}
```

### Bad: No focus management, raw colors

```tsx
export function ConfirmDialog({ isOpen, onClose, onConfirm }: ConfirmDialogProps) {
  if (!isOpen) return null

  return (
    <div className="fixed inset-0 bg-black/50 flex items-center justify-center">
      <div className="bg-white p-6 rounded-2xl shadow-2xl max-w-md">
        <h2 className="text-xl font-bold mb-4">Confirm Action</h2>
        <p className="text-gray-600 mb-6">Are you sure you want to proceed?</p>
        <div className="flex justify-end gap-3">
          <button onClick={onClose} className="px-4 py-2 text-gray-600">
            Cancel
          </button>
          <button onClick={onConfirm} className="px-4 py-2 bg-purple-600 text-white rounded-xl">
            Confirm
          </button>
        </div>
      </div>
    </div>
  )
}
```

## Table

### Good: Semantic, accessible

```tsx
import { Table, TableBody, TableCell, TableHead, TableHeader, TableRow } from "@/components/ui/table"

export function TaskTable({ tasks }: { tasks: Task[] }) {
  return (
    <Table>
      <TableHeader>
        <TableRow className="border-[hsl(var(--border))]">
          <TableHead className="text-[hsl(var(--muted-foreground))]">Task</TableHead>
          <TableHead className="text-[hsl(var(--muted-foreground))]">Status</TableHead>
          <TableHead className="text-[hsl(var(--muted-foreground))]">Due Date</TableHead>
        </TableRow>
      </TableHeader>
      <TableBody>
        {tasks.map(task => (
          <TableRow key={task.id} className="border-[hsl(var(--border))]">
            <TableCell className="font-medium text-[hsl(var(--foreground))]">
              {task.title}
            </TableCell>
            <TableCell className="text-[hsl(var(--muted-foreground))]">
              {task.status}
            </TableCell>
            <TableCell className="text-[hsl(var(--muted-foreground))]">
              {task.dueDate}
            </TableCell>
          </TableRow>
        ))}
      </TableBody>
    </Table>
  )
}
```

### Bad: No semantic HTML, raw colors

```tsx
export function TaskTable({ tasks }: { tasks: Task[] }) {
  return (
    <div className="overflow-x-auto">
      <table className="w-full">
        <thead>
          <tr className="bg-gray-100">
            <th className="p-3 text-left text-gray-700">Task</th>
            <th className="p-3 text-left text-gray-700">Status</th>
            <th className="p-3 text-left text-gray-700">Due Date</th>
          </tr>
        </thead>
        <tbody>
          {tasks.map(task => (
            <tr key={task.id} className="border-b border-gray-200">
              <td className="p-3 font-medium text-gray-900">{task.title}</td>
              <td className="p-3 text-gray-600">{task.status}</td>
              <td className="p-3 text-gray-600">{task.dueDate}</td>
            </tr>
          ))}
        </tbody>
      </table>
    </div>
  )
}
```

## Skeleton Loading

### Good: Semantic, accessible

```tsx
import { Skeleton } from "@/components/ui/skeleton"

export function TaskListSkeleton() {
  return (
    <div className="space-y-3" aria-busy="true" aria-label="Loading tasks">
      {Array.from({ length: 3 }).map((_, i) => (
        <div key={i} className="flex items-center gap-3 p-3">
          <Skeleton className="h-4 w-4 rounded" />
          <Skeleton className="h-4 flex-1" />
          <Skeleton className="h-8 w-8 rounded" />
        </div>
      ))}
    </div>
  )
}
```

### Bad: No accessibility, raw colors

```tsx
export function TaskListSkeleton() {
  return (
    <div className="space-y-3">
      {Array.from({ length: 3 }).map((_, i) => (
        <div key={i} className="flex items-center gap-3 p-3 animate-pulse">
          <div className="h-4 w-4 bg-gray-200 rounded" />
          <div className="h-4 flex-1 bg-gray-200 rounded" />
          <div className="h-8 w-8 bg-gray-200 rounded-xl" />
        </div>
      ))}
    </div>
  )
}
```

## Empty State

### Good: Helpful, token-based

```tsx
import { Box } from "reicon-react"
import { Button } from "@/components/ui/button"

export function EmptyState({ message, onAction }: EmptyStateProps) {
  return (
    <div role="status" className="text-center py-12">
      <Box
        size={48}
        className="mx-auto text-[hsl(var(--muted-foreground))]"
        aria-hidden
      />
      <h3 className="mt-2 text-sm font-medium text-[hsl(var(--foreground))]">
        {message}
      </h3>
      <p className="mt-1 text-sm text-[hsl(var(--muted-foreground))]">
        Get started by creating a new item.
      </p>
      <Button className="mt-4" onClick={onAction}>
        Create Item
      </Button>
    </div>
  )
}
```

### Bad: No accessibility, raw colors

```tsx
export function EmptyState({ message, onAction }: EmptyStateProps) {
  return (
    <div className="text-center py-12">
      <svg className="mx-auto h-12 w-12 text-gray-400" />
      <h3 className="mt-2 text-sm font-medium text-gray-900">{message}</h3>
      <p className="mt-1 text-sm text-gray-500">Get started by creating a new item.</p>
      <button onClick={onAction} className="mt-4 px-4 py-2 bg-purple-600 text-white rounded-xl">
        Create Item
      </button>
    </div>
  )
}
```

## Responsive Layout

### Good: Mobile-first, token-based

```tsx
export function DashboardLayout({ children }: { children: React.ReactNode }) {
  return (
    <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-4 p-4 sm:p-6 lg:p-8">
      {children}
    </div>
  )
}
```

### Bad: Desktop-first, fixed widths

```tsx
export function DashboardLayout({ children }: { children: React.ReactNode }) {
  return (
    <div className="flex flex-wrap justify-center gap-4 p-8">
      <div className="w-96">{children}</div>
    </div>
  )
}
```

## Text in flex / truncation

Flex children that truncate need `min-w-0` (or equivalent) or text won’t shrink:

```tsx
<div className="flex items-center gap-2">
  <span className="min-w-0 flex-1 truncate">{title}</span>
  <Button size="sm">Edit</Button>
</div>
```

## Destructive actions

- Confirm irreversible deletes (dialog) **or** soft-delete with undo
- State consequences clearly (“Deletes 5 files permanently”)
- Use destructive token color + distinct styling — never rely on color alone
- Keep a non-destructive cancel/back path

## Select / filter (product UI)

### Good: Custom trigger + menu

```tsx
<button type="button" className="select-trigger" aria-haspopup="listbox" aria-expanded={open}>
  <span className="truncate">{label}</span>
  <ChevronDown className="ml-3 shrink-0 text-muted-foreground" />
</button>
```

- Token border/background; **gap + end padding** so the caret is not flush to the edge
- Listbox/menu with selected + hover states; Escape / outside click

### Bad: Bare native OS chrome for dashboard filters

```html
<select class="w-full"><!-- OS picker, cramped caret, inconsistent chrome --></select>
```

Native `<select>` only with an explicit waiver (e.g. required OS picker on mobile).
