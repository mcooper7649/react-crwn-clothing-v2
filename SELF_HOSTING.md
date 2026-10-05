# Self-hosting

Live at **https://crown.mycodedojo.com**, self-hosted on Michael's homelab (moved off Netlify/Vercel in October 2026).

The homelab builds it from this repo with the `Dockerfile` here and serves the output from a shared nginx container (`portfolio-static`) in the `portfolio-projects` stack (`~/portfolio-projects`, visible in Portainer), behind Caddy.

**Redeploy after pushing to `main`:**

```bash
ssh mcooper@192.168.68.75 '~/portfolio-projects/deploy.sh crown'
```

**Run locally (standalone nginx image):**

```bash
docker build -t crown .
docker run -p 8080:80 crown
```

## Configuration

- **Build-time keys:** `REACT_APP_FIREBASE_*` and `REACT_APP_STRIPE_PUBLISHABLE_KEY` (pass as `--build-arg`). Until they're supplied, the site is served from a copy of the last Netlify build.
