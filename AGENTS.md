# Repository Structure

```text
.
├── .codex-plugin/
│   └── plugin.json
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

- `.codex-plugin/plugin.json` is required and declares this repository as a skills-only plugin with `"skills": "./skills/"`.
- `skills/` contains all distributable skills as direct child directories.
- `skills/<skill-name>/SKILL.md` is required; the directory and frontmatter `name` use the same lowercase kebab-case value.
- `agents/openai.yaml` is recommended for skill UI metadata and dependency declarations.
- `references/` contains documentation loaded on demand by the skill.
- `scripts/` inside a skill contains executable helpers distributed with that skill.
- `assets/` contains templates and resources used to produce outputs.
- `tests/` contains repository-wide fixtures, smoke tests, and skill validation tests.
- `.github/workflows/` contains CI validation for the complete skill collection.
