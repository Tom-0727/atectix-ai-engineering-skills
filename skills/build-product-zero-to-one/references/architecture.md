# Architecture design

Design the smallest implementation-ready architecture for the confirmed MVP.

## Defaults

- Copy the complete contents of `../assets/monorepo_archetypes/` directly into the product repository root. Do not copy the `monorepo_archetypes` directory itself or recreate its structure manually.
- Preserve existing target files and merge existing `AGENTS.md` instructions instead of overwriting them.
- Use React with TypeScript for `apps/web` and FastAPI with Python for `services/api`.
- Deploy the product processes with Docker Compose.
- Treat template directories as available structure, not as processes that must be implemented or deployed.

## Architecture decisions

Read the confirmed MVP PRD and domain model when available. Decide only what the implementation requires.

### Clients and processes

List the clients and independently running processes required by the MVP and define each responsibility. Keep a capability inside the API unless it must start, stop, deploy, or execute independently. The presence of `inference` or `worker` in the template does not justify implementing it.

### Process communication

For each required connection, record the caller, receiver, communication mechanism, whether it is synchronous or asynchronous, the core data exchanged, and which process owns the contract.

### Database design

When the MVP persists data, choose the database and define an implementation-ready physical schema. For each table, record:

- Its purpose.
- Field names and types.
- Required, nullable, and default behavior.
- Primary keys, foreign keys, and uniqueness constraints.
- Relationships and other constraints required by confirmed product behavior.

Do not add tables, fields, indexes, history, audit metadata, or extensibility structures without a confirmed implementation need.

## Artifact

Write `.atectix/zero-to-one-product-build/03-architecture.md` with:

- The copied repository structure.
- Required clients and processes with their responsibilities.
- Communication between processes.
- Docker Compose services that must run.
- The selected database and physical schema, when persistence is required.
