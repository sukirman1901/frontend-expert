# WebGL / Three.js Reference

Three.js fundamentals, React Three Fiber, shaders, and 3D optimization.

## Three.js Fundamentals

### Basic Setup

```tsx
import * as THREE from 'three'

// Scene
const scene = new THREE.Scene()

// Camera
const camera = new THREE.PerspectiveCamera(
  75, // FOV
  window.innerWidth / window.innerHeight, // Aspect
  0.1, // Near
  1000 // Far
)

// Renderer
const renderer = new THREE.WebGLRenderer({ antialias: true })
renderer.setSize(window.innerWidth, window.innerHeight)
document.body.appendChild(renderer.domElement)

// Animation loop
function animate() {
  requestAnimationFrame(animate)
  renderer.render(scene, camera)
}
animate()
```

### Geometry

```tsx
// Box
const geometry = new THREE.BoxGeometry(1, 1, 1)

// Sphere
const geometry = new THREE.SphereGeometry(1, 32, 32)

// Plane
const geometry = new THREE.PlaneGeometry(10, 10)

// Custom geometry
const geometry = new THREE.BufferGeometry()
const vertices = new Float32Array([
  -1.0, -1.0,  1.0,
   1.0, -1.0,  1.0,
   1.0,  1.0,  1.0,
])
geometry.setAttribute('position', new THREE.BufferAttribute(vertices, 3))
```

### Materials

```tsx
// Basic material
const material = new THREE.MeshBasicMaterial({ color: 0x00ff00 })

// Standard material (physically based)
const material = new THREE.MeshStandardMaterial({
  color: 0x00ff00,
  metalness: 0.5,
  roughness: 0.5,
})

// Phong material (shiny)
const material = new THREE.MeshPhongMaterial({
  color: 0x00ff00,
  shininess: 100,
})

// Wireframe
const material = new THREE.MeshBasicMaterial({
  wireframe: true,
})
```

### Lighting

```tsx
// Ambient light
const light = new THREE.AmbientLight(0xffffff, 0.5)
scene.add(light)

// Directional light
const light = new THREE.DirectionalLight(0xffffff, 1)
light.position.set(5, 5, 5)
scene.add(light)

// Point light
const light = new THREE.PointLight(0xffffff, 1, 100)
light.position.set(5, 5, 5)
scene.add(light)

// Spot light
const light = new THREE.SpotLight(0xffffff, 1)
light.position.set(5, 5, 5)
light.angle = Math.PI / 4
scene.add(light)
```

## React Three Fiber

### Basic Setup

```tsx
import { Canvas } from '@react-three/fiber'
import { Box } from '@react-three/drei'

function App() {
  return (
    <Canvas>
      <ambientLight intensity={0.5} />
      <pointLight position={[10, 10, 10]} />
      <Box args={[1, 1, 1]}>
        <meshStandardMaterial color="hotpink" />
      </Box>
    </Canvas>
  )
}
```

### Drei Helpers

```tsx
import { 
  OrbitControls, 
  PerspectiveCamera, 
  Environment,
  Float,
  Text,
  Center
} from '@react-three/drei'

function Scene() {
  return (
    <>
      <PerspectiveCamera makeDefault position={[0, 0, 5]} />
      <OrbitControls />
      <Environment preset="city" />
      
      <Float speed={2} rotationIntensity={0.5}>
        <Center>
          <Text fontSize={1} color="white">
            Hello World
          </Text>
        </Center>
      </Float>
    </>
  )
}
```

### Animation

```tsx
import { useFrame } from '@react-three/fiber'

function RotatingBox() {
  const meshRef = useRef()
  
  useFrame((state, delta) => {
    meshRef.current.rotation.x += delta
    meshRef.current.rotation.y += delta
  })
  
  return (
    <mesh ref={meshRef}>
      <boxGeometry args={[1, 1, 1]} />
      <meshStandardMaterial color="hotpink" />
    </mesh>
  )
}
```

### Physics

```tsx
import { Physics, useSphere, useBox } from '@react-three/rapier'

function Ball() {
  const [ref, api] = useSphere(() => ({
    mass: 1,
    position: [0, 5, 0],
  }))
  
  return (
    <mesh ref={ref}>
      <sphereGeometry args={[0.5, 32, 32]} />
      <meshStandardMaterial color="hotpink" />
    </mesh>
  )
}

function Floor() {
  const [ref] = useBox(() => ({
    position: [0, -1, 0],
    args: [10, 1, 10],
    type: 'Static',
  }))
  
  return (
    <mesh ref={ref}>
      <boxGeometry args={[10, 1, 10]} />
      <meshStandardMaterial color="gray" />
    </mesh>
  )
}

function App() {
  return (
    <Physics>
      <Ball />
      <Floor />
    </Physics>
  )
}
```

## GLSL Shaders

### Vertex Shader

```glsl
varying vec2 vUv;
varying vec3 vPosition;

void main() {
  vUv = uv;
  vPosition = position;
  gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
}
```

### Fragment Shader

```glsl
uniform float uTime;
uniform vec3 uColor;
varying vec2 vUv;
varying vec3 vPosition;

void main() {
  // Simple color
  gl_FragColor = vec4(uColor, 1.0);
  
  // Gradient
  vec3 color = mix(vec3(1.0, 0.0, 0.0), vec3(0.0, 0.0, 1.0), vUv.x);
  gl_FragColor = vec4(color, 1.0);
  
  // Animated
  float intensity = sin(uTime + vPosition.x) * 0.5 + 0.5;
  gl_FragColor = vec4(uColor * intensity, 1.0);
}
```

### ShaderMaterial

```tsx
const material = new THREE.ShaderMaterial({
  uniforms: {
    uTime: { value: 0 },
    uColor: { value: new THREE.Color(0x00ff00) },
  },
  vertexShader: `
    varying vec2 vUv;
    void main() {
      vUv = uv;
      gl_Position = projectionMatrix * modelViewMatrix * vec4(position, 1.0);
    }
  `,
  fragmentShader: `
    uniform float uTime;
    uniform vec3 uColor;
    varying vec2 vUv;
    void main() {
      float intensity = sin(uTime + vUv.x * 10.0) * 0.5 + 0.5;
      gl_FragColor = vec4(uColor * intensity, 1.0);
    }
  `,
})

// Update uniforms
useFrame((state) => {
  material.uniforms.uTime.value = state.clock.elapsedTime
})
```

## Performance Optimization

### Instanced Meshes

```tsx
// Bad: Many individual meshes
function BadParticles() {
  return (
    <>
      {Array.from({ length: 1000 }).map((_, i) => (
        <mesh key={i} position={[Math.random() * 10, Math.random() * 10, 0]}>
          <sphereGeometry args={[0.1, 8, 8]} />
          <meshBasicMaterial color="white" />
        </mesh>
      ))}
    </>
  )
}

// Good: Instanced mesh
function GoodParticles() {
  const meshRef = useRef()
  const count = 1000
  
  useEffect(() => {
    const dummy = new THREE.Object3D()
    for (let i = 0; i < count; i++) {
      dummy.position.set(
        Math.random() * 10,
        Math.random() * 10,
        0
      )
      dummy.updateMatrix()
      meshRef.current.setMatrixAt(i, dummy.matrix)
    }
    meshRef.current.instanceMatrix.needsUpdate = true
  }, [])
  
  return (
    <instancedMesh ref={meshRef} args={[null, null, count]}>
      <sphereGeometry args={[0.1, 8, 8]} />
      <meshBasicMaterial color="white" />
    </instancedMesh>
  )
}
```

### Level of Detail (LOD)

```tsx
function LODObject() {
  const lodRef = useRef()
  
  useEffect(() => {
    // High detail (close)
    const highDetail = new THREE.Mesh(
      new THREE.SphereGeometry(1, 64, 64),
      new THREE.MeshStandardMaterial()
    )
    lodRef.current.addLevel(highDetail, 0)
    
    // Medium detail
    const mediumDetail = new THREE.Mesh(
      new THREE.SphereGeometry(1, 32, 32),
      new THREE.MeshStandardMaterial()
    )
    lodRef.current.addLevel(mediumDetail, 50)
    
    // Low detail (far)
    const lowDetail = new THREE.Mesh(
      new THREE.SphereGeometry(1, 8, 8),
      new THREE.MeshStandardMaterial()
    )
    lodRef.current.addLevel(lowDetail, 100)
  }, [])
  
  return <lod ref={lodRef} />
}
```

### Frustum Culling

```tsx
// Automatic in Three.js, but you can control it
const mesh = new THREE.Mesh(geometry, material)
mesh.frustumCulled = true // Default

// Disable for always-visible objects
mesh.frustumCulled = false
```

### Texture Compression

```tsx
// Use compressed textures
const loader = new THREE.TextureLoader()
const texture = loader.load('texture.webp') // Use WebP

// Or use KTX2 for GPU compression
import { KTX2Loader } from 'three/examples/jsm/loaders/KTX2Loader'
const ktx2Loader = new KTX2Loader()
const texture = ktx2Loader.load('texture.ktx2')
```

## Common Patterns

### Post-Processing

```tsx
import { EffectComposer, Bloom, Vignette } from '@react-three/postprocessing'

function PostProcessing() {
  return (
    <EffectComposer>
      <Bloom luminanceThreshold={0.9} luminanceSmoothing={0.025} />
      <Vignette eskil={false} offset={0.1} darkness={0.5} />
    </EffectComposer>
  )
}
```

### Raycasting (Interaction)

```tsx
function InteractiveBox() {
  const [hovered, setHovered] = useState(false)
  const [clicked, setClicked] = useState(false)
  
  return (
    <mesh
      onPointerOver={() => setHovered(true)}
      onPointerOut={() => setHovered(false)}
      onClick={() => setClicked(!clicked)}
      scale={clicked ? 1.5 : 1}
    >
      <boxGeometry args={[1, 1, 1]} />
      <meshStandardMaterial color={hovered ? 'hotpink' : 'orange'} />
    </mesh>
  )
}
```

### Environment Map

```tsx
import { Environment, useEnvironment } from '@react-three/drei'

function ReflectiveBox() {
  const envMap = useEnvironment({ preset: 'city' })
  
  return (
    <mesh>
      <boxGeometry args={[1, 1, 1]} />
      <meshStandardMaterial 
        envMap={envMap} 
        metalness={1} 
        roughness={0} 
      />
    </mesh>
  )
}
```
