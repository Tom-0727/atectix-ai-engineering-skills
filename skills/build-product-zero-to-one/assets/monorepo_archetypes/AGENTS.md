## Monorepo

Keep user-facing applications under `apps/`, independently running backend processes under `services/`, and repository-wide automation under `scripts/`. Keep code inside the application or service that owns it, do not add top-level directories or shared packages without a confirmed need, and leave unused template directories unimplemented.

## Deployment

Use the root `compose.yaml` as the executable definition for local development and single-host deployment. Include only required processes, build each application process from its own Dockerfile, provide health checks, inject configuration through environment variables with a committed `.env.example` and no secrets, and run database migrations explicitly before the API accepts traffic. Ensure `docker compose up --build` starts the complete product from the repository root and `docker compose down` stops it; do not maintain a separate Markdown deployment specification.
