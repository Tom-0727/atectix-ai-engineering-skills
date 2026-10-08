---
name: fix-and-improve-product
description: Fix bugs and make small improvements to existing product features, UI, or business logic. Do not use for standalone operational tasks such as deployment, service restarts, or status checks, or for adding a distinct new product capability.
---

# Fix and Improve Product

Make focused changes to an existing product without expanding the work into new product development.

## Workflow

1. Understand and locate the problem by inspecting the relevant product context, implementation, and constraints. Search the repository for other instances of the same problem and for every place that implements or describes the affected behavior, including documentation, configuration, and agent instructions.
2. Before modifying the product, stop and align with the user. State only the core logic: the problem and where it occurs, the expected behavior, and the modification approach, including what it removes. Do not begin the modification until the user confirms.
3. After confirmation, implement the smallest complete change and briefly report the result, including what was removed.

Keep the work within the aligned problem and expected behavior. If either changes materially during implementation, stop and realign before continuing. When the user corrects one instance, search for every instance of the same problem and realign on all of them at once.

## Complete change

A change is complete when nothing it supersedes remains:

- Replace or delete the superseded code, documentation, configuration, and instructions instead of adding the new version alongside them.
- Keep no compatibility aliases, branches that preserve the old behavior, or optional modes for anything the change replaces or the user rejects.
- When the affected fact or rule is stated in several places, keep one authoritative statement and make the others refer to it.
- Before reporting, search for the old names and wording to confirm they are gone.
