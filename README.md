# Atectix AI Engineering Skills

## What this repository does

A collection of reusable agent skills for Codex and Claude Code for planning,
building, deploying, and validating AI-native products.

## Install and update

Install or update every skill for Codex and Claude Code. Run from the target
project's root for a project-level install, or add `-g` for a global install:

```bash
curl -fsSL https://raw.githubusercontent.com/Tom-0727/atectix-ai-engineering-skills/main/scripts/install.sh | bash
curl -fsSL https://raw.githubusercontent.com/Tom-0727/atectix-ai-engineering-skills/main/scripts/install.sh | bash -s -- -g
```

Rerun the same command to update. It overwrites installed skills with the same
names, including local edits, and removes skills from this repository that were
deleted or renamed upstream. Requires `git` and Node.js.

To install a single skill, use [`skills`](https://github.com/vercel-labs/skills)
directly (add `-g` for global):

```bash
npx skills add Tom-0727/atectix-ai-engineering-skills --skill grill-me -a codex -a claude-code
```

## Other dependencies

### UI/UX Pro Max

From the target project's root, install or refresh the pinned project-level
dependency, choosing the `--ai` value for your agent:

```bash
npx --yes ui-ux-pro-max-cli@2.13.0 init --ai codex --force   # or --ai claude
npx skills add https://github.com/multica-ai/andrej-karpathy-skills --skill karpathy-guidelines -a codex -a claude-code
```
