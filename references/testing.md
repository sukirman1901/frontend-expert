# Testing Reference

Test strategy, TDD, E2E testing, and visual regression.

## Test Strategy

### Test Pyramid

```
        /\
       /  \        E2E Tests (5%)
      /    \       Critical user flows
     /------\
    /        \     Integration Tests (15%)
   /          \    User flows, API integration
  /------------\
 /              \  Unit Tests (80%)
/                \ Components, utilities, hooks
```

### What to Test

| Level | What | Tool | Speed |
|-------|------|------|-------|
| Unit | Components, utilities, hooks | Jest, Vitest | Fast |
| Integration | User flows, API calls | Testing Library | Medium |
| E2E | Critical paths | Playwright, Cypress | Slow |
| Visual | UI changes | Chromatic, Percy | Medium |

## Test-Driven Development (TDD)

### Red-Green-Refactor

1. **Red:** Write a failing test
2. **Green:** Write minimum code to pass
3. **Refactor:** Improve code while tests pass

### Example

```tsx
// Red: Write failing test
describe('TaskItem', () => {
  it('should display task title', () => {
    render(<TaskItem task={{ id: 1, title: 'Buy milk', done: false }} />)
    expect(screen.getByText('Buy milk')).toBeInTheDocument()
  })
})

// Green: Write minimum code
function TaskItem({ task }) {
  return <li>{task.title}</li>
}

// Refactor: Improve code
function TaskItem({ task }: { task: Task }) {
  return (
    <li className="flex items-center gap-3 p-3">
      <span>{task.title}</span>
    </li>
  )
}
```

## Unit Testing

### Component Testing

```tsx
import { render, screen, fireEvent } from '@testing-library/react'
import { TaskItem } from './TaskItem'

describe('TaskItem', () => {
  it('should render task title', () => {
    render(<TaskItem task={{ id: 1, title: 'Buy milk', done: false }} />)
    expect(screen.getByText('Buy milk')).toBeInTheDocument()
  })

  it('should call onToggle when checkbox clicked', () => {
    const onToggle = jest.fn()
    render(
      <TaskItem 
        task={{ id: 1, title: 'Buy milk', done: false }} 
        onToggle={onToggle} 
      />
    )
    
    fireEvent.click(screen.getByRole('checkbox'))
    expect(onToggle).toHaveBeenCalledWith(1)
  })

  it('should show completed state', () => {
    render(<TaskItem task={{ id: 1, title: 'Buy milk', done: true }} />)
    expect(screen.getByText('Buy milk')).toHaveClass('line-through')
  })
})
```

### Hook Testing

```tsx
import { renderHook, act } from '@testing-library/react'
import { useCounter } from './use-counter'

describe('useCounter', () => {
  it('should initialize with default value', () => {
    const { result } = renderHook(() => useCounter(0))
    expect(result.current.count).toBe(0)
  })

  it('should increment', () => {
    const { result } = renderHook(() => useCounter(0))
    
    act(() => {
      result.current.increment()
    })
    
    expect(result.current.count).toBe(1)
  })

  it('should decrement', () => {
    const { result } = renderHook(() => useCounter(0))
    
    act(() => {
      result.current.decrement()
    })
    
    expect(result.current.count).toBe(-1)
  })
})
```

### Utility Testing

```tsx
import { formatDate, truncate } from './utils'

describe('formatDate', () => {
  it('should format date correctly', () => {
    const date = new Date('2024-01-15')
    expect(formatDate(date)).toBe('January 15, 2024')
  })

  it('should handle invalid date', () => {
    expect(formatDate(null)).toBe('')
  })
})

describe('truncate', () => {
  it('should truncate long text', () => {
    expect(truncate('Hello World', 5)).toBe('Hello...')
  })

  it('should not truncate short text', () => {
    expect(truncate('Hi', 5)).toBe('Hi')
  })
})
```

## Integration Testing

### User Flow Testing

```tsx
import { render, screen, waitFor } from '@testing-library/react'
import userEvent from '@testing-library/user-event'
import { QueryClient, QueryClientProvider } from '@tanstack/react-query'
import { TaskApp } from './TaskApp'

describe('TaskApp', () => {
  it('should create a new task', async () => {
    const user = userEvent.setup()
    const queryClient = new QueryClient()
    
    render(
      <QueryClientProvider client={queryClient}>
        <TaskApp />
      </QueryClientProvider>
    )

    // Type in input
    await user.type(screen.getByPlaceholderText('Add task'), 'Buy milk')
    
    // Click add button
    await user.click(screen.getByText('Add'))
    
    // Wait for task to appear
    await waitFor(() => {
      expect(screen.getByText('Buy milk')).toBeInTheDocument()
    })
  })
})
```

### API Integration Testing

```tsx
import { rest } from 'msw'
import { setupServer } from 'msw/node'
import { render, screen, waitFor } from '@testing-library/react'
import { TaskList } from './TaskList'

const server = setupServer(
  rest.get('/api/tasks', (req, res, ctx) => {
    return res(
      ctx.json([
        { id: 1, title: 'Buy milk', done: false },
        { id: 2, title: 'Walk dog', done: true },
      ])
    )
  })
)

beforeAll(() => server.listen())
afterEach(() => server.resetHandlers())
afterAll(() => server.close())

describe('TaskList', () => {
  it('should display tasks from API', async () => {
    render(<TaskList />)
    
    await waitFor(() => {
      expect(screen.getByText('Buy milk')).toBeInTheDocument()
      expect(screen.getByText('Walk dog')).toBeInTheDocument()
    })
  })

  it('should handle API error', async () => {
    server.use(
      rest.get('/api/tasks', (req, res, ctx) => {
        return res(ctx.status(500))
      })
    )
    
    render(<TaskList />)
    
    await waitFor(() => {
      expect(screen.getByText('Failed to load tasks')).toBeInTheDocument()
    })
  })
})
```

## E2E Testing

### Playwright Example

```tsx
import { test, expect } from '@playwright/test'

test('should create a task', async ({ page }) => {
  await page.goto('http://localhost:3000')
  
  // Fill in task
  await page.fill('input[placeholder="Add task"]', 'Buy milk')
  
  // Click add
  await page.click('button:text("Add")')
  
  // Verify task appears
  await expect(page.locator('text=Buy milk')).toBeVisible()
})

test('should complete a task', async ({ page }) => {
  await page.goto('http://localhost:3000')
  
  // Create task first
  await page.fill('input[placeholder="Add task"]', 'Buy milk')
  await page.click('button:text("Add")')
  
  // Click checkbox
  await page.click('input[type="checkbox"]')
  
  // Verify completed state
  await expect(page.locator('text=Buy milk')).toHaveClass('line-through')
})
```

## Accessibility Testing

### axe-core Integration

```tsx
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

describe('Form', () => {
  it('should have no accessibility violations', async () => {
    const { container } = render(
      <form>
        <label htmlFor="email">Email</label>
        <input id="email" type="email" />
      </form>
    )
    const results = await axe(container)
    expect(results).toHaveNoViolations()
  })
})
```

## Visual Regression

### Storybook + Chromatic

```tsx
// Button.stories.tsx
import type { Meta, StoryObj } from '@storybook/react'
import { Button } from './Button'

const meta: Meta<typeof Button> = {
  title: 'Components/Button',
  component: Button,
}

export default meta
type Story = StoryObj<typeof Button>

export const Primary: Story = {
  args: {
    children: 'Primary Button',
    variant: 'primary',
  },
}

export const Secondary: Story = {
  args: {
    children: 'Secondary Button',
    variant: 'secondary',
  },
}

export const Disabled: Story = {
  args: {
    children: 'Disabled Button',
    disabled: true,
  },
}
```

### Screenshot Comparison

```tsx
import { test, expect } from '@playwright/test'

test('button matches screenshot', async ({ page }) => {
  await page.goto('http://localhost:3000/storybook')
  
  // Click on Button story
  await page.click('text=Button')
  
  // Take screenshot
  await expect(page).toHaveScreenshot('button-primary.png')
})
```

## Test Best Practices

### DO

- Test behavior, not implementation
- Use `getByRole` over `getByTestId`
- Test accessibility (axe-core)
- Mock external dependencies
- Test error states
- Test loading states
- Test empty states
- Stress interactive flows when risk is high (double submit, cancel mid-open, slow 3G loading UI)

### DON'T

- Test internal state
- Test implementation details
- Use `snapshot` tests for components
- Test third-party libraries
- Write tests that depend on order
- Skip flaky tests (fix them)

## Robustness (optional depth)

For high-risk interactive surfaces, add cases from this short list (don’t boil the ocean):

- Spam click / double submit on primary async action
- Close or navigate away while opening a dialog/drawer
- Loading → error and loading → empty transitions
- Keyboard-only path for the primary task

## Test Naming

```tsx
// Good: Descriptive names
describe('TaskItem', () => {
  it('should display task title', () => {})
  it('should call onToggle when checkbox clicked', () => {})
  it('should show completed state when task is done', () => {})
})

// Bad: Vague names
describe('TaskItem', () => {
  it('works', () => {})
  it('handles click', () => {})
  it('shows state', () => {})
})
```
