---
name: webgl
description: >-
  Pure WebGL shader backgrounds via Plasma Studio (Gradient/Dither/Raymarch),
  Plasma.init drop-in, destroy on unmount. REQUIRED when the user asks for
  WebGL, shader background, plasma effect, animated canvas bg, or
  plasma.nusaiba.dev — do not invent Three.js heroes for backgrounds.
---

# WebGL (Plasma Studio)

## Overview

Default path for animated **fullscreen backgrounds**: [Plasma Studio](https://plasma.nusaiba.dev/app/) — pure WebGL fragment shaders, not Three.js/R3F.

## When to use

- Shader / plasma / WebGL background
- Export from Studio into a product canvas
- Landing hero FX with `Plasma.init`

## When to skip

- Mesh/GLTF/3D scene graph → Three.js (see depth note in reference)
- Static CSS gradient only

## Workflow

1. **Stop** — do not scaffold Three.js/R3F for a fullscreen background unless the user explicitly wants a 3D scene graph
2. Prefer Studio tune → export config over rewriting GLSL
3. Drop in `shader-source` + `plasma-engine` → `Plasma.init(id, config)`
4. Call `destroy()` on route unmount; honor `prefers-reduced-motion`
5. UI chrome uses tokens (`plasma-landing` or project system); icons Reicon
6. Note WebGL line in **Conventions check** (`references/compliance-gates.md`)

## Checklist

- [ ] Engine choice clear (Gradient / Dither / Raymarch)
- [ ] Canvas sized by parent; resize OK
- [ ] Lifecycle cleanup (`destroy`)
- [ ] Text contrast not relying on shader alone
- [ ] Reduced-motion fallback considered

## Depth

Full guide: `references/webgl.md`.
