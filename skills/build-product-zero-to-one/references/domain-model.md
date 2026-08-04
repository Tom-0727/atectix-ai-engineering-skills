# Domain model

## Purpose

Translate confirmed product concepts and UX behavior into a schema-ready domain definition.

## Process

Define only entities required by the MVP. For each entity, specify:

- Meaning and ownership.
- Fields, field types, required or optional status, and defaults where meaningful.
- Stable identifiers and uniqueness rules.
- Relationships and cardinality.
- Valid states and state transitions.
- Business constraints and deletion behavior.

Add fields or events for MVP validation only when the confirmed PRD requires them. Do not create a generic analytics model.

Distinguish domain fields from implementation metadata. Add indexes, audit fields, soft deletion, versioning, or generic extensibility only when a confirmed query, behavior, or constraint requires them.

## Artifact

Write `.atectix/zero-to-one-product-build/05-domain-model.md`. Use tables for fields and relationships when helpful. Keep names consistent with the MVP PRD and UX terminology.

## Exit

Check that every persisted MVP behavior has a place in the model and every field supports a confirmed behavior. Ask the user to confirm the model before implementation.
