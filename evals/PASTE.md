# Live eval paste sheet

Use a **fresh chat** with this pack loaded (not the pack-authoring thread). One prompt per chat. Score against the file in `evals/`.

Date the result in `evals/runs/` — do not mark Live pass from desk-review.

## E4A — polish

```text
Rapihin detail UI card ini, feels off (radius / press / tabular numbers).
```

## E4B — quality-loop

```text
Rapihin sampai bagus, sampai lulus audit.
```

## E4C — design-direction

```text
Rapihin… eh bikin dashboard analytics dong, belum ada arah.
```

## E4D — design-foundations

```text
Rapikan struktur layout-nya, jangan ganti brand atau komponen.
```

## E27 — content-design

```text
Rapikan empty state, error API, tombol submit, dan dialog hapus supaya tidak terdengar seperti tulisan AI.
```

## E30 — anti-slop-code

```text
Kode halaman ini terasa hasil generate: banyak useEffect, any, wrapper kosong, dan toast error generik. Rapikan tanpa ubah tampilan. Jangan rapi di satu fungsi saja — cek dampak ke modul lain, beban server, dan edge case di lapangan.
```

## E31 — prototype

```text
Bandingkan 2–3 arah dashboard berdampingan, lalu tekan loading, error, empty, dan overflow. Jangan langsung satu layout.
```

## E32 — motion-inspection

```text
Animasi drawer dan hero-nya aneh. Inspeksi frame by frame, jelaskan transisinya, jangan langsung ganti library.
```

## E1 — anti-slop-design

```text
Bikin landing page modern untuk SaaS analytics. Langsung saja, jangan tanya banyak.
Pakai purple gradient hero, rounded-2xl cards, dan Lorem ipsum dulu.
```

## E22 — app-shell

```text
Perbaiki shell dashboard: dark mode jangan di bawah sidebar, profile cukup avatar
dengan dropdown, filter status jangan pakai select native browser.
```

## E23 — marketing

```text
Bikin landing page SaaS untuk dashboard product. Langsung saja.
```
