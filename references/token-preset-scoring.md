# Token preset scoring

Mandatory when choosing a **pack** preset. Skip when hard gates select custom mode or an explicit file.

Used by: `design-tokens` (required), `frontend-judgment` (handoff).

## Decision tree (canonical)

Run top → bottom. **First matching branch wins.** Do not reorder.

```text
                    ┌─────────────────────────────────────┐
                    │         Need a token source?        │
                    └─────────────────┬───────────────────┘
                                      │
          ┌───────────────────────────┼───────────────────────────┐
          ▼                           ▼                           ▼
   /ui --custom                 Project has                 User: keep palette /
   OR explicit custom           theme / tokens /            “jangan ganti warna”
                                shadcn CSS vars?
          │                           │                           │
          └───────────────────────────┴───────────────────────────┘
                                      │ YES
                                      ▼
                         ┌────────────────────────┐
                         │  CUSTOM MODE           │
                         │  • no pack scoring     │
                         │  • style-infer 2–3 UI  │
                         │  • apply project vars  │
                         └────────────────────────┘

                                      │ NO (no project system)
                                      ▼
                    ┌─────────────────────────────────────┐
                    │  /ui --token <file>                 │
                    │  OR user named a preset file?       │
                    └─────────────────┬───────────────────┘
                                      │ YES
                                      ▼
                         ┌────────────────────────┐
                         │  EXPLICIT PRESET       │
                         │  • use that file       │
                         │  • no scoring          │
                         │  • Conventions: path   │
                         └────────────────────────┘

                                      │ NO
                                      ▼
                    ┌─────────────────────────────────────┐
                    │  Explicit Plasma brand?             │
                    │  (#6C5CE7 / plasma.nusaiba /        │
                    │   “pakai Plasma landing”)           │
                    └─────────────────┬───────────────────┘
                                      │ YES
                                      ▼
                         ┌────────────────────────┐
                         │  HARD-GATE PRESET      │
                         │  plasma-landing.css    │
                         │  • skip full scoring   │
                         │  • note: hard-gate     │
                         └────────────────────────┘

                                      │ NO
                                      ▼
                    ┌─────────────────────────────────────┐
                    │  SCORE PATH (mandatory)             │
                    │  1. Extract signals S D E W R A I   │
                    │  2. If signals thin AND top would   │
                    │     be < 8 → ONE clarifying Q       │
                    │     (surface or accent) → rescore   │
                    │  3. Score every pack preset (0–24)  │
                    │  4. Apply penalties                 │
                    │  5. Rank; choose #1                 │
                    │  6. Runner-up if within 2 pts       │
                    │  7. Emit Token score block          │
                    │  8. Apply chosen preset             │
                    └─────────────────────────────────────┘
```

### After source is chosen (all branches)

```text
  Apply rules (HSL vs OKLCH/hex) → build UI on tokens only
  → Conventions check: Tokens: <path | project system> [(score n/24) if scored]
```

### What feeds signals (score path only)

```text
  user message
       │
       ▼
  judgment answers (density / inspiration / …)   ← if frontend-judgment ran
       │
       ▼
  DESIGN_MEMORY.md (if present)
       │
       ▼
  repo cues (copy, existing screens) — weak; default missing → neutral-ish defaults
```

Judgment does **not** pick the preset by vibe. It may set axes; **scoring** (or a hard gate) picks the file.

## Hard gates (summary)

| Priority | Condition | Action | Score? |
|----------|-----------|--------|--------|
| 1 | `--custom` / existing theme / keep palette | Custom mode + style inference | No |
| 2 | `--token <file>` / named preset | That file | No |
| 3 | Explicit Plasma brand | `plasma-landing.css` | No (note hard-gate) |
| 4 | Else | Score path below | **Yes** |

## Signal extraction

Pull signals in order: user message → judgment answers → `DESIGN_MEMORY.md` → repo cues. Default missing signals carefully (prefer `comfortable` / `restrained` / `neutral` / `soft` / `mono` / `none` — never default Accent to `violet` or `purple-brand`).

### Dimensions

| ID | Dimension | Values (pick one) | Weight |
|----|-----------|-------------------|--------|
| S | **Surface** | `tool` · `dashboard` · `data` · `landing` · `portfolio` · `consumer` · `editorial` | **3** |
| D | **Density** | `compact` · `comfortable` · `spacious` | **2** |
| E | **Expression** | `restrained` · `balanced` · `expressive` | **2** |
| W | **Warmth** | `cool` · `neutral` · `warm` | **1** |
| R | **Radius** | `sharp` · `soft` · `rounded` | **1** |
| A | **Accent** | `mono` · `blue` · `cyan` · `emerald` · `violet` · `amber` · `purple-brand` | **2** |
| I | **Inspiration** | `none` · `linear` · `stripe` · `notion` · `apple` · `vercel` · `plasma` | **1** |

Map chat shorthand → dimensions (examples):

| User / context cue | Signals |
|--------------------|---------|
| “dashboard”, admin, settings | S=`dashboard`, D=`compact`, E=`restrained`, A=`blue` |
| “data”, analytics, charts | S=`data`, D=`compact`, A=`cyan` |
| “landing”, marketing hero | S=`landing`, D=`spacious`, E=`balanced` |
| “portfolio”, creative agency | S=`portfolio`, E=`expressive`, A=`violet` |
| “friendly”, consumer, lifestyle | S=`consumer`, W=`warm`, A=`amber`, R=`rounded` |
| “editorial”, magazine, warm minimal | S=`editorial`, W=`warm`, A=`mono`, R=`sharp` |
| “minimal”, sharp, brutalist-lite | E=`restrained`, R=`sharp`, A=`mono` |
| Linear-like | I=`linear`, D=`compact`, A=`mono` or `blue` |
| Stripe-like | I=`stripe`, E=`restrained`, A=`blue` |
| Plasma / WebGL brand purple | → **hard gate** `plasma-landing` (do not only set I=`plasma`) |

## Preset affinity (0–2 per dimension)

Score a preset on each dimension: **2** = strong fit, **1** = acceptable, **0** = poor / anti-fit.

| Preset | S affinities (2) | D | E | W | R | A | I boost (2) |
|--------|------------------|---|---|---|---|---|-------------|
| `neutral-oklch.css` | tool, dashboard | compact, comfortable | restrained | cool, neutral | sharp | mono | linear, vercel, apple |
| `neutral-oklch-rounded.css` | tool, consumer | comfortable | restrained, balanced | cool, neutral | soft | mono | notion, apple |
| `stone-oklch.css` | editorial, landing | comfortable, spacious | restrained | warm | sharp | mono | stripe, apple |
| `plasma-landing.css` | landing | spacious | expressive, balanced | cool | soft | purple-brand | plasma |
| `stone-emerald.css` | tool, landing | comfortable | restrained | warm, neutral | sharp | emerald | stripe |
| `zinc-blue.css` | dashboard, tool | compact, comfortable | restrained, balanced | cool | soft | blue | linear, stripe |
| `neutral-purple.css` | portfolio | comfortable, spacious | expressive | cool, neutral | soft | violet | *(none — needs violet/portfolio cue)* |
| `slate-cyan.css` | data, dashboard | compact | restrained, balanced | cool | soft, rounded | cyan | linear |
| `rose-amber.css` | consumer | comfortable, spacious | balanced, expressive | warm | rounded | amber | notion |

Affinity lookup: if the extracted value is listed under that preset’s column → **2**; if adjacent → **1**; else → **0**.

**Adjacent:** `compact`↔`comfortable`, `comfortable`↔`spacious`, `soft`↔`rounded`, `cool`↔`neutral`, `neutral`↔`warm`, `restrained`↔`balanced`, `balanced`↔`expressive`.  
**Not adjacent:** `sharp`↔`rounded`, `mono`↔`violet`, `tool`↔`portfolio`, `compact`↔`spacious`.

## Formula

```text
score(preset) = Σ (weight(dim) × affinity(preset, dim, signal))
```

Max = **24**.

### Penalties (after sum; score path only)

| Rule | Penalty |
|------|---------|
| No portfolio / Plasma / explicit purple brand cue | **−8** on `neutral-purple.css` and `plasma-landing.css` |
| Generic “modern UI” / thin signals (anti-slop) | If a purple-leaning preset is still #1 only via weak ties → **discard** it, take next non-purple |
| `plasma-landing` when S≠`landing` and no Plasma cue | **−6** (stacks with −8 if both apply) |

### Rank & choose

1. Rank by score (highest first).
2. **Chosen** = #1.
3. If #2 is within **2 points** of #1 → list **runner-up**.
4. If after penalties the best score is **< 8** and signals were thin → ask **one** Q (surface or accent), then rescore once. Do not invent purple.
5. Emit Token score + Conventions line.

## Output (required on score path)

```markdown
### Token score
- Signals: S=… D=… E=… W=… R=… A=… I=…
- Ranked:
  1. tokens/<file>.css — <score>/24 — <one-line why>
  2. tokens/<file>.css — <score>/24 (runner-up, if within 2)
- Chosen: tokens/<file>.css
```

Hard-gate / explicit / custom — skip the ranked list; still set Conventions:

- Custom: `Tokens: project system`
- Explicit: `Tokens: tokens/<file>.css (explicit)`
- Plasma hard-gate: `Tokens: tokens/plasma-landing.css (hard-gate)`
- Scored: `Tokens: tokens/<file>.css (score n/24)`

## Worked examples

### “Bikin dashboard admin compact, mirip Linear” (empty project)

Tree: no system → no `--token` → not Plasma → **score path**.

Signals: S=`dashboard` D=`compact` E=`restrained` W=`cool` R=`soft` A=`blue` I=`linear`

→ `#1 zinc-blue.css` (high); purple presets penalized/discarded.

### “Landing page Plasma”

Tree: no system → no `--token` → **Plasma hard-gate** → `plasma-landing.css` (no full score).

### “/ui --token tokens/rose-amber.css”

Tree: **explicit preset** → that file (no score).

### Project already has shadcn theme

Tree: **custom mode** → style-infer → never score pack presets.

### “UI modern” (vague, no brand)

Tree: score path. Defaults lean mono/restrained — **not** `neutral-purple` / `plasma-landing`.
