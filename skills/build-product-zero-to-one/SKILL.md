---
name: build-product-zero-to-one
description: Help users shape and ship the smallest useful version of a product. Use when the user wants to create a product, define its business case or MVP, plan validation, design its architecture, UX, or domain model, implement or deploy it, review initial evidence, or resume work from `.atectix/zero-to-one-product-build/` artifacts.
---

# Build Product Zero to One

Help the user make connected business, product, design, technical, and implementation decisions for one product. Support both end-to-end product creation and focused work on any relevant concern.

## Operating principles

- Optimize for the smallest useful first version. Do not design for hypothetical scale, reuse, or future product lines.
- Let the user's current goal determine the scope and the capabilities required.
- Ask only questions that materially affect the current decision. Prefer one small group of high-information questions over a full questionnaire.
- Align before making product decisions. Research may precede alignment when it provides evidence the user needs to decide.
- Preserve confirmed decisions until the user or new evidence changes them. Mark assumptions and unresolved questions explicitly.
- Use the references as reasoning frameworks, not as a mandatory sequence, checklist, or confirmation ritual.

## Shared product context

Store durable product decisions under:

```text
.atectix/
└── zero-to-one-product-build/
    ├── 01-brd.md
    ├── 02-mvp-prd.md
    ├── 03-architecture.md
    ├── 04-ux-design.md
    ├── 05-domain-model.md
    └── 06-implementation.md
```

Treat these files as topic-based records that share context. Their numeric prefixes provide stable ordering on disk, not a required execution order. Create or update only the records affected by the user's work; do not create empty placeholders.

When starting or resuming, use the user's request and relevant existing records to understand established decisions, evidence, assumptions, conflicts, and open questions. Do not infer progress from the highest-numbered file.

## Capability routing

Select one or more capabilities according to the user's goal. Load each selected reference and any existing records that materially inform the decision.

| Product need | Reference | Persistent record |
| --- | --- | --- |
| Clarify users, pain, differentiation, or initial acquisition | [brd.md](references/brd.md) | `01-brd.md` |
| Define MVP concepts, scope, exclusions, or validation evidence | [mvp-prd.md](references/mvp-prd.md) | `02-mvp-prd.md` |
| Choose runtime boundaries, repository shape, or deployment design | [architecture.md](references/architecture.md) and, when relevant, [monorepo_archetypes.md](references/monorepo_archetypes.md) | `03-architecture.md` |
| Design journeys, interactions, interface states, or UX artifacts | [ux-design.md](references/ux-design.md) | `04-ux-design.md` |
| Define entities, relationships, constraints, or transitions | [domain-model.md](references/domain-model.md) | `05-domain-model.md` |
| Implement, deploy, or verify the product | Relevant confirmed product records; use [mvp-prd.md](references/mvp-prd.md) when planning or reviewing validation | `06-implementation.md`, plus `02-mvp-prd.md` for validation results |

These capabilities are neither mandatory nor sequential. Combine them when a decision crosses concerns, and revisit them when implementation findings, research, validation evidence, or user feedback changes the product.

## Keep decisions coherent

- Trace features, UX, domain concepts, architecture, and implementation choices to the confirmed product need and MVP scope.
- Keep terminology and consequential decisions consistent across affected records.
- Surface contradictions instead of silently choosing between conflicting records. Ask the user only when resolving the conflict requires a product decision.
- When work changes an established decision, update every affected record and preserve the reason for the change.
- Do not require confirmation after every record. Seek alignment when the user must choose a direction or when an assumption would materially change the product.

## Match the requested outcome

For focused work, complete the requested decision, artifact, or implementation outcome without forcing unrelated capabilities. For an end-to-end request, continue until the smallest useful version is deployed and its initial validation evidence has been interpreted. Follow actual decision dependencies and discoveries rather than completing every capability once in numeric order.
