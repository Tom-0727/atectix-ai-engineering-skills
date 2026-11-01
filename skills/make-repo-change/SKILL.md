---
name: make-repo-change
description: Make changes to an existing repository's code, docs, configuration, or agent instructions (AGENTS.md, skills, prompts). Not for standalone operational tasks such as deployment, or tightening one skill's wording (use refine-skill-instructions).
---

# Make Repo Change

Make focused changes to an existing repository.

## Workflow

1. Understand and locate the problem by inspecting the relevant repository context, implementation, and constraints. Search the repository for other instances of the same problem and for every place that implements or describes the affected behavior, including documentation, configuration, and agent instructions.
2. Before modifying the repository, stop and align with the user. State only the core logic: the problem and where it occurs, the expected behavior, and the modification approach, including what it removes. Do not begin the modification until the user confirms.
3. After confirmation, implement the smallest complete change, commit only the files it touches, and briefly report the result, including what was removed.

Keep the work within the aligned problem and expected behavior. If either changes materially during implementation, stop and realign before continuing. When the user corrects one instance, search for every instance of the same problem and realign on all of them at once.

## Complete change

A change is complete when nothing it supersedes or leaves unused remains:

- Replace or delete the superseded code, documentation, configuration, and instructions instead of adding the new version alongside them, and delete the code and configuration the change leaves unused.
- Keep no compatibility aliases, branches that preserve the old behavior, or optional modes for anything the change replaces or the user rejects.
- When the affected fact or rule is stated in several places, keep one authoritative statement and make the others refer to it.
- Before committing, remove the drafts, scratch files, and other intermediate artifacts produced during the work.
- Before reporting, search for the old names and wording to confirm they are gone.
