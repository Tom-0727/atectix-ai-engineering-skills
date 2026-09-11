---
name: make-pec
description: Build Product Engineering Context (PEC) in an existing app repository, connecting product behavior and business rules to code and database definitions. Use for initial PEC creation from an implemented app, not product ideation or ongoing PEC updates.
---

# Make PEC

Create `pec/` in the app repository so people and coding agents can understand the product's behavior and execution mechanisms, and locate their implementation and data. Document the logic in PEC itself; code and database references provide evidence and navigation, not substitutes for explanations.

## Workflow

1. Survey the app's entry points, routing, database definitions, and available product documentation to establish its scope. Use the implementation as the authority when documentation conflicts with it.
2. Identify the product's pages, functional modules, user or system actions, and background tasks. Organize by product meaning, not by components, files, or functions.
3. Follow Page Delegation below to trace product flows through their implementation and data access, and write the PEC nodes and knowledge units, including dependencies on other product behavior.
4. Copy this skill's [assets/index.html](assets/index.html) into the app repository as `pec/index.html` to include the PEC browser reader.
5. Read and apply [references/review.md](references/review.md) to the completed PEC before reporting completion. Report what was created and the review outcome, and explain how to open `pec/index.html` and select the `pec/` folder.

When information is insufficient to describe the product or its business behavior, ask the user directly before writing the affected content. Do not invent business rules or intent.

### Page Delegation

The coordinating agent must use subagent tools to assign each page node, including each subpage, to its own subagent. Run within the available concurrency and queue remaining pages; do not combine multiple pages in one subagent. Keep the initial repository survey focused on assigning work and delegate detailed flow tracing. If subagent tools are unavailable, report that the required delegation cannot run rather than silently substituting a single-agent pass.

Before dispatch, establish the page inventory with node IDs, routes, output paths, and write ownership. Each page subagent owns that page and its modules and actions, excluding descendant page directories assigned to other subagents. It may read implementation and data definitions anywhere needed to trace its flows, but writes only its assigned PEC files.

Include the following in every subagent's launch message:

- The resolved absolute path to this `SKILL.md`, with an explicit instruction to read it before working. Specify the page-worker role: follow the assigned scope and this skill's authoring rules; repository-wide orchestration belongs to the coordinating agent.
- The repository root, assigned page's ID, title and route, output directory, and write-scope exclusions.
- Known code entry points, database definitions, relevant product documentation, and confirmed user decisions for that page. These are starting points for tracing, not a limit on investigation.
- The page inventory and known dependency destinations needed for cross-page references.
- The required delivery: write the complete PEC files, then return their paths, covered flows, cross-page dependencies, and unresolved questions to the coordinating agent. Report newly discovered pages for assignment and route clarification needs through the coordinator.

Treat the skill file as the authoritative instructions and the launch message as the page-specific assignment; do not rely on inherited conversation context to supply either. A completion summary must accompany the written files, not replace them.

The coordinating agent remains responsible for background task nodes and shared rules outside page assignments. Resolve ownership of shared facts and cross-page references. Integrate the written content without shortening away its business rules or execution mechanisms.

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
│       │   ├── overview.md
│       │   └── <business-topic>.md
│       ├── data.md
│       ├── pages/<subpage>/
│       ├── modules/<module>/
│       └── actions/<action>/
└── tasks/
    └── <task>/
        ├── _node.md
        ├── logic/
        │   ├── overview.md
        │   └── <business-topic>.md
        └── data.md
```

Top-level `pages/` contains only main product entry pages. Nest subpages in their parent page's `pages/` directory, following product navigation and ownership rather than URL segments. Subpages remain `page` nodes with the same metadata and may contain further subpages.

Place modules (functional areas within a page) under their page's `modules/`, and actions under their module or directly under their page. `tasks/` contains asynchronous, scheduled, message-consuming, or other background tasks.

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

Create only the knowledge units that apply to each node. Every knowledge file requires YAML frontmatter with a descriptive, single-line `title` in the document's language. Use a quoted value, for example:

```yaml
---
title: "订单可见范围"
---
```

The reader uses this title for the displayed heading and outline. Do not repeat it as a level-one heading in the body; use level-two headings for sections when needed. Knowledge units are identified by their node ID and relative file path, so they need no separate ID field.

| File | Content |
| --- | --- |
| `layout.md` | Structure, regions, and layout |
| `ui.md` | Visual styles and interaction presentation |
| `logic/overview.md` | The node's purpose, starting conditions, main flow, outcomes, and relationships to other nodes |
| `logic/<business-topic>.md` | A complete business topic that requires detailed explanation |
| `data.md` | Data objects, fields, formats, sources, and reads and writes |

### Logic Organization

Every node with business logic requires `logic/overview.md`. Keep simple logic entirely in this file. Split a topic into its own file when both conditions hold:

- **Complete:** It answers one identifiable business question, including its applicable conditions, rules, and outcomes.
- **Substantial:** Explaining it requires multiple business conditions or branches, state transitions, multiple processing stages, calculation rules, or recovery behavior. A single condition or simple operation is not enough.

Keep each topic's normal behavior and related edge cases together. Name topic files in lowercase English kebab-case using their business meaning, such as `order-visibility.md`; avoid generic names such as `flow.md`, `state.md`, or `exceptions.md`. Split by business scope and complexity, not word count or the number of implementation files.

After splitting, the overview must still explain the complete main flow and how the topics participate, linking to their details rather than becoming a link-only index. Keep detailed rules authoritative in their topic files. Give the overview a contextual title, such as "订单列表逻辑总览"; the reader places it before the node's other logic files.

### Logic Content

Use the following perspectives as a recommended writing framework. Combine or adapt sections and omit inapplicable ones; do not fill empty headings. Applicable logic must still be explained completely.

| Perspective | Explain |
| --- | --- |
| Business logic | From the user's perspective: what triggers the behavior, what they experience, what results they receive, and which business rules apply. For system-triggered behavior, describe its trigger and product effect. |
| Execution logic | Which inputs the system uses and how processing, calculations, and decisions produce the business result. Include applicable formulas, weights, thresholds, ordering, and state changes that determine behavior. |
| Edge-case handling | Which exceptional conditions change the normal flow, how the system handles them, and their effects on user experience, state, and data, including recovery or fallback where implemented. |

For a recommendation list, business logic explains how recency, likes, and views affect what the user sees. Execution logic explains how the ranking stage transforms and combines those signals and resolves competing signals. Naming an algorithm or saying "calculate ranking" is insufficient; describe its actual decision or calculation rules.

Explain execution mechanisms rather than walking through source code. Include call order, classes, or other implementation details only when they explain product behavior. Record the implemented behavior; do not infer design intent or invent mechanisms to fill the framework. Identify unresolved questions explicitly and follow the workflow's clarification rule.

Check depth by whether the applicable PEC content lets a reader explain the trigger, experience, result, underlying decisions, and behavior when conditions change or execution fails, and locate the supporting code and data. Do not use document length as the completion criterion.

## References and Reuse

Use these markers within knowledge units to connect related product behavior and its implementation:

| Marker | Target | Example |
| --- | --- | --- |
| `$n:` | PEC node | `$n:action.submit-order` |
| `$k:` | PEC knowledge unit, using its node ID and relative path without `.md` | `$k:action.submit-order/logic/create-order` |
| `$c:` | Code file and line, optionally a symbol | `$c:order-service/src/orders/create_order.ts:42#create_order` |
| `$d:` | Database, table, or field | `$d:commerce.orders.status` |

Keep each fact in one authoritative knowledge unit. Reference it from other nodes and record only their local differences.

Place references next to the key rules and execution mechanisms they support. Code references require repository-relative paths and verified line numbers; add a symbol when useful. For database-backed behavior, identify the specific tables and fields and explain their role in the logic, including when they are read or written. Keep full field descriptions in `data.md` and reference them from logic files rather than duplicating them.
