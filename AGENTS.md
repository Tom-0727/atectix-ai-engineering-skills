# Repository Structure

```text
.
├── scripts/
│   ├── install.sh
│   └── uninstall.sh
├── skills/
│   └── <skill-name>/
│       ├── SKILL.md
│       ├── agents/
│       │   └── openai.yaml
│       ├── references/
│       ├── scripts/
│       └── assets/
├── tests/
└── .github/workflows/
```

- `scripts/install.sh` installs or updates every skill for Codex and Claude Code with `npx skills` and removes skills deleted upstream.
- `scripts/uninstall.sh` removes skills owned by this repository according to the selected scope's skills lock; `-g` selects global installations.
- `skills/` contains all distributable skills as direct child directories.
- `skills/<skill-name>/SKILL.md` is required; the directory and frontmatter `name` use the same lowercase kebab-case value.
- `agents/openai.yaml` is recommended for Codex skill UI metadata and dependency declarations.
- `references/` contains documentation loaded on demand by the skill.
- `scripts/` inside a skill contains executable helpers distributed with that skill.
- `assets/` contains templates and resources used to produce outputs.
- `tests/` contains repository-wide fixtures, smoke tests, and skill validation tests.
- `.github/workflows/` contains CI validation for the complete skill collection.

# Skill Design Principles

- Write for the agent: state what to inspect, decide, do, and produce; omit tutorials, background exposition, and process reasoning.
- Keep instructions minimal but logically complete, clear, and easy to understand. Remove redundancy without removing the context or structure needed to act correctly.
- Prefer concrete actions and objects over abstract labels or invented frameworks. Use specialized terms only when they are necessary and unambiguous.
- Give each fact one authoritative source. Do not duplicate executable schemas, configuration, or implementation details in Markdown when code or machine-readable files can own them.
- Avoid speculative design. Do not add services, directories, fields, abstractions, extension points, or workflows without a confirmed need.
