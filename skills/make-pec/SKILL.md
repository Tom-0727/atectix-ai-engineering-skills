---
name: make-pec
description: Build Product Engineering Context (PEC) in an existing app repository, connecting product behavior and business rules to code and database definitions. Use for initial PEC creation from an implemented app, not product ideation or ongoing PEC updates.
---

# Make PEC

Create `pec/` in the app repository as product engineering context for coding agents. Connect pages, modules, actions, and background tasks to their business rules, dependencies, code, and data.

## Workflow

1. Read the app's code, database definitions, and available product documentation. Use the implementation as the authority when documentation conflicts with it.
2. Identify the product's pages, functional modules, user or system actions, and background tasks. Organize by product meaning, not by components, files, or functions.
3. Trace each product flow through its implementation and data access. Write the PEC nodes and knowledge units using the rules below, including dependencies on other product behavior.
4. Copy this skill's [assets/index.html](assets/index.html) into the app repository as `pec/index.html` to include the PEC browser reader.
5. Check that the identified product flows are covered, references resolve to their intended targets, and the descriptions match the implementation. Report what was created and explain how to open `pec/index.html` and select the `pec/` folder.

When information is insufficient to describe the product or its business behavior, ask the user directly before writing the affected content. Do not invent business rules or intent.

## Directory Structure

```text
pec/
├── index.html
├── pages/
│   └── <page>/
│       ├── _node.md
│       ├── layout.md
│       ├── ui.md
│       ├── logic/
│       │   └── <logic>.md
│       ├── data.md
│       ├── modules/<module>/
│       └── actions/<action>/
└── tasks/
    └── <task>/
        ├── _node.md
        ├── logic/
        │   └── <logic>.md
        └── data.md
```

`pages/` contains user-visible product entry points. Place modules under their page and actions under their module or directly under their page. `tasks/` contains asynchronous, scheduled, message-consuming, or other background tasks.

### Nodes

Every node directory has an `_node.md` containing `id`, `type`, and `title`. Page nodes also contain `route`. Give each node a unique ID for references, such as `action.submit-order`.

Write these fields as YAML frontmatter with single-line values for the reader:

```yaml
---
id: page.orders
type: page
title: Orders
route: /orders
---
```

| Type | Meaning |
| --- | --- |
| `page` | A user-accessible page or product entry point |
| `module` | A distinct functional area within a page |
| `action` | An operation triggered by a user or system |
| `task` | An asynchronous, scheduled, message-consuming, or background task |

### Knowledge Units

Create only the knowledge units that apply to each node. Keep their bodies as free text rather than imposing a complete schema.

| File | Content |
| --- | --- |
| `layout.md` | Structure, regions, and layout |
| `ui.md` | Visual styles and interaction presentation |
| `logic/<logic>.md` | One independent business rule, flow, state, or exception-handling behavior |
| `data.md` | Data objects, fields, formats, sources, and reads and writes |

## References and Reuse

Use these markers within knowledge units to connect related product behavior and its implementation:

| Marker | Target | Example |
| --- | --- | --- |
| `$n:` | PEC node | `$n:action.submit-order` |
| `$k:` | PEC knowledge unit, using its node ID and relative path without `.md` | `$k:action.submit-order/logic/create-order` |
| `$c:` | Code repository, file, or symbol | `$c:order-service/src/orders/create_order.ts#create_order` |
| `$d:` | Database, table, or field | `$d:commerce.orders.status` |

Keep each fact in one authoritative knowledge unit. Reference it from other nodes and record only their local differences. Link business descriptions to the relevant code and database objects so an agent can follow them to the implementation.
