# Implementation

## Purpose

Turn the confirmed design into a working, deployed first version.

## Process

1. Inspect the repository, toolchain, and confirmed stage artifacts.
2. Break the MVP into vertical slices that produce observable user value.
3. Record a concise implementation checklist in `06-implementation.md`.
4. Implement one slice at a time across UI, API, data, and services as required.
5. Test in proportion to risk, including the confirmed core journey and important failure states.
6. Build immutable container images, deploy the same images through development to production, and run deployment checks.
7. Implement the confirmed minimum data collection and verify that production data is received correctly.
8. Compare the deployed behavior with every MVP feature and exclusion.
9. After the PRD observation period, review the initial data with the user and append conclusions and TODOs to `02-mvp-prd.md`.

Continue autonomously through safe, in-scope implementation work. Ask the user only when a missing decision materially changes the product, introduces external cost or authority, or conflicts with confirmed artifacts.

## Artifact

Maintain `.atectix/zero-to-one-product-build/06-implementation.md` as a concise execution record containing:

- Current slice and remaining checklist.
- Important implementation decisions that differ from earlier design.
- Test and deployment evidence.
- Data-collection verification.
- MVP acceptance results.

Do not duplicate source code or routine command logs in the artifact.

## Exit

Do not finish at scaffolding or deployment. Exit only when the core journey works, minimum data collection is operational, and the initial PRD validation review is confirmed.
