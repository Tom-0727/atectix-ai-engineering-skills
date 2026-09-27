# Atectix AI Engineering Skills

## What this repository does

A collection of reusable agent skills for Codex and Claude Code for planning,
building, deploying, and validating AI-native products.

## Install and update

Skills from this repository are managed by
[CC Switch](https://github.com/farion1231/cc-switch). It installs directly from
GitHub, stores the source copies in `~/.cc-switch/skills/`, and links each skill
into the application directories it is enabled for.

1. Open **Skills**, then **Discover skills**, and add the repository
   `Tom-0727/atectix-ai-engineering-skills`.
2. Install the skills you want.
3. On each installed skill, enable Codex and Claude as needed.
4. Use **Check updates** to update, and CC Switch's uninstall action to remove.

Do not also install these skills globally with `npx skills`: CC Switch removes or
overwrites files in application directories that are not enabled in its records,
and a copy left in `~/.agents/skills/` bypasses its Codex toggle.

For a project-level install without CC Switch, use
[`skills`](https://github.com/vercel-labs/skills) from the project's root:
`npx skills add Tom-0727/atectix-ai-engineering-skills --skill '*' -a codex -a claude-code`.

## Other dependencies

### UI/UX Pro Max

From the target project's root, install or refresh the pinned project-level
dependency, choosing the `--ai` value for your agent:

```bash
npx --yes ui-ux-pro-max-cli@2.13.0 init --ai codex --force   # or --ai claude
npx skills add https://github.com/multica-ai/andrej-karpathy-skills --skill karpathy-guidelines -a codex -a claude-code
```
