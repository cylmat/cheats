# vitejs

### configure typescript
(https://vite.dev/guide/env-and-mode)

vite-env.d.ts
```
/**
Typescript references for Vite
(ex .svg, .png, .css, modules CSS),
Variables d'environnement : import.meta.env (par exemple MODE, BASE_URL, PROD, DEV, SSR..)
*/

/// <reference types="vite/client" />
/// <reference types="vite-plugin-svgr/client" />
```
