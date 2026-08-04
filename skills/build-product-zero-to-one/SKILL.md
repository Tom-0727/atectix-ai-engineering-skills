---
name: build-product-zero-to-one
description: Guide a user from a raw product idea to a deployed and validated first version. Use when the user wants to create a new product, turn an idea into an MVP, define the business and product requirements, design the architecture, UX, and domain model, implement the product, or resume an existing zero-to-one product build from `.atectix/zero-to-one-product-build/` artifacts.
---

# Build Product Zero to One

Guide one product through six stages: BRD, MVP PRD, architecture, UX design, domain model, and implementation. MVP PRD includes both the validation plan and its post-launch results. End after the first deployed version completes its initial data review.

## Global rules

- Optimize for the smallest useful first version. Do not design for hypothetical scale, reuse, or future product lines.
- Ask only questions that materially affect the current stage. Prefer one small group of high-information questions over a full questionnaire.
- Separate confirmed facts from assumptions. State consequential assumptions and ask the user to confirm them.
- Preserve the user's decisions and existing work. Do not restart a completed stage when resuming.
- Do not mark a stage confirmed without explicit user confirmation.
- Allow the user to merge, revisit, or skip a stage explicitly; record that decision.
- If an upstream decision changes, retain downstream artifacts but recheck the affected decisions before continuing.
- Keep credentials and secrets outside all `.atectix/` artifacts.

## State and artifacts

Store workflow artifacts under:

```text
.atectix/
└── zero-to-one-product-build/
    ├── status.md
    ├── 01-brd.md
    ├── 02-mvp-prd.md
    ├── 03-architecture.md
    ├── 04-ux-design.md
    ├── 05-domain-model.md
    └── 06-implementation.md
```

Create a stage artifact when that stage starts; do not create empty future artifacts. Copy [assets/status.md](assets/status.md) when initializing the workflow.

Use `pending`, `active`, and `confirmed` in `status.md`. The Agent may set a stage to `active`; only explicit user approval can set it to `confirmed`.

If `status.md` is missing or stale, inspect existing artifacts and product code, infer the last reliable stage, recreate the status file, and tell the user what was inferred. Treat artifacts and actual code as stronger evidence than stale status text.

## Stage routing

Work on only the current stage and load only its reference plus any directly named prerequisite:

| Stage | Reference | Artifact | Exit condition |
| --- | --- | --- | --- |
| 1. BRD | [brd.md](references/brd.md) | `01-brd.md` | Four business questions confirmed |
| 2. MVP PRD | [mvp-prd.md](references/mvp-prd.md) | `02-mvp-prd.md` | Concepts, features, exclusions, and minimum validation data confirmed |
| 3. Architecture | [architecture.md](references/architecture.md) and [monorepo_archetypes.md](references/monorepo_archetypes.md) | `03-architecture.md` | Runtime units, repo layout, and deployment shape confirmed |
| 4. UX Design | [ux-design.md](references/ux-design.md) | `04-ux-design.md` | Core journey, screens, interactions, and states confirmed |
| 5. Domain Model | [domain-model.md](references/domain-model.md) | `05-domain-model.md` | Entities, fields, relationships, constraints, and transitions confirmed |
| 6. Implementation | [implementation.md](references/implementation.md) and [mvp-prd.md](references/mvp-prd.md) | `06-implementation.md` and `02-mvp-prd.md` | MVP deployed, initial data reviewed, and evidence-based TODOs confirmed |

## Operating loop

1. Locate the repository root and read `.atectix/zero-to-one-product-build/status.md` if present.
2. Determine the current stage from status, artifacts, code, and the user's request.
3. Read the reference for that stage completely.
4. Ask for missing consequential information while continuing with safe assumptions where possible.
5. Write or update the stage artifact as decisions become clear.
6. Present the artifact for review and request explicit confirmation before advancing.
7. Update `status.md`, then begin the next stage only when the user asks to continue or the current request clearly includes it.

During implementation, keep working through coding, tests, deployment, and data-collection verification while safe in-scope work remains. Record progress and evidence in `06-implementation.md`; keep real source code in the normal product directories.

## Completion

Complete this workflow only when the first product version is deployed and the validation section of `02-mvp-prd.md` records the initial data review, conclusions, and evidence-based TODOs. Do not extend this Skill into ongoing feature iteration, growth optimization, or platform engineering.
