#!/usr/bin/env bash
# Install or update every skill from this repository for Codex and Claude Code,
# then remove skills from this repository that no longer exist upstream.
# Usage: install.sh [-g]
#   -g  install globally; otherwise install into the current directory's project.
set -euo pipefail
shopt -s nullglob

REPO="Tom-0727/atectix-ai-engineering-skills"
REPO_URL="https://github.com/$REPO.git"

case "${1:-}" in
  "") scope=""; lock="skills-lock.json" ;;
  -g)
    scope="-g"
    if [ -n "${XDG_STATE_HOME:-}" ]; then
      lock="$XDG_STATE_HOME/skills/.skill-lock.json"
    else
      lock="$HOME/.agents/.skill-lock.json"
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

npx --yes skills add "$REPO" --skill '*' -a codex -a claude-code -y $scope
if [ -n "$stale" ]; then
  echo "Removing skills deleted or renamed upstream:" $stale
  npx --yes skills remove $stale -y $scope
fi
