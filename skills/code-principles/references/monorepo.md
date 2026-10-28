# Monorepo

A starting layout for a new product. Keep only the parts the product needs.

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

Each subsection is content for the agent instruction file (`AGENTS.md`, or `CLAUDE.md` for Claude Code) at that path.

### `.`

#### Monorepo

Keep user-facing applications under `apps/`, independently running backend processes under `services/`, and repository-wide automation under `scripts/`. Keep code inside the application or service that owns it, do not add top-level directories or shared packages without a confirmed need, and leave unused template directories unimplemented.

#### Deployment

Define every process's deployment in committed, executable files; do not maintain a separate Markdown deployment specification. Include only required processes, inject configuration through environment variables with a committed `.env.example` and no secrets, and run database migrations explicitly before the API accepts traffic.

- Run processes under the root `compose.yaml` by default, building each from its own Dockerfile and providing health checks.
- Run a process as a systemd user unit when it needs the host user's login state, such as authenticated CLIs or browser profiles. Keep the unit file in the directory of the service that owns it, and enable lingering for that user so the process runs without an active login session.
- Start the complete product with one command from the repository root and stop it with another: `docker compose up --build` and `docker compose down` when every process runs under Compose, otherwise `scripts/up` and `scripts/down`.

### `apps/web/`

Use React with TypeScript.

### `services/api/`

Use FastAPI with Python, PostgreSQL, SQLAlchemy, and Alembic. Treat SQLAlchemy models as the current desired schema and Alembic migrations as its change history. Expose all models through one `Base.metadata` and configure Alembic to use it as `target_metadata`. For every schema change, update the models, create and review a migration, then verify that a clean database upgrades to `head` and `alembic check` passes. Never edit an applied migration, change the database schema manually, use `metadata.create_all`, or maintain a Markdown copy of the physical schema. Keep seed data deterministic, safely repeatable, limited to the core value path and relevant UX states, and free of random filler.
