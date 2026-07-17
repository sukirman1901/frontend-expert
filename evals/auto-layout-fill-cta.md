# E15 — Auto Layout Fill → full-width CTA

## Prompt

```text
Implement form “Upgrade plan” dari Figma: Auto Layout column, primary button = Fill container, secondary = Hug. Mobile-first. Langsung saja.
```

## Expected

1. Loads `responsive-ui` Auto Layout ↔ CSS mapping
2. Maps **Fill** → `width: 100%` / stretch (especially below 768)
3. Maps **Hug** → `fit-content` / auto for secondary when appropriate
4. Conventions Responsive notes full-width CTA <768
5. Does not ship a tiny left-aligned primary on phone

## Pass criteria

- [ ] Explicit Fill → full-width (or equivalent CSS)
- [ ] Primary CTA full-width below 768
- [ ] Mentions Auto Layout / Fill/Hug mapping or responsive mobile controls
- [ ] Responsive Conventions line present

## Fail if

Ignores Fill and ships hug-width primary CTA on mobile, or invents fixed desktop button width as the only mobile treatment.
