---
name: code-principles
description: Principles for writing and changing code so that the code itself stays the authoritative product context. Use when writing, modifying, or reviewing code, or when creating a new product repository.
---

# Code Principles

The code is the product. Keep what an agent needs to change it correctly inside the code, where every change sees and updates it.

- Explain business rules where they are implemented: state the rule and why it exists, not what the code does. When a change alters the rule, update its explanation in the same change.
- Do not maintain Markdown copies of behavior, schemas, configuration, or deployment that code or machine-readable files already define.
- Avoid speculative design. Do not add abstractions, extension points, configuration, or directories without a confirmed need.

## New products

When creating a new product repository, borrow from [monorepo.md](references/monorepo.md) and adapt it to the product.
