# MVP PRD

## Purpose

Define the first useful product version without expanding into a full roadmap.

## Questions

Answer exactly these four questions:

1. What product-specific concepts, models, and terms exist?
2. Which features does the MVP implement?
3. What does the MVP explicitly not implement?
4. What minimum data must be collected after launch to validate the MVP's core value and acquisition assumptions?

For every included feature, describe enough detail to implement it: the user or actor, trigger, main flow, visible result, important states, and failure or boundary behavior. Do not turn the feature list into technical architecture.

For each validation signal, record the hypothesis, observable behavior or result, data source, observation period, and how the result will be interpreted. Avoid vanity metrics and invented precision.

## Artifact

Write `.atectix/zero-to-one-product-build/02-mvp-prd.md` with:

- Core concepts and terminology.
- Detailed MVP features.
- Explicit MVP exclusions.
- Minimum validation data.

Use product language rather than database tables, APIs, or framework choices.

## PRD exit

Ask the user to confirm that the features form a valuable first version, the exclusions can wait, and the minimum data can test the core assumptions.

## Validation after launch

After implementation, wait for the observation period defined in this PRD. Review each hypothesis and its minimum data with the user, then append a validation section to `02-mvp-prd.md` containing:

- Observation period and data quality.
- Result for each hypothesis.
- User conclusions.
- Evidence-based follow-up TODOs.

Create TODOs only from observed data, implementation findings, or explicit user feedback. Ask the user to confirm the conclusions, then end the zero-to-one workflow.
