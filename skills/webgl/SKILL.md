---
name: webgl
description: >-
  Pure WebGL shader backgrounds via Plasma Studio (Gradient/Dither/Raymarch),
  Plasma.init drop-in, destroy on unmount. Use when the user asks for WebGL,
  shader background, plasma effect, animated canvas bg, or
  plasma.nusaiba.dev/app — not for Three.js scene graphs unless they insist.
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

1. Prefer Studio tune → export config over rewriting GLSL
2. Drop in `shader-source` + `plasma-engine` → `Plasma.init(id, config)`
3. Call `destroy()` on route unmount; honor `prefers-reduced-motion`
4. UI chrome uses tokens (`plasma-landing` or project system); icons Reicon

## Checklist

- [ ] Engine choice clear (Gradient / Dither / Raymarch)
- [ ] Canvas sized by parent; resize OK
- [ ] Lifecycle cleanup (`destroy`)
- [ ] Text contrast not relying on shader alone
- [ ] Reduced-motion fallback considered

## Depth

Full guide: `references/webgl.md`.
