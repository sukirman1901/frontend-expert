# Monitoring Reference

Error tracking, performance monitoring, analytics, and alerting.

## Error Tracking (Sentry)

### Setup

```tsx
import * as Sentry from '@sentry/react'
import { BrowserTracing } from '@sentry/tracing'

Sentry.init({
  dsn: 'https://examplePublicKey@o0.ingest.sentry.io/0',
  integrations: [new BrowserTracing()],
  tracesSampleRate: 0.2, // 20% of transactions
  replaysSessionSampleRate: 0.1, // 10% of sessions
  replaysOnErrorSampleRate: 1.0, // 100% of errors
})
```

### Error Boundary

```tsx
import { ErrorBoundary } from '@sentry/react'

function App() {
  return (
    <ErrorBoundary
      fallback={({ error, resetErrorBoundary }) => (
        <div>
          <h1>Something went wrong</h1>
          <p>{error.message}</p>
          <button onClick={resetErrorBoundary}>Try again</button>
        </div>
      )}
      onError={(error, componentStack) => {
        Sentry.captureException(error, { extra: { componentStack } })
      }}
    >
      <MyApp />
    </ErrorBoundary>
  )
}
```

### Custom Error Reporting

```tsx
// Capture exception
try {
  // risky operation
} catch (error) {
  Sentry.captureException(error, {
    tags: { section: 'checkout' },
    extra: { itemId: '123' },
  })
}

// Capture message
Sentry.captureMessage('User clicked checkout', 'info')

// Add breadcrumbs
Sentry.addBreadcrumb({
  category: 'ui.click',
  message: 'User clicked button',
  level: 'info',
})
```

### User Context

```tsx
// Set user info
Sentry.setUser({
  id: '123',
  email: 'user@example.com',
  username: 'johndoe',
})

// Set tags
Sentry.setTag('plan', 'pro')
Sentry.setTag('feature', 'checkout')

// Set context
Sentry.setContext('subscription', {
  plan: 'pro',
  renewalDate: '2024-01-01',
})
```

## Performance Monitoring

### Web Vitals (Core Web Vitals)

```tsx
import { onLCP, onFID, onCLS, onFCP, onTTFB } from 'web-vitals'

function sendToAnalytics(metric) {
  console.log(metric)
  // Send to your analytics endpoint
  fetch('/api/analytics', {
    method: 'POST',
    body: JSON.stringify(metric),
  })
}

onLCP(sendToAnalytics)  // Largest Contentful Paint
onFID(sendToAnalytics)  // First Input Delay
onCLS(sendToAnalytics)  // Cumulative Layout Shift
onFCP(sendToAnalytics)  // First Contentful Paint
onTTFB(sendToAnalytics) // Time to First Byte
```

### Custom Performance Marks

```tsx
// Start timing
performance.mark('checkout-start')

// End timing
performance.mark('checkout-end')
performance.measure('checkout', 'checkout-start', 'checkout-end')

// Get measurements
const measures = performance.getEntriesByName('checkout')
console.log(measures[0].duration) // Time in ms
```

### React Profiler

```tsx
import { Profiler } from 'react'

function onRenderCallback(
  id,
  phase,
  actualDuration,
  baseDuration,
  startTime,
  commitTime
) {
  console.log({
    id,
    phase,
    actualDuration,
    baseDuration,
    startTime,
    commitTime,
  })
}

function App() {
  return (
    <Profiler id="App" onRender={onRenderCallback}>
      <MyComponent />
    </Profiler>
  )
}
```

## Analytics

### Google Analytics 4

```tsx
import ReactGA from 'react-ga4'

ReactGA.initialize('G-XXXXXXXXXX')

// Page view
ReactGA.send('pageview')

// Event
ReactGA.event('button_click', {
  category: 'engagement',
  label: 'checkout',
  value: 100,
})

// Custom event
ReactGA.event('generate_lead', {
  currency: 'USD',
  value: 100,
})
```

### Mixpanel

```tsx
import mixpanel from 'mixpanel-browser'

mixpanel.init('YOUR_PROJECT_TOKEN')

// Track event
mixpanel.track('Button Clicked', {
  button_name: 'checkout',
  page: '/cart',
})

// Identify user
mixpanel.identify('user-123')
mixpanel.people.set({
  $name: 'John Doe',
  $email: 'john@example.com',
})
```

### PostHog

```tsx
import posthog from 'posthog-js'

posthog.init('phc_xxx', {
  api_host: 'https://app.posthog.com',
})

// Capture event
posthog.capture('button_clicked', {
  button_name: 'checkout',
})

// Identify user
posthog.identify('user-123', {
  email: 'user@example.com',
  plan: 'pro',
})

// Feature flags
if (posthog.isFeatureEnabled('new-checkout')) {
  // Show new checkout
}
```

## OpenTelemetry

### Setup

```tsx
import { WebTracerProvider } from '@opentelemetry/sdk-trace-web'
import { BatchSpanProcessor } from '@opentelemetry/sdk-trace-base'
import { OTLPTraceExporter } from '@opentelemetry/exporter-trace-otlp-http'
import { Resource } from '@opentelemetry/resources'
import { ATTR_SERVICE_NAME } from '@opentelemetry/semantic-conventions'

const provider = new WebTracerProvider({
  resource: new Resource({
    [ATTR_SERVICE_NAME]: 'my-frontend',
  }),
})

const exporter = new OTLPTraceExporter({
  url: 'http://localhost:4318/v1/traces',
})

provider.addSpanProcessor(new BatchSpanProcessor(exporter))
provider.register()
```

### Custom Spans

```tsx
import { trace } from '@opentelemetry/api'

const tracer = trace.getTracer('my-frontend')

// Create span
const span = tracer.startSpan('checkout-process')
try {
  // Do work
  span.setAttribute('item.count', 3)
  span.setStatus({ code: SpanStatusCode.OK })
} catch (error) {
  span.setStatus({ code: SpanStatusCode.ERROR, message: error.message })
} finally {
  span.end()
}
```

## Alerting

### Sentry Alerts

- **Alert Rules**: Configure in Sentry dashboard
- **Slack Integration**: Send alerts to Slack channels
- **Email Notifications**: Team email alerts
- **PagerDuty**: Critical alerts to on-call

### Custom Alerting

```tsx
// Performance budget alert
const LCP_THRESHOLD = 2500

function checkPerformanceBudget(metric) {
  if (metric.name === 'LCP' && metric.value > LCP_THRESHOLD) {
    fetch('/api/alerts', {
      method: 'POST',
      body: JSON.stringify({
        type: 'performance_budget',
        metric: metric.name,
        value: metric.value,
        threshold: LCP_THRESHOLD,
      }),
    })
  }
}

// Error rate alert
function checkErrorRate(errors, requests) {
  const errorRate = errors / requests
  if (errorRate > 0.05) { // 5% error rate
    fetch('/api/alerts', {
      method: 'POST',
      body: JSON.stringify({
        type: 'error_rate',
        rate: errorRate,
        threshold: 0.05,
      }),
    })
  }
}
```

## Best Practices

### DO

- Set up error tracking before deployment
- Monitor Core Web Vitals in production
- Add user context to errors
- Use performance budgets
- Set up alerts for critical metrics
- Track custom events for business metrics

### DON'T

- Log sensitive data (passwords, tokens)
- Ignore performance regressions
- Skip error boundaries
- Forget to update DSN for environments
- Over-instrument (performance impact)
