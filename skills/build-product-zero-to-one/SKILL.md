---
name: build-product-zero-to-one
description: Help users shape and ship a new product from idea to its first useful version. Use when defining, designing, implementing, deploying, validating, or resuming a product that has not yet completed its zero-to-one stage. Do not use for fixes, behavior adjustments, or small improvements to an existing working product; use fix-and-improve-product instead.
---

# Build Product Zero to One

Help the user make connected business, product, design, technical, and implementation decisions for one product. Support both end-to-end product creation and focused work required to reach its first useful version.

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
    ├── 03-domain-model.md
    ├── 04-ux-design.md
    └── 05-architecture.md
```

Treat these files as topic-based records that share context. Their numeric prefixes provide stable ordering on disk, not a required execution order. Create or update only the records affected by the user's work; do not create empty placeholders.

For end-to-end work, use BRD → MVP PRD → domain model ↔ UX → architecture → implementation as the default dependency order. Revisit earlier decisions when later work reveals new evidence.

When starting or resuming, use the user's request and relevant existing records to understand established decisions, evidence, assumptions, conflicts, and open questions. Do not infer progress from the highest-numbered file.

## Capability routing

Select one or more capabilities according to the user's goal. Load each selected reference and any existing records that materially inform the decision.

| Product need | Reference | Persistent record |
| --- | --- | --- |
| Clarify users, pain, differentiation, or initial acquisition | [brd.md](references/brd.md) | `01-brd.md` |
| Define MVP concepts, scope, exclusions, or validation evidence | [mvp-prd.md](references/mvp-prd.md) | `02-mvp-prd.md` |
| Define entities, relationships, constraints, or transitions | [domain-model.md](references/domain-model.md) | `03-domain-model.md` |
| Design journeys, interactions, interface states, or UX artifacts | [ux-design.md](references/ux-design.md) | `04-ux-design.md` |
| Turn core experience, quality, or delivery risks into consequential technical decisions | [architecture.md](references/architecture.md) | `05-architecture.md` |
| Design PostgreSQL tables, fields, relationships, or constraints from confirmed product behavior | [database-design.md](references/database-design.md) | Product rules in `03-domain-model.md`; schema in implementation files |
| Implement, deploy, or verify the first product version | Relevant confirmed product records; use [mvp-prd.md](references/mvp-prd.md) when planning or reviewing validation | `02-mvp-prd.md` for validation results |

These capabilities are neither mandatory nor sequential. Combine them when a decision crosses concerns, and revisit them when implementation findings, research, validation evidence, or user feedback changes the product.

## Keep decisions coherent

- Keep each record concise, clear, and easy to understand. Record current decisions rather than the reasoning process, and do not repeat information already maintained in another record.
- Trace features, UX, domain concepts, architecture, and implementation choices to the confirmed product need and MVP scope.
- Keep terminology and consequential decisions consistent across affected records.
- Surface contradictions instead of silently choosing between conflicting records. Ask the user only when resolving the conflict requires a product decision.
- When work changes an established decision, update every affected record and preserve the reason for the change.
- Do not require confirmation after every record. Seek alignment when the user must choose a direction or when an assumption would materially change the product.

## Match the requested outcome

For focused work, complete the requested decision, artifact, or implementation outcome without forcing unrelated capabilities. Before first implementation, copy the contents of `assets/monorepo_archetypes/` into the product repository root, preserve existing files, and merge applicable `AGENTS.md` instructions. For an end-to-end request, continue until the smallest useful version is deployed and its initial validation evidence has been interpreted. Follow actual decision dependencies and discoveries rather than completing every capability once in numeric order.
