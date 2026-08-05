---
name: build-product-zero-to-one
description: Guide a user from a raw product idea to a deployed and validated first version. Use when the user wants to create a new product, turn an idea into an MVP, define the business and product requirements, design the architecture, UX, and domain model, implement the product, or resume an existing zero-to-one product build from `.atectix/zero-to-one-product-build/` artifacts.
---

# Build Product Zero to One

Guide one product through six stages: BRD, MVP PRD, architecture, UX design, domain model, and implementation. MVP PRD includes both the validation plan and its post-launch results. End after the first deployed version completes its initial data review.

## Global rules

- Optimize for the smallest useful first version. Do not design for hypothetical scale, reuse, or future product lines.
- Ask only questions that materially affect the current stage. Prefer one small group of high-information questions over a full questionnaire.
- Align before making product decisions. Research may precede alignment when it provides evidence the user needs to decide.

## Artifacts

Store workflow artifacts under:

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

When starting or resuming, use the files that exist and their contents to determine the current stage and what remains.

## Stage routing

Work on only the current stage and load only its reference plus any directly named prerequisite:

| Stage | Reference | Artifact | Exit condition |
| --- | --- | --- | --- |
| 1. BRD | [brd.md](references/brd.md) and `$deep-research` | `01-brd.md` | Market research complete and four business questions confirmed |
| 2. MVP PRD | [mvp-prd.md](references/mvp-prd.md) | `02-mvp-prd.md` | Concepts, features, exclusions, and minimum validation data confirmed |
| 3. Architecture | [architecture.md](references/architecture.md) and [monorepo_archetypes.md](references/monorepo_archetypes.md) | `03-architecture.md` | Runtime units, repo layout, and deployment shape confirmed |
| 4. UX Design | [ux-design.md](references/ux-design.md) | `04-ux-design.md` | Core journey, screens, interactions, and states confirmed |
| 5. Domain Model | [domain-model.md](references/domain-model.md) | `05-domain-model.md` | Entities, fields, relationships, constraints, and transitions confirmed |
| 6. Implementation | [mvp-prd.md](references/mvp-prd.md) | `06-implementation.md` and `02-mvp-prd.md` | MVP deployed, initial data reviewed, and evidence-based TODOs confirmed |
