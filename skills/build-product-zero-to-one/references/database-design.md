# Database design

Design the smallest PostgreSQL schema that preserves the confirmed MVP behavior and data rules.

## Instruction

Read the confirmed domain model and MVP behavior. Decide which facts must remain available after a request or application restart, then map them to the smallest set of tables and fields. Encode identity, ownership, relationships, lifecycle rules, and data rules with appropriate types, nullability, defaults, primary keys, foreign keys, uniqueness, and check constraints.

Check the schema against the MVP's confirmed create, read, update, delete, and lifecycle behavior. Surface unresolved product rules instead of inventing them, and do not add speculative fields, generic metadata, history, soft deletion, extensibility structures, or indexes without a confirmed behavior or query need.

Present only schema choices that change product behavior or data integrity, and align them with the user in conversation before implementation. Do not create or retain a Markdown copy of the physical schema; keep durable business rules in `03-domain-model.md`.
