---
name: refine-skill-instructions
description: Review and refine the instructions in an existing or drafted Codex skill for clarity, concision, concrete wording, single-source ownership, and confirmed scope. Use when the user explicitly asks to critique, simplify, de-duplicate, or tighten SKILL.md content. Do not use to create or scaffold a skill or to design its resources, metadata, or packaging.
---

# Skill Design Principles

- Write for the agent: state what to inspect, decide, do, and produce; omit tutorials, background exposition, and process reasoning.
- Keep instructions minimal but logically complete, clear, and easy to understand. Remove redundancy without removing the context or structure needed to act correctly.
- Prefer concrete actions and objects over abstract labels or invented frameworks. Use specialized terms only when they are necessary and unambiguous.
- Give each fact one authoritative source. Do not duplicate executable schemas, configuration, or implementation details in Markdown when code or machine-readable files can own them.
- Avoid speculative design. Do not add services, directories, fields, abstractions, extension points, or workflows without a confirmed need.
