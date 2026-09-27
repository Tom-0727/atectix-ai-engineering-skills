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

The global script uses `skills@1.7.0` in copy mode, then moves this repository's
Codex skills from `~/.agents/skills/` to `~/.codex/skills/`. Claude gets independent
copies in `~/.claude/skills/`, replacing any previous links to the shared directory.
`CODEX_HOME` and `CLAUDE_CONFIG_DIR` override the respective application roots.
Other skills in `~/.agents/skills/` are left in place.

In CC Switch, use **Import existing** for new skills and enable Codex for skills
already listed. Keep its source storage at `~/.cc-switch/skills/` so shared skills
do not bypass application toggles. Once CC Switch manages a skill, use it for
updates; rerunning this script reinstalls both applications independently of
CC Switch's saved enable/disable state.

To install a single skill, use [`skills`](https://github.com/vercel-labs/skills)
directly (add `-g` for its default global layout, which uses `~/.agents/skills/`
for Codex rather than the global script's CC Switch layout):

```bash
npx skills add Tom-0727/atectix-ai-engineering-skills --skill grill-me -a codex -a claude-code
```

## Uninstall

Run from the target project's root, or add `-g` to remove global installations:

```bash
curl -fsSL https://raw.githubusercontent.com/Tom-0727/atectix-ai-engineering-skills/main/scripts/uninstall.sh | bash
curl -fsSL https://raw.githubusercontent.com/Tom-0727/atectix-ai-engineering-skills/main/scripts/uninstall.sh | bash -s -- -g
```

The script reads the scope's skills lock and removes only names recorded as coming
from this repository, including skills deleted or renamed upstream. It removes
those skills from all agent directories, including the new `~/.codex/skills/`
location and any old `~/.agents/skills/` copies, and updates the lock. Local edits
inside those skills are removed too. Unrelated skills are preserved. Without
matching lock entries, it makes no changes. Requires Node.js and npm.

For skills managed by CC Switch, use its uninstall action to remove its stored
copies and database records as well; this script does not modify CC Switch's
database. The scripts' global lock defaults to `~/.agents/.skill-lock.json`, or
`$XDG_STATE_HOME/skills/.skill-lock.json` when configured.

## Other dependencies

### UI/UX Pro Max

From the target project's root, install or refresh the pinned project-level
dependency, choosing the `--ai` value for your agent:

```bash
npx --yes ui-ux-pro-max-cli@2.13.0 init --ai codex --force   # or --ai claude
npx skills add https://github.com/multica-ai/andrej-karpathy-skills --skill karpathy-guidelines -a codex -a claude-code
```
