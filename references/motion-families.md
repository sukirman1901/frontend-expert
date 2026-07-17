# Motion families & patterns

Pack-owned vocabulary for choosing and **hand-rolling** UI motion (CSS / Motion / GSAP).
Pattern **names are executable**: read definisi + peruntukan, then implement — do not wait for a third-party registry block.

**Do not** treat this catalog as a cue to install external component registries.

## How to use

```text
user intent → pick 1 family (max 2) by peruntukan
  → pick 1–2 named patterns
  → hand-roll from definisi + hint
  → prefers-reduced-motion fallback
```

**Budget:** max **2–3 intentional motions** per viewport. Catalog size ≠ animate everything.

## Selection tree

| Intent | Family | Start with |
|--------|--------|------------|
| Button/card feel | Hover & Interaction | `lift-hover, press-scale` |
| Toast / toggle / success | Micro Interaction | `toast-slide, toggle-morph, success-pulse` |
| Section enter (app) | Reveal & Wipe | `fade-up, page-crossfade, drawer-slide` |
| Section enter (marketing) | Reveal & Wipe | `split-reveal, stagger-children, mask-wipe` |
| Scroll storytelling | Scroll-based | `sticky-cards, fade-in-view, scroll-zoom` |
| Headline drama | Text Motion | `word-reveal, line-mask-up` |
| Logo strip | Carousel & Continuous Flow | `logo-marquee, infinite-slider` |
| Bento / feature grid | Grid Motion | `bento-reveal, elastic-cell` |
| Focus one feature | Spotlight & Focus | `center-stage, dim-siblings, tab-ink-bar` |
| Card deck / swipe | Stack & Scatter | `deck-stack, swipe-deck` |
| Landing signature | Hero Section Motion | `parallax-hero OR floating-device (pick one)` |
| List → detail continuity | Morph & Transform | `shared-element` |
| 3D showcase | 3D & Perspective | `orbit-carousel, coverflow — perf check` |

## Anti-patterns

- Stacking Hero + 3D + Text + Spotlight + Carousel in one viewport
- Typewriter / marquee on form labels or dense settings
- Infinite autoplay with no pause on hover/focus / reduced-motion
- Motion as the only way to convey meaning
- Defaulting product dashboards to Hero/3D families

## Family index

| Family | Peruntukan | Lane |
|--------|------------|------|
| Micro Interaction | Feedback kecil yang menutup loop aksi (toggle, toast, like, progress). | Product default |
| Hover & Interaction | Feedback pointer: hover, press, magnetic, tilt, ripple. | Product = lift/press; marketing = magnetic/tilt sparingly |
| Scroll-based | Animasi terikat posisi scroll: sticky, horizontal, zoom, timeline. | Product light whileInView; marketing sticky/horizontal OK |
| Reveal & Wipe | Koreografi masuk: fade, split, mask, curtain — satu kali enter. | Shell = soft fade; marketing = split/mask OK |
| Text Motion | Animasi tipografi: word/char reveal, typewriter, rolling, marquee type. | Marketing; avoid in forms/product density |
| Carousel & Continuous Flow | Aliran konten horizontal/sirkular: marquee, filmstrip, snap, story rail. | Mostly marketing / logo clouds |
| Grid Motion | Animasi berbasis layout grid: bento reveal, flip, masonry, elastic cells. | Marketing / feature grids |
| Spotlight & Focus | Mengarahkan perhatian: center stage, blur dim, cursor spotlight. | Marketing features |
| Stack & Scatter | Tumpukan/sebar kartu: deck, fan, cascade, poster burst. | Marketing only |
| Hero Section Motion | Signature landing: parallax, floating device, orb/aurora — max satu signature. | Marketing; max 1 signature per page |
| Morph & Transform | Transisi bentuk/kontainer: shared element, FAB morph, path morph. | Rare; shared element OK in product |
| 3D & Perspective | Kedalaman 3D: orbit, floating cards, spatial stacks — budget performa. | Marketing; perf budget |

## Micro Interaction

**Peruntukan:** Feedback kecil yang menutup loop aksi (toggle, toast, like, progress).
**Bukan untuk:** Hero signature, scroll storytelling, page-level spectacle.
**Lane:** Product default

| Pattern | Definisi | Peruntukan | Hand-roll hint |
|---------|----------|------------|----------------|
| `toggle-morph` | Kontrol beralih state dengan morph ikon/track singkat | Switch, checkbox, theme toggle | width/transform track + icon opacity 150–200ms |
| `toast-slide` | Toast masuk dari tepi lalu keluar | Notifikasi non-blocking | translateY/X + opacity; AnimatePresence exit |
| `like-burst` | Burst partikel/skala singkat saat like | Social/react actions | scale 1→1.2→1 + optional particles; reduced-motion → opacity flash |
| `success-pulse` | Pulse ring/opacity saat sukses | Save OK, checkmark | box-shadow ring fade 300ms once |
| `progress-fill` | Bar/arc mengisi ke nilai target | Upload, steps, loading determinate | scaleX/width transition; honor reduced-motion instant set |
| `checkbox-pop` | Check mark scale-in saat checked | Forms | path draw or scale 0.8→1 120ms |
| `badge-pop` | Badge count muncul dengan scale | Notif counts | scale + opacity; layout safe |
| `spinner-replace` | Spinner diganti check dengan crossfade | Async button done | opacity crossfade 200ms |
| `skeleton-shimmer` | Shine melintas di placeholder | Loading lists | gradient background-position loop; pause if reduced-motion |
| `focus-ring-in` | Focus ring fade/scale masuk | Keyboard a11y | outline/box-shadow opacity 100ms — never remove for motion |
| `hit-ripple` | Ripple dari titik pointer | Buttons (optional) | radial pseudo; skip on reduced-motion |
| `count-tick` | Angka berpindah ke nilai baru | Stats, cart qty | tabular-nums + slight y slide; or instant if reduced-motion |

## Hover & Interaction

**Peruntukan:** Feedback pointer: hover, press, magnetic, tilt, ripple.
**Bukan untuk:** Page enter, scroll story, hero-only spectacle.
**Lane:** Product = lift/press; marketing = magnetic/tilt sparingly

| Pattern | Definisi | Peruntukan | Hand-roll hint |
|---------|----------|------------|----------------|
| `lift-hover` | Naik tipis + depth on hover | Cards, list rows | translateY(-2px) + shadow token ~150ms ease-out |
| `press-scale` | Scale down saat active/press | Buttons, icon buttons | scale(0.96); never below 0.95 |
| `magnetic-button` | Ikuti pointer dengan offset terbatas | Marketing CTA | pointer delta capped ~8–12px; reduced-motion → static |
| `tilt-hover` | rotateX/Y kecil dari posisi pointer | Feature cards | perspective + small rotate; disable on touch |
| `glow-hover` | Ring/glow opacity naik on hover | Primary controls | token-colored shadow; no purple slop |
| `ripple-click` | Ripple pada pointerdown | Material-like buttons | expanding circle clip; one-shot |
| `underline-slide` | Underline expand dari kiri/center | Nav links, text links | scaleX transform-origin |
| `icon-swap-fade` | Ikon A→B dengan opacity+scale | Menu↔close, play↔pause | opacity+scale 0.25→1; blur optional |
| `color-shift-hover` | Warna/foreground token shift | Ghost buttons | color/background transition 150ms |
| `border-draw` | Border seolah digambar on hover | Cards, inputs | background-size or SVG stroke |
| `cursor-follow-dot` | Dot kecil mengikuti cursor di zone | Interactive canvases | transform only; hide on touch/reduced-motion |
| `drag-lift` | Item terangkat saat drag | Reorder lists | scale 1.02 + shadow while dragging |

## Scroll-based

**Peruntukan:** Animasi terikat posisi scroll: sticky, horizontal, zoom, timeline.
**Bukan untuk:** Hanya micro button tanpa scroll context.
**Lane:** Product light whileInView; marketing sticky/horizontal OK

| Pattern | Definisi | Peruntukan | Hand-roll hint |
|---------|----------|------------|----------------|
| `fade-in-view` | Masuk viewport → opacity+y | Section bodies | whileInView once; y 16–24px 300–500ms |
| `sticky-cards` | Kartu menumpuk/sticky saat scroll | Feature stories | position sticky + stack offset |
| `horizontal-scroll` | Track horizontal digeser scroll/drag | Galleries, timelines | overflow-x + scroll-snap; a11y keyboard |
| `scroll-zoom` | Scale elemen mengikuti scroll | Hero media | useTransform scale; cap 1→1.1; reduced-motion static |
| `parallax-layer` | Layer bergerak beda kecepatan | Marketing backgrounds | translateY dari scrollY; small factors |
| `progress-scrub` | Animasi di-scrub oleh scroll | Story panels | scroll-driven or Motion useScroll |
| `pin-section` | Section pin sementara konten berubah | Product tours | pin spacer; careful mobile |
| `reveal-line` | Garis/path tumbuh saat scroll | Process steps | stroke-dashoffset tied to progress |
| `opacity-scrub` | Opacity konten berubah vs scroll | Overlays, captions | map scroll range → opacity |
| `snap-sections` | Full-viewport snap scroll | Pitch decks | scroll-snap-type y mandatory |
| `sticky-sidebar` | Sidebar ikut lalu lepas | Docs, pricing compare | position sticky top token |
| `scroll-counter` | Angka count-up saat masuk view | Stats row | once in view; reduced-motion → final number |

## Reveal & Wipe

**Peruntukan:** Koreografi masuk: fade, split, mask, curtain — satu kali enter.
**Bukan untuk:** Loop continuous, marquee abadi sebagai satu-satunya motion.
**Lane:** Shell = soft fade; marketing = split/mask OK

| Pattern | Definisi | Peruntukan | Hand-roll hint |
|---------|----------|------------|----------------|
| `fade-up` | Opacity 0→1 + translateY naik | Default section enter | y 12–20px, 250–350ms ease-out |
| `fade-in` | Opacity only | Dense UI, modals | 200–300ms |
| `split-reveal` | Konten terungkap dari dua arah | Hero headlines, images | clip-path inset or dual panels |
| `mask-wipe` | Wipe dengan mask arah | Image heroes | clip-path or gradient mask animate |
| `curtain-open` | Tirai kiri/kanan terbuka | Chapter starts | two panels translateX out |
| `ink-spread` | Noda/ink mengisi area | Dramatic section breaks | radial clip-path expand |
| `stagger-children` | Anak muncul berurutan | Lists, feature grids | stagger 50–100ms; cap count |
| `blur-in` | Blur→sharp + opacity | Soft marketing enters | filter blur 8→0; skip if reduced-motion |
| `scale-fade-in` | Scale 0.96→1 + fade | Cards, dialogs | transform+opacity 250ms |
| `drawer-slide` | Panel slide dari tepi | Mobile nav, sheets | translateX/Y + backdrop fade |
| `modal-scale` | Modal scale+fade enter/exit | Dialogs | AnimatePresence exit pair |
| `page-crossfade` | Ganti view dengan crossfade | Settings sections | opacity only; keep focus mgmt |

## Text Motion

**Peruntukan:** Animasi tipografi: word/char reveal, typewriter, rolling, marquee type.
**Bukan untuk:** Label form, tabel padat, settings chrome.
**Lane:** Marketing; avoid in forms/product density

| Pattern | Definisi | Peruntukan | Hand-roll hint |
|---------|----------|------------|----------------|
| `word-reveal` | Kata muncul berurutan | Headlines | split words; stagger opacity/y |
| `char-reveal` | Karakter muncul berurutan | Short display titles | split chars; keep SR full text |
| `typewriter` | Ketik karakter satu-satu | Hero taglines (sparingly) | width/ch steps; pause caret; reduced-motion → full text |
| `rolling-text` | Kata bergulir vertikal di slot | Rotating value props | translateY cycle; aria-live polite |
| `marquee-headline` | Headline bergeser horizontal | Promo bars | infinite translate; pause on hover/focus |
| `text-scramble` | Acak→teks final | Tech/marketing flourishes | short duration; reduced-motion → instant |
| `line-mask-up` | Baris naik dari mask | Multi-line titles | overflow hidden + y per line |
| `gradient-shift-text` | Gradient teks bergeser | Brand headlines | background-position animation slow |
| `highlight-sweep` | Highlight warna menyapu kata | Emphasis in copy | background-size animate |
| `glitch-text` | Glitch RGB singkat | 404/edgy brands only | 1–2 frames; never loops forever |
| `count-up-text` | Angka naik ke target | Pricing, metrics | ease-out count; tabular-nums |
| `underline-reveal` | Underline tumbuh di bawah teks | Section titles | scaleX 0→1 |

## Carousel & Continuous Flow

**Peruntukan:** Aliran konten horizontal/sirkular: marquee, filmstrip, snap, story rail.
**Bukan untuk:** Satu CTA fokus tanpa perlu browsing.
**Lane:** Mostly marketing / logo clouds

| Pattern | Definisi | Peruntukan | Hand-roll hint |
|---------|----------|------------|----------------|
| `logo-marquee` | Logo bergerak infinite | Social proof | duplicate track + translateX; pause hover |
| `filmstrip` | Deretan thumbnail geser | Media galleries | scroll-snap + arrows |
| `snap-carousel` | Slide dengan snap + dots | Testimonials, features | scroll-snap; keyboard arrows |
| `story-rail` | Kartu story horizontal | Campaigns | peek next card; touch swipe |
| `center-carousel` | Item tengah scale lebih besar | Product pickers | scale by distance to center |
| `fade-carousel` | Crossfade antar slide | Heroes simple | opacity only; no slide thrash |
| `infinite-slider` | Slider loop tanpa ujung | Partners, press | clone items; seamless loop |
| `vertical-marquee` | Marquee vertikal | Ticker feeds | translateY loop; reduced-motion static |
| `card-rail-drag` | Rail bisa di-drag | Mobile galleries | drag + momentum; cursor grab |
| `autoplay-pause` | Autoplay slide dengan pause on focus | Heroes | respect reduced-motion = no autoplay |
| `thumbnail-sync` | Thumb klik sync main slide | Product media | shared index state |
| `peek-carousel` | Sebagian slide berikutnya terlihat | App stores style | padding-inline end peek |

## Grid Motion

**Peruntukan:** Animasi berbasis layout grid: bento reveal, flip, masonry, elastic cells.
**Bukan untuk:** Micro satu tombol / satu baris form.
**Lane:** Marketing / feature grids

| Pattern | Definisi | Peruntukan | Hand-roll hint |
|---------|----------|------------|----------------|
| `bento-reveal` | Sel bento muncul stagger | Feature bento | stagger by index; varied delays |
| `flip-grid` | Kartu flip ke wajah belakang | Team, pricing toggles | rotateY 180; preserve-3d |
| `masonry-flow` | Item masonry masuk berurutan | Galleries | fade-up per item after layout |
| `elastic-cell` | Sel membesar saat aktif | Bento focus | layout animation / grid-area expand |
| `grid-shuffle` | Posisi sel bertukar | Filters reshuffle | FLIP technique |
| `hover-expand-cell` | Satu sel expand on hover | Interactive bento | flex-grow or grid scale; siblings shrink |
| `cascade-grid` | Cascade diagonal masuk | Portfolios | delay = row+col |
| `filter-reflow` | Filter → items reflow animated | Catalogs | layout prop / FLIP |
| `gap-breathe` | Gap grid berdenyut ringan | Ambient (rare) | avoid loops; prefer static |
| `tile-press` | Tile scale on press | App icon grids | press-scale per tile |
| `span-morph` | Item ubah col-span animated | Dash widgets | layout animation |
| `mosaic-assemble` | Mosaic dari potongan menyatu | Hero graphics | many small fades; budget perf |

## Spotlight & Focus

**Peruntukan:** Mengarahkan perhatian: center stage, blur dim, cursor spotlight.
**Bukan untuk:** Noise seluruh halaman tanpa hierarki.
**Lane:** Marketing features

| Pattern | Definisi | Peruntukan | Hand-roll hint |
|---------|----------|------------|----------------|
| `center-stage` | Item aktif scale/contrast naik; lain redup | Feature showcases | siblings opacity 0.5; active 1 |
| `blur-dim` | Latar blur saat fokus item | Modals, spotlights | backdrop-filter; fallback opacity |
| `cursor-spotlight` | Spotlight mengikuti kursor | Dark feature sections | radial gradient mask; disable touch |
| `focus-shift` | Fokus pindah antar panel dengan motion | Multi-feature | shared layout highlight |
| `dim-siblings` | Hover satu → sibling dim | Card rows | group-hover opacity |
| `spotlight-beam` | Beam cahaya menyapu | Launch moments | short one-shot gradient |
| `ring-focus` | Ring menyorot elemen aktif | Tours, onboarding | outline offset animate |
| `ken-burns-focus` | Slow zoom pada area fokus | Story images | scale 1→1.05 over seconds |
| `accordion-focus` | Panel buka; lain collapse soft | FAQs | height + opacity; a11y expanded |
| `tab-ink-bar` | Ink bar geser ke tab aktif | Tabs | layoutId underline |
| `hover-spotlight-card` | Kartu mendapat vignette spotlight | Pricing cards | radial light on hover |
| `stage-crossfade` | Ganti subject di panggung | Product stages | crossfade center media |

## Stack & Scatter

**Peruntukan:** Tumpukan/sebar kartu: deck, fan, cascade, poster burst.
**Bukan untuk:** Tabel settings, dense admin.
**Lane:** Marketing only

| Pattern | Definisi | Peruntukan | Hand-roll hint |
|---------|----------|------------|----------------|
| `deck-stack` | Kartu bertumpuk sedikit offset | Testimonials, stories | rotate/translate stack; swipe next |
| `fan-spread` | Kartu terbuka seperti kipas | On hover collection | rotate fan from center |
| `cascade-drop` | Kartu jatuh berurutan ke tempat | Deal reveals | stagger y from above |
| `poster-burst` | Poster menyebar dari pusat | Campaign moments | scatter then settle; one-shot |
| `shuffle-deck` | Acak urutan tumpukan | Games, picks | FLIP shuffle |
| `peel-card` | Kartu terkelupas dari sudut | Coupons, reveals | transform-origin corner rotate |
| `stack-to-row` | Dari tumpuk → baris | Expand collections | layout animation |
| `scatter-gather` | Sebar lalu kumpul lagi | Empty→populated | positions random→grid |
| `swipe-deck` | Swipe atas deck seperti Tinder | Pickers | drag + rotate; thresholds |
| `layered-parallax-stack` | Layer stack parallax tipis | Hero cards | small z offsets |
| `card-fly-in` | Kartu terbang ke stack | Add-to-collection | from FAB to pile |
| `collapse-stack` | Baris collapse jadi stack | Archive UI | layout to overlapped |

## Hero Section Motion

**Peruntukan:** Signature landing: parallax, floating device, orb/aurora — max satu signature.
**Bukan untuk:** App chrome, dashboard, settings.
**Lane:** Marketing; max 1 signature per page

| Pattern | Definisi | Peruntukan | Hand-roll hint |
|---------|----------|------------|----------------|
| `parallax-hero` | Foreground/background beda scroll speed | Landing heroes | 2–3 layers max; reduced-motion static |
| `floating-device` | Mock device mengambang pelan | Product heroes | translateY loop subtle 4–6s |
| `aurora-bg` | Gradient aurora bergerak lambat | Brand heroes | large blur gradients; GPU budget |
| `orb-motion` | Orb/blob mengambang | Abstract heroes | slow x/y; no seizure flicker |
| `hero-stagger-copy` | Title/sub/CTA stagger masuk | All heroes | Reveal family patterns; keep one CTA |
| `video-mask-reveal` | Video terungkap dari mask | Cinematic heroes | mask wipe once |
| `mouse-parallax-hero` | Layer ikut mouse | Desktop heroes | small factors; off on touch |
| `scroll-collapse-hero` | Hero mengecil saat scroll | Sticky headers evolve | height/opacity scrub |
| `device-carousel-hero` | Device frames ganti screen | App showcases | crossfade screens inside frame |
| `particle-field` | Partikel ambient jarang | Atmospheres | low count; pause reduced-motion |
| `cta-rise` | CTA naik setelah copy | Conversion heroes | delay after title; press-scale ready |
| `logo-lockup-in` | Logo+wordmark assemble | Brand landings | short; don’t loop |

## Morph & Transform

**Peruntukan:** Transisi bentuk/kontainer: shared element, FAB morph, path morph.
**Bukan untuk:** Setiap navigasi biasa.
**Lane:** Rare; shared element OK in product

| Pattern | Definisi | Peruntukan | Hand-roll hint |
|---------|----------|------------|----------------|
| `shared-element` | Elemen yang sama bergerak antar view | List→detail image | layoutId / FLIP |
| `fab-morph` | FAB melebar jadi sheet/dialog | Compose actions | border-radius + size morph |
| `path-morph` | SVG path morph A→B | Icons, illustrations | SMIL/Motion path; keep simple |
| `blob-morph` | Blob shape lambat berubah | Marketing backgrounds | border-radius or SVG; slow |
| `expand-tile` | Tile expand full-screen | Galleries | layout + escape to close |
| `collapse-to-icon` | Panel collapse jadi ikon | Dock panels | scale+opacity to icon rect |
| `tab-content-morph` | Konten tab morph height | Settings tabs | height animate; overflow hidden |
| `image-crop-morph` | Crop/aspect morph | Editors | clip-path animate |
| `button-to-input` | Tombol search melebar jadi field | Expandable search | width morph + focus |
| `chip-to-filter` | Chip expand jadi filter panel | Toolbars | shared layout |
| `avatar-to-profile` | Avatar morph ke header profil | Profile nav | layoutId avatar |
| `liquid-nav` | Indikator nav morph antar item | Bottom nav | layoutId pill |

## 3D & Perspective

**Peruntukan:** Kedalaman 3D: orbit, floating cards, spatial stacks — budget performa.
**Bukan untuk:** Default product UI, dense forms.
**Lane:** Marketing; perf budget

| Pattern | Definisi | Peruntukan | Hand-roll hint |
|---------|----------|------------|----------------|
| `orbit-carousel` | Item mengorbit di ruang 3D | Showcases | rotateY orbit; pause reduced-motion |
| `floating-cards-3d` | Kartu mengambang dengan Z | Feature piles | translateZ + slow bob |
| `spatial-stack` | Stack dengan perspektif dalam | File stacks | perspective parent; rotateX slight |
| `coverflow` | Coverflow kiri/kanan miring | Albums, galleries | rotateY by index distance |
| `tilt-3d-card` | Kartu 3D tilt ke pointer | Product cards | same as tilt-hover with perspective |
| `cube-rotate` | Kubus sisi berputar | Rare promotions | preserve-3d; short spins |
| `perspective-gallery` | Galeri masuk ke vanishing point | Storytelling | heavy; consider 2D alt |
| `layer-z-parallax` | Layer Z beda saat scroll | Immersive heroes | translateZ scrub |
| `flip-board` | Papan flip 3D antar face | Scores, clocks | rotateX segments |
| `hologram-plane` | Plane transparan miring | Futuristic brands | opacity+skew subtle |
| `cardboard-fold` | Lipat seperti cardboard | Packaging stories | transform-origin fold |
| `depth-modals` | Modal di Z di atas dim world | Spatial UIs | scale+blur background |

## Token defaults (quick)

| Scale | Duration | Use |
|-------|----------|-----|
| Micro | 100–200ms | Hover, press, toggles |
| UI | 200–400ms | Panels, fades, drawers |
| Section | 400–700ms | Marketing reveals (sparingly) |

Prefer **ease-out**; animate **`transform` / `opacity`**. Always provide `prefers-reduced-motion: reduce` (cut motion to opacity or instant).

Implementation recipes: `references/motion.md`. Skill entry: `skills/motion/SKILL.md`.

Vocabulary shaped by public motion pattern taxonomies (family/pattern naming). No registry install steps.

<!-- catalog: 12 families, 144 patterns -->
