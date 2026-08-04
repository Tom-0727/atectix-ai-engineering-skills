# Product monorepo archetype

## Default structure

Use this structure for a 0-to-1 product that may have Web and mobile clients, a shared API, and independently deployable algorithm processes:

```text
.
├── apps/
│   ├── web/                     # Web client
│   └── mobile/                  # Mobile client
├── services/
│   ├── api/                     # Shared product backend
│   ├── inference/               # Model or algorithm runtime
│   └── worker/                  # Asynchronous jobs
├── scripts/
│   └── deploy                   # Stable deployment entrypoint
└── compose.yaml                 # Explicit server deployment units
```

Include only the directories required by the product.

## Directory semantics

`apps/` contains clients used directly by users. Web may be containerized for server deployment; mobile is built and released through its platform toolchain and does not participate in server-side Compose.

`services/` contains independently running server processes. Each service owns its runtime dependencies, Dockerfile, startup command, tests, and health check.

`services/api` is the shared backend for Web and mobile. Keep authentication, database migrations, database access, object-storage integration, and business logic inside the API until repeated use establishes a real extraction boundary.

Create a separate inference or worker service when it needs a different runtime, dependency set, compute profile, lifecycle, or scaling behavior from the API.

## Compose contract

Declare every server deployment unit explicitly. Directory presence alone never causes deployment.

```yaml
services:
  web:
    image: "${WEB_IMAGE}"
    build: ./apps/web

  api:
    image: "${API_IMAGE}"
    build: ./services/api

  inference:
    image: "${INFERENCE_IMAGE}"
    build: ./services/inference
```

Omit services that the product does not use. Give each declared service a health check and a deterministic image tag.

## Version and deployment flow

1. Manage source versions in Git.
2. Build container images once for a Git commit.
3. Tag images with the commit SHA or another immutable identifier.
4. Deploy those images to development.
5. Promote the exact same images to production after validation.

Branches may trigger deployments, but they do not provide environment isolation. Runtime environment configuration selects the development or production dependencies.

## Repository boundary

Keep clients, API, workers, and algorithm services in the same repository while they belong to one product and commonly change together. Move a service to another repository only after it becomes a shared product with independent ownership, releases, and compatibility commitments.
