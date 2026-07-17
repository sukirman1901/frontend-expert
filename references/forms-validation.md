# Forms & validation

Used by: `forms-validation`.

## Structure

```text
Form
  ├─ Field (label + control + hint + error)
  ├─ Fieldset / groups when related
  └─ Actions (primary + secondary)
```

## MUST checklist (mirror skill)

- Labels associated; errors with text + `aria-describedby`
- Pending submit; keep values on error; focus first invalid
- Full-width primary <768; inputs ≥16px on mobile

## Validation timing

| Moment | Use |
|--------|-----|
| On submit | Default for most forms |
| On blur | After first submit, or for password/email confirm |
| On change | Rare — search/typeahead only |

## Error UX

- Specific (“Enter a valid email”) not “Invalid”
- Don’t clear the form on server 400
- Move focus to first invalid field on submit failure
- Announce errors to SR (`role="alert"` or live region sparingly)

## Wizard / multi-step

- Persist step data; allow back without wipe
- Show step progress
- Validate current step before next

## Anti-patterns

- Placeholder-as-label
- Errors only as red borders with no text
- `alert()` validation
- Required markers without indicating required fields in text/legend
- Bare native `<select>` for product filters/status without Conventions waiver — prefer custom select/combobox (`ui-components`)

## Related

- `data-fetching` for async submit  
- `accessibility-checklist.md`  
- `responsive.md` for stacked fields on small screens
