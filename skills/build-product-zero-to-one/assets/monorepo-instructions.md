# Monorepo Instructions

## Directory layout

```text
.
├── apps/
│   └── web/
├── services/
│   ├── api/
│   ├── worker/
│   └── inference/
└── scripts/
```

## Instructions by path

Each subsection is the content of the agent instruction file at that path.

### `.`

#### Monorepo

Keep user-facing applications under `apps/`, independently running backend processes under `services/`, and repository-wide automation under `scripts/`. Keep code inside the application or service that owns it, do not add top-level directories or shared packages without a confirmed need, and leave unused template directories unimplemented.

#### Deployment

Use the root `compose.yaml` as the executable definition for local development and single-host deployment. Include only required processes, build each application process from its own Dockerfile, provide health checks, inject configuration through environment variables with a committed `.env.example` and no secrets, and run database migrations explicitly before the API accepts traffic. Ensure `docker compose up --build` starts the complete product from the repository root and `docker compose down` stops it; do not maintain a separate Markdown deployment specification.

### `apps/web/`

Use React with TypeScript.

### `services/api/`

Use FastAPI with Python, PostgreSQL, SQLAlchemy, and Alembic. Treat SQLAlchemy models as the current desired schema and Alembic migrations as its change history. Expose all models through one `Base.metadata` and configure Alembic to use it as `target_metadata`. For every schema change, update the models, create and review a migration, then verify that a clean database upgrades to `head` and `alembic check` passes. Never edit an applied migration, change the database schema manually, use `metadata.create_all`, or maintain a Markdown copy of the physical schema. Keep seed data deterministic, safely repeatable, limited to the core value path and relevant UX states, and free of random filler.
