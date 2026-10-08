# Atectix AI Engineering Skills

## What this repository does

A collection of reusable agent skills for Codex and Claude Code for planning,
building, deploying, and validating AI-native products.

## Install and update

Install with [`skills`](https://github.com/vercel-labs/skills). It stores each
skill once in `.agents/skills/`, which Codex reads directly, and symlinks it into
agent-specific directories such as `.claude/skills/` for Claude Code.

```bash
npx skills add Tom-0727/atectix-ai-engineering-skills --skill '*' -g -a codex -a claude-code -y
npx skills update -g
npx skills remove -g <skill>
```

`-g` installs into `~/.agents/skills/` and `~/.claude/skills/` for all projects.
To install into a single project instead, run `add` from the project's root
without `-g`.

## Other dependencies

### UI/UX Pro Max

From the target project's root, install or refresh the pinned project-level
dependency, choosing the `--ai` value for your agent:

```bash
npx --yes ui-ux-pro-max-cli@2.13.0 init --ai codex --force   # or --ai claude
npx skills add https://github.com/multica-ai/andrej-karpathy-skills --skill karpathy-guidelines -a codex -a claude-code
```
