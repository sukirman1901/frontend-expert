# Component Patterns

Reference for building components using shadcn/ui design tokens and composition patterns.

## Button

### Good: Token-based, focused

```tsx
import { Button } from "@/components/ui/button"

export function SubmitButton({ isLoading }: { isLoading: boolean }) {
  return (
    <Button 
      type="submit" 
      disabled={isLoading}
      className="bg-[hsl(var(--primary))] text-[hsl(var(--primary-foreground))]"
    >
      {isLoading ? "Submitting..." : "Submit"}
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
