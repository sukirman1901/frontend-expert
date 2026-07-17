# WebGL — Plasma Studio

**Canonical study / product:** [Plasma Studio](https://plasma.nusaiba.dev/app/)  
**Landing:** [plasma.nusaiba.dev](https://plasma.nusaiba.dev)  
**Local source:** sibling repo `Plasma/` (`app/` = studio)

Plasma is a **pure WebGL fragment-shader generator** for animated backgrounds. No Three.js, no R3F, no scene graph — fullscreen quad + GLSL + uniforms. Prefer this path for hero/background shaders in this pack.

## Mental model

```
Studio UI (app/)          Runtime drop-in
─────────────────         ────────────────
Tune engines/params  →    Plasma.init(canvasId, config)
Copy / export code   →    shader-source + plasma-engine
```

| Piece | Path | Role |
|-------|------|------|
| Studio shell | `app/index.html` + `app/js/index.js` | Filters, colors, export UI |
| Fragment shader | `app/js/shader-source.js` → `window.fragmentShaderSource` | Shared GLSL (all engines) |
| Studio GL loop | `app/js/shader.js` | Live preview on `#glcanvas` |
| Embeddable API | `app/js/plasma-engine.js` → `window.Plasma` | `Plasma.init(id, config)` |
| Export helpers | `app/js/exportGenerators.js` | JSON, CSS vars, Tailwind, TS, vanilla snippet |

Landing page reuses the same engine for mini canvases (`Plasma.init('feature-canvas-N', …)`).

## Three engines (Studio nav)

| Engine | `config.style` | Notes |
|--------|----------------|--------|
| **Gradient** | `Fluid`, `Aurora`, `Silk`, `Caustics`, `Plasma`, `Nebula`, `Lava`, `Iridescent`, `Ocean`, `Smoke` | Color stops + flow / noise / warp / grain |
| **Dither** | `"Dither"` | Bayer / shape dither; fg/bg colors |
| **Raymarch** | `"Raymarch"` | SDF shapes, material, camera drag |

Style → `u_style` int mapping (engine): Dither=`5`, Raymarch=`11`, Gradient styles `0–4` / `6–10`.

## Drop into a project

```html
<canvas id="plasma-bg"></canvas>
<script src="/path/to/shader-source.js"></script>
<script src="/path/to/plasma-engine.js"></script>
<script>
  Plasma.init('plasma-bg', {
    style: 'Fluid',
    colors: ['#6C5CE7', '#09090b', '#5b4cdb', '#111113', '#ffffff'],
    speed: 0.5,
    noise: 1.0,
    warp: 0.5,
    grain: 0.02
  });
</script>
```

API returned by `init`:

- `destroy()` — cancel rAF, remove listeners, lose WebGL context
- `updateConfig(partial)` — live-tune uniforms without recompile

Always pair with a **sized parent** (engine resizes canvas to parent / viewport). Call `destroy` on route unmount.

## Uniform surface (shared)

Common: `u_colors[5]`, `u_time`, `u_noise`, `u_warp`, `u_grain`, `u_pointer`, `u_resolution`, `u_style`.

Dither extras: `u_ditherShape`, `u_ditherType`, `u_ditherFit`, `u_ditherScale`, `u_ditherRotation`, `u_ditherOffset`, `u_ditherSize`.

Raymarch extras: shape/scale/roundness/rotation/positionY, object/bg colors, metallic/smoothness/ambient/specular/glow/shadow, `u_raymarchCamera`.

Vertex shader is always a fullscreen quad (`a_position` → NDC).

## Studio workflow (for agents)

1. Open [Studio](https://plasma.nusaiba.dev/app/) (or local `Plasma/app/`)
2. Pick engine → tune Filters / Colors until the look matches the product
3. Export via **Copy code** (vanilla `Plasma.init` snippet preferred for shipping)
4. Optional: CSS vars / Tailwind / TS config from the same export menu for token alignment
5. Wire canvas behind content; keep UI chrome token-based (`plasma-landing` or project system)
6. Respect a11y: animated bg is decorative — don’t rely on it for meaning; offer reduce-motion fallback (static gradient / CSS)

## Pack alignment

- Tokens for chrome/UI: `tokens/plasma-landing.css` (landing) — Studio app uses its own dark/lime system; don’t mix blindly
- Icons in Studio: [Reicon](https://reicon.dev) CDN (`re-icon`) — match pack icon convention
- Prefer Plasma over inventing a new shader stack for background FX

## When *not* Plasma

Use a scene graph (Three.js / R3F) only when you need meshes, cameras, GLTF, lighting, postprocessing volumes — not for a tunable fullscreen background. Short checklist:

```tsx
import { Canvas } from '@react-three/fiber'
// …meshes, lights, controls — see Three.js docs
```

Perf notes for either path: pause when offscreen; honor `prefers-reduced-motion`; avoid unbounded DPR on mobile (`devicePixelRatio` cap ~2).

## Anti-patterns

- Rebuilding Plasma’s engines from scratch when Studio export already fits
- Stacking Three.js *and* Plasma on the same hero without a clear job split
- Leaving the WebGL loop running after SPA navigation (always `destroy`)
- Treating the shader as the only contrast source for text (ensure readable overlays via tokens)
