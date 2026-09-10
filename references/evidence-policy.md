# Evidence policy

Use this policy whenever a skill states a rule that could be mistaken for universal truth.

## Classes

| Class | Authority | Required handling |
|---|---|---|
| **Standard** | Formal specification | Cite current primary source and scope |
| **Product requirement** | User, legal, brand, product | Follow unless unsafe or contradictory |
| **Project default** | Existing tokens/components/conventions | Preserve unless the task changes it |
| **Enterprise pattern** | Mature production design systems | Compare contexts; do not copy blindly |
| **Recommendation** | Broad evidence and low-risk default | State important exceptions |
| **Heuristic** | Useful starting value or craft rule | Verify in the rendered context |
| **Inspiration** | Creative reference | Extract attributes; never treat as compliance |
| **Waiver** | Deliberate exception | Record reason and affected scope |

## Source precedence

1. Explicit user and product requirements
2. Existing project design system
3. W3C, WHATWG, WAI-ARIA, WCAG, TC39, and other formal specifications
4. Current official framework or library documentation
5. Enterprise design systems and established UX research
6. Craft references and licensed skill repositories
7. Behance, Awwwards, Mobbin, and other inspiration galleries

Higher rank does not make an unrelated source applicable. A CSS specification defines browser geometry; it does not choose a product's visual personality.

## Provenance block

For high-risk or numeric guidance, record:

```yaml
principle: <name>
classification: <class>
recommendation: <claim>
applies_when: [<conditions>]
exceptions: [<exceptions>]
verification: [<rendered, automated, or manual checks>]
sources: [<primary first>]
last_verified: YYYY-MM
```

## Rules

- Never promote a blog recipe, design-system choice, or gallery trend into a MUST.
- Never claim visual success from source inspection when runtime rendering decides it.
- Use current primary documentation for version-sensitive APIs and standards.
- When sources disagree, document the differing contexts and let product constraints decide.
- Preserve attribution and license notices for substantially adapted material.
