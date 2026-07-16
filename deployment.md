## Deployment Contract

For repos meant to be **container-deployed** to a self-hosted platform. It has
two layers: a universal "deployable repo" baseline (any container host wants
this), and a `vinyard.toml` manifest that declares deploy intent for the
[vinyard](https://github.com/firenzemc/agent-protocol) deploy plane.

The contract carries **intent, never environment values**. Real hosts, ports,
URLs, and secret *values* are supplied by the platform at deploy time — they are
never committed to the repo.

### Deployable-repo baseline (any target)

1. **A `Dockerfile` at the repo root** that builds with no interactive input.
   Use a **multi-arch base image** (e.g. `python:3.13-slim`) — the platform
   rebuilds from the Dockerfile on the target host and never copies images
   between hosts.
2. **Listen on `$PORT`** (default 8080), bound to `0.0.0.0`.
3. **A health signal**: `GET /health` returning HTTP 200 by default. The
   platform gates "live" on it. If the app genuinely can't expose one, declare a
   TCP probe in the manifest (`health = "tcp"`).
4. **Secrets from the environment only** — never baked into the image or
   committed. The app reads them from env vars; the platform injects the values
   at runtime.

Satisfy those four and the repo is deployable. The manifest below tunes how.

### `vinyard.toml` (deploy manifest)

Add one file at the build root (or the `subdir` you deploy from):

```toml
name = "myapp"                 # stable slug; the URL path/port key
port = 8080                    # container port the app listens on
health = "/health"             # HTTP health path; or health = "tcp" for a port probe
health_retries = 60            # optional; probes = retries x 2s (default 60 → 120s).
                               # raise for slow-starting apps (index build, warm-up)
route = "port"                 # "path" | "port"
public_port = 42010            # required when route = "port"; the platform assigns/
                               # coordinates this — pick an unused one, it is not secret
base_path_aware = false        # true only if the app honors a stripped /<name> prefix
pinned = true                  # persistent; excluded from any cleanup
memory = "1g"                  # container limits (defaults: 512m / 1 cpu)
cpus = 1

# persistent data — named docker volumes only (portable across hosts), not host
# bind mounts. Declare the mount path; the platform owns the volume.
[[volumes]]
name = "myapp-data"
mount = "/data"

# runtime secrets/config: list env KEYS the app needs. Values live in the
# platform's secret store, never here or in the image. The platform injects only
# the keys you list (least privilege).
env = ["OPENAI_API_KEY", "OPENAI_BASE_URL"]

[source]                       # optional: deploy from git instead of a local dir
repo = "https://github.com/<you>/<repo>.git"
ref  = "main"
subdir = "apps/myapp"          # if the app lives in a subdirectory
```

### Field rules

- `port` defaults to 8080; `health` defaults to **`tcp`** (a port probe). Set
  `health = "/health"` for an HTTP check.
- `route` defaults to **`port`**. Use `route = "path"` only for base-path-aware
  apps — `base_path_aware` is descriptive; the engine keys off `route`.
- **base_path caveat**: path routing strips the `/<name>` prefix. Apps that emit
  absolute URLs (`/static/...`) break under it — set `base_path_aware = false`
  and use `route = "port"` (or make the app base-path-aware).
- `volumes` are **named docker volumes** (migrate cleanly via `docker volume`
  export/import); declare the mount path only.
- Secrets: list env **keys**; values live in the platform's secret store, never
  in `vinyard.toml` or the image.
- **Git-source authority**: for `[source].repo` deploys, the **repo's own
  `vinyard.toml`** (at the build root / `subdir`) is the source of truth — the
  platform clones first, then reads it. Commit config to the repo; don't rely on
  editing any platform-side copy.

### What the platform owns (not your repo)

The deploy plane supplies these at deploy time — never put them in the repo:

- the target host / tailnet address and the resulting URL,
- the actual **secret values** for the env keys you listed,
- rebuild-from-Dockerfile on the target host, health-gating, routing, and the
  live registry.

Your repo declares *what it needs and how it runs*; the platform decides *where
and with what*.
