# Atectix AI Engineering Skills

## What this repository does

A collection of reusable Codex skills for planning, building, deploying, and
validating AI-native products. For best results, set reasoning to `xhigh`.

## Install

### Single skill

Install `build-product-zero-to-one`:

```bash
npx skills add Tom-0727/atectix-ai-engineering-skills --skill build-product-zero-to-one --agent codex
```

Rerun the same command to update it.

### Codex plugin

Install:

```bash
codex plugin marketplace add Tom-0727/atectix-ai-engineering-skills
codex plugin add atectix-ai-engineering-skills@atectix
```

Update:

```bash
codex plugin marketplace upgrade atectix
codex plugin add atectix-ai-engineering-skills@atectix
```

## Other dependencies

### UI/UX Pro Max

From the target project's root, install or refresh the pinned project-level
dependency:

```bash
npx --yes ui-ux-pro-max-cli@2.13.0 init --ai codex --force
npx skills add https://github.com/multica-ai/andrej-karpathy-skills --skill karpathy-guidelines
```
