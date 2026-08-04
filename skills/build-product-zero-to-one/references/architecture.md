# Architecture design

## Purpose

Choose the smallest technical shape that can implement and deploy the confirmed MVP.

## Process

1. Read the confirmed BRD and MVP PRD.
2. Identify required clients and independently running server processes.
3. Read [monorepo_archetypes.md](monorepo_archetypes.md).
4. Select only the directories and services required by the MVP.
5. Record the chosen runtime, key external dependencies, service boundaries, repository tree, and deployment flow.

Prefer one product monorepo and a single-machine Docker Compose deployment for the first version unless an MVP requirement makes that impossible. Keep authentication, database access, migrations, object-storage integration, and business logic inside the API until a real independent runtime boundary exists.

## Artifact

Write `.atectix/zero-to-one-product-build/03-architecture.md` with:

- Technology choices that materially affect implementation.
- Clients and server processes.
- Repository tree.
- Service responsibilities and communication.
- Compose deployment shape and image promotion flow.
- Consequential constraints or assumptions.

Do not add scale forecasts, multi-region designs, speculative shared platforms, or abstraction layers unrelated to the MVP.

## Exit

Ask the user to confirm that the architecture can deliver every MVP feature and contains no component justified only by possible future needs.
