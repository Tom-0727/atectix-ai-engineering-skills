# Atectix AI Engineering Skills

## What this repository does

A collection of reusable agent skills for Codex and Claude Code for building
AI-native products.

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
