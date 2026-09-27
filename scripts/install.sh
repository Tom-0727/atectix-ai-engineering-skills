#!/usr/bin/env bash
# Install or update every skill from this repository for Codex and Claude Code,
# then remove skills from this repository that no longer exist upstream.
# Usage: install.sh [-g]
#   -g  install globally; otherwise install into the current directory's project.
set -euo pipefail
shopt -s nullglob

REPO="Tom-0727/atectix-ai-engineering-skills"
REPO_URL="https://github.com/$REPO.git"
skills_cli="skills"
copy_mode=""

case "${1:-}" in
  "") scope=""; lock="skills-lock.json" ;;
  -g)
    scope="-g"
    # Pin the CLI because the relocation below depends on its global layout.
    skills_cli="skills@1.7.0"
    copy_mode="--copy"
    user_dir="$(node -p 'require("os").homedir()')"
    agents_skills="$user_dir/.agents/skills"
    codex_skills="${CODEX_HOME:-$user_dir/.codex}/skills"
    claude_skills="${CLAUDE_CONFIG_DIR:-$user_dir/.claude}/skills"
    if [ -n "${XDG_STATE_HOME:-}" ]; then
      lock="$XDG_STATE_HOME/skills/.skill-lock.json"
    else
      lock="$user_dir/.agents/.skill-lock.json"
    fi
    mkdir -p "$agents_skills" "$codex_skills" "$claude_skills"
    agents_real="$(cd "$agents_skills" && pwd -P)"
    codex_real="$(cd "$codex_skills" && pwd -P)"
    claude_real="$(cd "$claude_skills" && pwd -P)"
    if [ "$agents_real" = "$codex_real" ] || [ "$agents_real" = "$claude_real" ] || [ "$codex_real" = "$claude_real" ]; then
      echo "Global skills directories must be separate for CC Switch to manage them." >&2
      exit 1
    fi
    ;;
  *) echo "Usage: install.sh [-g]" >&2; exit 2 ;;
esac

tmp="$(mktemp -d)"
trap 'rm -rf "$tmp"' EXIT
git clone --quiet --depth 1 "$REPO_URL" "$tmp/repo"
upstream=""
for f in "$tmp"/repo/skills/*/SKILL.md; do
  upstream+="$(basename "$(dirname "$f")")"$'\n'
done
if [ -z "$upstream" ]; then
  echo "No skills found in $REPO_URL; nothing changed." >&2
  exit 1
fi

stale="$(UPSTREAM="$upstream" REPO="$REPO" LOCK="$lock" node -e '
const fs = require("fs");
const norm = (s) => (s || "").toLowerCase()
  .replace(/^(https:\/\/github\.com\/|git@github\.com:)/, "")
  .replace(/\.git$/, "").replace(/\/+$/, "");
const upstream = new Set(process.env.UPSTREAM.split("\n").filter(Boolean));
let skills = {};
try {
  skills = JSON.parse(fs.readFileSync(process.env.LOCK, "utf8")).skills || {};
} catch (e) {
  if (e.code !== "ENOENT") throw e;
}
for (const [name, s] of Object.entries(skills)) {
  const fromRepo = [s.source, s.sourceUrl].some((v) => norm(v) === norm(process.env.REPO));
  if (fromRepo && !upstream.has(name)) console.log(name);
}
')"

npx --yes "$skills_cli" add "$REPO" --skill '*' -a codex -a claude-code -y $scope $copy_mode
if [ "$scope" = "-g" ]; then
  # --copy gives Claude independent files, but Codex still uses .agents/skills.
  # Check every source before replacing any existing Codex installation.
  for f in "$tmp"/repo/skills/*/SKILL.md; do
    name="$(basename "$(dirname "$f")")"
    if [ ! -f "$agents_skills/$name/SKILL.md" ]; then
      echo "Missing installed skill: $agents_skills/$name; Codex relocation stopped." >&2
      exit 1
    fi
  done
  for f in "$tmp"/repo/skills/*/SKILL.md; do
    name="$(basename "$(dirname "$f")")"
    rm -rf -- "$codex_skills/$name"
    mv -- "$agents_skills/$name" "$codex_skills/$name"
  done
  echo "Global skills installed in $codex_skills and $claude_skills."
fi
if [ -n "$stale" ]; then
  echo "Removing skills deleted or renamed upstream:" $stale
  if [ "$scope" = "-g" ]; then
    # Keep the CLI's project-only cleanup paths away from the current project.
    (cd "$tmp" && npx --yes "$skills_cli" remove $stale -y -g)
  else
    npx --yes "$skills_cli" remove $stale -y
  fi
fi
