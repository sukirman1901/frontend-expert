---
name: monitoring
description: >-
  Frontend observability — Sentry error tracking, CWV/performance monitoring,
  analytics, OpenTelemetry, alerting. Use when adding error boundaries, tracking
  production bugs, measuring LCP/INP, wiring analytics, or ops asks about
  monitoring/observability for a web UI — not for visual design polish.
---

# Monitoring

## Overview

Ship UI with enough production signal: errors, performance, and product analytics — without boiling the ocean.

## When to use

- Add/fix Sentry (or similar) + error boundaries
- Performance monitoring / CWV in production
- Analytics events for key UI flows
- Alerting on error spikes or CWV regressions

## When to skip

- Pure visual polish (`ui-feel` / `/polish`)
- Local-only prototypes with no deploy target

## MUST (when adding observability)

| Signal | Minimum |
|--------|---------|
| **Errors** | Boundary on app shell / critical routes + reporting; scrub PII |
| **Secrets** | DSN / keys via env — never commit |
| **Sample rates** | Sane defaults for traffic (don’t 100% trace huge apps blindly) |
| **Analytics** | Few high-value events (signup, checkout, critical CTA) — not every click |
| **Alerts** | Error rate or CWV budget with a named owner |

Lab Lighthouse ≠ production monitoring — use `fe-devtools` for local audits; this skill for **shipped** signal.

## Workflow

1. **Errors** — boundary + reporting; scrub PII
2. **Performance** — sample traces; watch LCP/INP/CLS on key routes
3. **Analytics** — few high-value events, not every click
4. **Alert** — error rate / CWV budgets that someone will actually see

## Agent boundaries

- **May decide:** Vendor (Sentry vs other), which 3–5 analytics events matter
- **Must not:** Hardcode DSNs; log emails/tokens; add analytics spam on every hover

## Checklist

- [ ] Error boundary on app shell / critical routes
- [ ] DSN/env via env vars — not hardcoded secrets in git
- [ ] Sample rates sane for traffic
- [ ] No PII in events by default
- [ ] Alerts have an owner
- [ ] Key product events listed (not clickstream noise)

## Depth

Full guide: `references/monitoring.md`.  
Related: `web-performance` for build-time CWV; `fe-devtools` for lab audits.
