# Domain model

Treat the domain model as the product's shared semantics, not as a database schema.

- Derive the model from confirmed behavior and product language. Model only distinctions that affect product behavior or invariants.
- Consider identity, ownership, relationships, and lifecycle only where relevant; they are reasoning lenses, not required sections.
- Distinguish facts from derived values and current state from history when the distinction affects behavior or integrity.
- Keep persistence, frameworks, analytics, and implementation metadata out unless they carry confirmed domain meaning.
- Surface consequential ambiguity instead of inventing rules.
