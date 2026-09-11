# PEC Rule Review

Review the generated PEC against the existing rules in [SKILL.md](../SKILL.md). Limit this review to rule compliance; defer usability and human or agent effectiveness criteria until a later iteration informed by actual use.

## Evidence

Inspect the written PEC files, the product inventory including discoveries reported by subagents, subagent assignments and deliveries, and the relevant implementation and database definitions. Completion summaries do not replace inspecting the files; output structure alone does not establish that subagent tools were used.

## Checks

| Rule source | Review action |
| --- | --- |
| [Workflow](../SKILL.md#workflow) | Reconcile the inventory of pages, modules, actions, background tasks, and their flows with the generated nodes and knowledge units. Identify missing coverage and confirm unresolved business questions are explicit rather than filled with invented rules. |
| [Page Delegation](../SKILL.md#page-delegation) | Check actual subagent assignments against the page inventory, including subpages. Inspect launch messages for the required skill-reading instruction, skill path, scope, context, and delivery requirements. Check write ownership and confirm deliveries include written files, dependencies, and unresolved questions. |
| [Directory Structure](../SKILL.md#directory-structure), [Nodes](../SKILL.md#nodes), and [Knowledge Units](../SKILL.md#knowledge-units) | Check product ownership and nesting, node metadata and unique IDs, and the required title frontmatter in every knowledge file. Check that titles are descriptive and are not repeated as level-one body headings; create no failure merely because an inapplicable knowledge unit is absent. |
| [Logic Organization](../SKILL.md#logic-organization) | Check overview presence for nodes with business logic, contextual overview titles, topic filenames, and topic boundaries against the two splitting conditions. Confirm overviews explain the main flow and topic relationships, and normal behavior stays with its related edge cases. Flag link-only overviews and fragmented or duplicated rules. |
| [Logic Content](../SKILL.md#logic-content) | Check that applicable business behavior, execution mechanisms, and edge handling are described and agree with the implementation. Identify concrete omissions or contradictions, such as a ranking description that names an algorithm but omits its implemented calculation rules. Do not require fixed section headings or introduce length thresholds or quality scores. |
| [References and Reuse](../SKILL.md#references-and-reuse) | Resolve node and knowledge references. Open cited code paths at their line numbers to verify they support the adjacent descriptions, and verify database references against definitions. Check field roles, read/write behavior, and authoritative ownership of shared facts and field descriptions. A reader's copy button does not verify a code or database target. |
| [Workflow reader delivery](../SKILL.md#workflow) | Confirm `pec/index.html` is copied from the current bundled [reader asset](../assets/index.html). |

## Findings and Completion

For each violation, identify the affected node or file, link the applicable rule, give concrete evidence, and state the correction needed. Mark checks that could not be completed as unverified and explain what evidence is missing; do not count them as passed.

Return page-specific violations to the responsible page subagent. The coordinating agent resolves task coverage, shared ownership, and integration issues. Recheck affected content and references after corrections.

Report completion only when all applicable checks pass. Otherwise, report the remaining violations or unverified checks and the affected scope. Include the review outcome in the delivery summary.
