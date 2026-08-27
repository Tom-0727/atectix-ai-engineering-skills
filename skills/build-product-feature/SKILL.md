---
name: build-product-feature
description: Design and implement a distinct new feature in an existing, working product. Use when the request adds a product capability that requires product definition and implementation planning. Do not use for creating a product's first useful version or for fixes and small adjustments to existing behavior.
---

# Build Product Feature

Add a coherent product capability without reopening the design of the whole product.

## Feature context

Store the confirmed decisions for each feature under:

```text
.atectix/
└── product-features/
    └── <feature-slug>/
        ├── 01-prd.md
        └── 02-implementation-plan.md
```

Use one stable, descriptive feature slug. Read existing product context and any records for the feature before continuing. Keep the records concise and current; do not create empty placeholders or duplicate decisions between them.

## Workflow

1. Understand the feature request and the existing product. Read [prd.md](references/prd.md), write `01-prd.md`, then stop and ask the user to confirm it. Do not design the implementation before the PRD is confirmed.
2. Based on the confirmed PRD and the existing system, read [implementation-plan.md](references/implementation-plan.md), write `02-implementation-plan.md`, then stop and ask the user to confirm it. Do not implement the feature before the plan is confirmed.
3. Implement the confirmed feature and plan. If implementation requires a material change to either record, stop, realign with the user, and update the affected record before continuing.
4. Briefly report the result.
