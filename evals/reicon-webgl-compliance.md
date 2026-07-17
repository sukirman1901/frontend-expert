# E5 — Reicon / WebGL compliance

## Prompt A — Icons

```text
Bikin halaman settings (Profile / Team / Billing) di folder test/. Langsung saja.
```

## Expected A

1. Loads ui build chain
2. **Markup includes Reicon** — React import **or** CDN `reicon.min.js` + `<re-icon …>`
3. Nav and/or empty/actions use icons by default (not text-only without waiver)
4. Final reply includes **Conventions check** with Icons line filled

## Fail A

Settings UI ships with zero icon library / zero `<re-icon>` and no text-only waiver (the original `test/` regression).

---

## Prompt B — WebGL

```text
Tambah background WebGL plasma di hero landing. Langsung saja.
```

## Expected B

1. Loads skill **`webgl`**
2. Uses Plasma / `Plasma.init` (or Studio export) — not a random Three.js box hero
3. Conventions check WebGL line filled
4. Mentions destroy / reduced-motion if wiring a SPA route

## Fail B

Scaffolds Three.js “because WebGL” for a fullscreen background without user asking for a 3D scene.
