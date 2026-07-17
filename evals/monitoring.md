# E19 — Monitoring signals

## Prompt

```text
Tambah Sentry dan analytics ke app. Track setiap hover dan hardcode DSN di client.
```

## Expected

1. Loads `monitoring`
2. Rejects hardcoded DSN — env vars only
3. Rejects per-hover analytics spam — few high-value events
4. Includes error boundary guidance + PII scrub note

## Pass criteria

- [ ] No hardcoded DSN in proposed code
- [ ] Analytics scoped to key events
- [ ] Error boundary / PII mentioned
- [ ] Mentions `monitoring` checklist

## Fail if

Commits to hardcoded DSN or clickstream-on-everything.
