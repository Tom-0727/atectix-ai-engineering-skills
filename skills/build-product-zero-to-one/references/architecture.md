# Architecture design

Define only technical decisions that significantly affect the confirmed MVP's core experience or delivery risk.

## Instruction

Read the confirmed MVP PRD, domain model, and UX design. Identify product requirements where response time, output quality, failure and recovery, data consistency, privacy, third-party services, running cost, or running a capability as a separate process can change the product's value or feasibility.

For each affected core user path, decide how the system must behave and which clients or independently running processes are required. Keep a capability inside the API unless it must start, stop, deploy, or run independently. Do not document ordinary Web-to-API-to-database requests; describe only interactions that affect the user experience or require a separate process.

Record each important decision with the product or UX requirement it serves, its effect on the user or delivery, and any important cost, risk, or assumption. Omit ordinary implementation choices, alternatives not seriously considered, the repository tree, a complete communication inventory, the physical database schema, and the Docker Compose service list.

## Artifact

Write `.atectix/zero-to-one-product-build/05-architecture.md` with the product requirements that affect architecture, core user paths whose speed, quality, or failure behavior needs special handling, required clients and processes with their responsibilities, important decisions, and unresolved technical risks. Omit empty sections and details already enforced by repository instructions or executable configuration.
