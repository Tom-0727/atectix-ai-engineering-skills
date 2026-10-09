---
name: make-repo-change
description: Make changes to an existing repository's code, docs, configuration, or agent instructions (AGENTS.md, skills, prompts), including fixing, adjusting, optimizing, refactoring, de-duplicating, renaming, and removing. Not for new product capabilities, standalone operational tasks such as deployment, or tightening one skill's wording (use refine-skill-instructions).
---

# Make Repo Change

Make focused changes to an existing repository without expanding the work into new product development. Make each change in its own git worktree so that several agents can work in the same repository at once.

## Workflow

1. Run `git worktree list`. If a `change/<task-slug>` branch belongs to this task, work in that worktree and continue from what its latest commit message says awaits user confirmation.
2. Understand and locate the problem by inspecting the relevant repository context, implementation, and constraints. Search the repository for other instances of the same problem and for every place that implements or describes the affected behavior, including documentation, configuration, and agent instructions.
3. Before modifying the repository, stop and align with the user. State only the core logic: the problem and where it occurs, the expected behavior, and the modification approach, including what it removes. Do not begin the modification until the user confirms.
4. After confirmation, create the worktree, implement the smallest complete change in it, commit the change on the task branch, and briefly report the result, including what was removed, the branch, and the worktree path.

Keep the work within the aligned problem and expected behavior. If either changes materially during implementation, commit all changes in the worktree as a WIP commit whose message states what awaits user confirmation, then stop and realign before continuing. When the user corrects one instance, search for every instance of the same problem and realign on all of them at once.

## Worktree

- From the repository root, run `git worktree add -b change/<task-slug> ../<repo-name>.worktrees/<task-slug> <default-branch>`. Use a short kebab-case slug that names the task; if the branch already exists for another task, choose a different slug.
- Make every modification inside the worktree; do not modify the original checkout.
- After the user merges or abandons the branch, remove the worktree with `git worktree remove` and delete the branch.

## Complete change

A change is complete when nothing it supersedes remains:

- Replace or delete the superseded code, documentation, configuration, and instructions instead of adding the new version alongside them.
- Keep no compatibility aliases, branches that preserve the old behavior, or optional modes for anything the change replaces or the user rejects.
- When the affected fact or rule is stated in several places, keep one authoritative statement and make the others refer to it.
- Before reporting, search for the old names and wording to confirm they are gone.
