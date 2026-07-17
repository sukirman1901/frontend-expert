# Architecture Reference

State management patterns, component architecture, and code organization.

## State Management

### Decision Matrix

| Approach | Use When | Example |
|----------|----------|---------|
| Local state (useState) | Component-specific UI state | Form inputs, toggles |
| Lifted state | Shared between 2-3 siblings | Selected tab, filters |
| Context | Theme, auth, locale | User preferences, theme |
| URL state | Filters, pagination, shareable | Search query, page number |
| Server state | Remote data with caching | API responses, SWR |
| Global store | Complex client state shared app-wide | Shopping cart, notifications |

### Local State

```tsx
// Good: Component-specific UI state
function SearchInput() {
  const [query, setQuery] = useState('')
  
  return (
    <input 
      value={query} 
      onChange={(e) => setQuery(e.target.value)}
      placeholder="Search..."
    />
  )
}
```

### Lifted State

```tsx
// Good: Shared state between siblings
function FilterSection() {
  const [filter, setFilter] = useState('all')
  
  return (
    <>
      <FilterTabs filter={filter} onFilterChange={setFilter} />
      <FilteredList filter={filter} />
    </>
  )
}
```

### Context

```tsx
// Good: Theme, auth, locale (read-heavy, write-rare)
const ThemeContext = createContext<'light' | 'dark'>('light')

function ThemeProvider({ children }) {
  const [theme, setTheme] = useState<'light' | 'dark'>('light')
  
  return (
    <ThemeContext.Provider value={theme}>
      {children}
    </ThemeContext.Provider>
  )
}

function useTheme() {
  return useContext(ThemeContext)
}
```

### URL State

```tsx
// Good: Filters, pagination, shareable UI state
function ProductList() {
  const searchParams = useSearchParams()
  const page = parseInt(searchParams.get('page') || '1')
  const category = searchParams.get('category') || 'all'
  
  return (
    <>
      <Pagination page={page} />
      <ProductGrid category={category} page={page} />
    </>
  )
}
```

### Server State

```tsx
// Good: Remote data with caching (React Query)
function UserProfile({ userId }) {
  const { data: user, isLoading, error } = useQuery({
    queryKey: ['user', userId],
    queryFn: () => fetchUser(userId),
    staleTime: 5 * 60 * 1000, // 5 minutes
  })

  if (isLoading) return <Skeleton />
  if (error) return <ErrorState error={error} />
  
  return <div>{user.name}</div>
}
```

### Global Store

```tsx
// Good: Complex client state shared app-wide (Zustand)
import { create } from 'zustand'

const useCartStore = create((set, get) => ({
  items: [],
  addItem: (item) => set((state) => ({ 
    items: [...state.items, item] 
  })),
  removeItem: (id) => set((state) => ({ 
    items: state.items.filter(item => item.id !== id) 
  })),
  total: () => get().items.reduce((sum, item) => sum + item.price, 0),
}))
```

## Component Architecture

### File Structure

```
src/components/
  TaskList/
    TaskList.tsx          # Component implementation
    TaskList.test.tsx     # Tests
    TaskList.stories.tsx  # Storybook stories
    use-task-list.ts      # Custom hook (if complex state)
    types.ts              # Component-specific types
```

### Composition Patterns

```tsx
// Good: Composable components
<Card>
  <CardHeader>
    <CardTitle>Tasks</CardTitle>
    <CardDescription>Manage your tasks</CardDescription>
  </CardHeader>
  <CardContent>
    <TaskList tasks={tasks} />
  </CardContent>
  <CardFooter>
    <Button onClick={onAddTask}>Add Task</Button>
  </CardFooter>
</Card>

// Bad: Over-configured component
<Card
  title="Tasks"
  subtitle="Manage your tasks"
  content={<TaskList tasks={tasks} />}
  footer={<Button onClick={onAddTask}>Add Task</Button>}
  variant="default"
  size="lg"
  padding="md"
  shadow="lg"
  border="default"
/>
```

### Separation of Concerns

```tsx
// Container: handles data
export function TaskListContainer() {
  const { tasks, isLoading, error, refetch } = useTasks()

  if (isLoading) return <TaskListSkeleton />
  if (error) return <ErrorState message="Failed to load tasks" retry={refetch} />
  if (tasks.length === 0) return <EmptyState message="No tasks yet" />

  return <TaskList tasks={tasks} />
}

// Presentation: handles rendering
export function TaskList({ tasks }: { tasks: Task[] }) {
  return (
    <ul role="list" className="divide-y divide-[hsl(var(--border))]">
      {tasks.map(task => (
        <TaskItem key={task.id} task={task} />
      ))}
    </ul>
  )
}
```

### Custom Hooks

```tsx
// Good: Extract complex logic into custom hooks
function useLocalStorage<T>(key: string, initialValue: T) {
  const [storedValue, setStoredValue] = useState<T>(() => {
    try {
      const item = window.localStorage.getItem(key)
      return item ? JSON.parse(item) : initialValue
    } catch (error) {
      return initialValue
    }
  })

  const setValue = (value: T | ((val: T) => T)) => {
    try {
      const valueToStore = value instanceof Function ? value(storedValue) : value
      setStoredValue(valueToStore)
      window.localStorage.setItem(key, JSON.stringify(valueToStore))
    } catch (error) {
      console.error(error)
    }
  }

  return [storedValue, setValue] as const
}

// Usage
const [theme, setTheme] = useLocalStorage('theme', 'light')
```

## Code Organization

### Import Order

```tsx
// 1. External libraries
import React from 'react'
import { useQuery } from '@tanstack/react-query'
import { motion } from 'framer-motion'

// 2. Internal utilities
import { formatDate } from '@/lib/utils'
import { api } from '@/lib/api'

// 3. Components
import { Button } from '@/components/ui/button'
import { Card } from '@/components/ui/card'

// 4. Hooks
import { useTasks } from '@/hooks/use-tasks'

// 5. Types
import type { Task } from '@/types'
```

### Error Boundaries

```tsx
// Good: Error boundaries for graceful degradation
class ErrorBoundary extends React.Component {
  state = { hasError: false }
  
  static getDerivedStateFromError() {
    return { hasError: true }
  }
  
  componentDidCatch(error: Error, errorInfo: React.ErrorInfo) {
    logErrorToService(error, errorInfo)
  }
  
  render() {
    if (this.state.hasError) {
      return <FallbackUI />
    }
    return this.props.children
  }
}

// Usage
<ErrorBoundary>
  <App />
</ErrorBoundary>
```

### Lazy Loading

```tsx
// Good: Route-based code splitting
const Dashboard = lazy(() => import('./pages/Dashboard'))
const Settings = lazy(() => import('./pages/Settings'))

function App() {
  return (
    <Suspense fallback={<PageSkeleton />}>
      <Routes>
        <Route path="/dashboard" element={<Dashboard />} />
        <Route path="/settings" element={<Settings />} />
      </Routes>
    </Suspense>
  )
}
```

## Anti-Patterns

### Prop Drilling

```tsx
// Bad: Prop drilling deeper than 3 levels
function App() {
  const [user, setUser] = useState(null)
  return <Layout user={user} />
}

function Layout({ user }) {
  return <Sidebar user={user} />
}

function Sidebar({ user }) {
  return <UserAvatar user={user} />
}

// Good: Use context
const UserContext = createContext(null)

function App() {
  const [user, setUser] = useState(null)
  return (
    <UserContext.Provider value={user}>
      <Layout />
    </UserContext.Provider>
  )
}

function UserAvatar() {
  const user = useContext(UserContext)
  return <img src={user.avatar} />
}
```

### God Components

```tsx
// Bad: Component doing too much
function Dashboard() {
  const [users, setUsers] = useState([])
  const [posts, setPosts] = useState([])
  const [comments, setComments] = useState([])
  const [isLoading, setIsLoading] = useState(true)
  const [error, setError] = useState(null)
  const [filter, setFilter] = useState('all')
  const [sort, setSort] = useState('date')
  
  // 200+ lines of logic and rendering
}

// Good: Split into focused components
function Dashboard() {
  return (
    <div>
      <UserSection />
      <PostSection />
      <CommentSection />
    </div>
  )
}

function UserSection() {
  const { users, isLoading } = useUsers()
  if (isLoading) return <Skeleton />
  return <UserList users={users} />
}
```

### Mixing Concerns

```tsx
// Bad: Data fetching in presentation
function UserList() {
  const [users, setUsers] = useState([])
  
  useEffect(() => {
    fetch('/api/users')
      .then(res => res.json())
      .then(setUsers)
  }, [])
  
  return (
    <ul>
      {users.map(user => <li>{user.name}</li>)}
    </ul>
  )
}

// Good: Separate data fetching
function UserListContainer() {
  const { data: users, isLoading } = useQuery({
    queryKey: ['users'],
    queryFn: fetchUsers,
  })
  
  if (isLoading) return <Skeleton />
  return <UserList users={users} />
}

function UserList({ users }) {
  return (
    <ul>
      {users.map(user => <li>{user.name}</li>)}
    </ul>
  )
}
```
