#!/usr/bin/env bash
# Remove skills installed from this repository, including names deleted upstream.
# Usage: uninstall.sh [-g]
#   -g  uninstall globally; otherwise uninstall from the current project.
set -euo pipefail

REPO="Tom-0727/atectix-ai-engineering-skills"
skills_cli="skills"

case "${1:-}" in
  "") scope=""; lock="skills-lock.json" ;;
  -g)
    scope="-g"
    skills_cli="skills@1.7.0"
    if [ -n "${XDG_STATE_HOME:-}" ]; then
      lock="$XDG_STATE_HOME/skills/.skill-lock.json"
    else
      user_dir="$(node -p 'require("os").homedir()')"
      lock="$user_dir/.agents/.skill-lock.json"
    fi
    ;;
  *) echo "Usage: uninstall.sh [-g]" >&2; exit 2 ;;
esac
if [ "$#" -gt 1 ]; then
  echo "Usage: uninstall.sh [-g]" >&2
  exit 2
fi

# The lock identifies ownership even when a skill was renamed or deleted upstream.
installed="$(REPO="$REPO" LOCK="$lock" node -e '
const fs = require("fs");
const norm = (s) => typeof s === "string" ? s.toLowerCase()
  .replace(/^(https:\/\/github\.com\/|git@github\.com:)/, "")
  .replace(/\/+$/, "").replace(/\.git$/, "") : "";
let skills = {};
try {
  skills = JSON.parse(fs.readFileSync(process.env.LOCK, "utf8")).skills || {};
} catch (e) {
  if (e.code !== "ENOENT") throw e;
}
for (const [name, s] of Object.entries(skills)) {
  const fromRepo = [s?.source, s?.sourceUrl].some((v) => norm(v) === norm(process.env.REPO));
  if (!fromRepo) continue;
  if (!/^[a-z0-9]+(?:-[a-z0-9]+)*$/.test(name)) {
    throw new Error(`Invalid repository skill name in lock: ${name}`);
  }
  console.log(name);
}
')"

if [ -z "$installed" ]; then
  echo "No skills from $REPO recorded for this scope; nothing changed."
  exit 0
fi

skill_names=()
while IFS= read -r name; do
  skill_names+=("$name")
done <<< "$installed"

echo "Uninstalling skills from $REPO:"
printf '  %s\n' "${skill_names[@]}"
# Do not filter agents: shared .agents copies must also be removed so Codex
# cannot keep loading them after its native .codex copies are removed.
if [ "$scope" = "-g" ]; then
  # The CLI also visits project-only agents during global removal. Run from an
  # empty directory so those fallback paths cannot affect the current project.
  tmp="$(mktemp -d)"
  trap 'rm -rf "$tmp"' EXIT
  (cd "$tmp" && npx --yes "$skills_cli" remove "${skill_names[@]}" -y -g)
  echo "For CC Switch-managed skills, also uninstall them in CC Switch to remove its stored copies and records."
else
  npx --yes "$skills_cli" remove "${skill_names[@]}" -y
fi
