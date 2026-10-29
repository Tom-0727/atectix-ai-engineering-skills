---
name: red-team
description: Stress-test an idea, plan, strategy, or design by sending role-briefed subagents to attack it, or produce a decision by having subagents propose competing solutions and critique them. Use when the user asks to red team, poke holes, find weaknesses, give the strongest objection, play devil's advocate, stress test, 挑毛病, 找漏洞, 最强反对意见, 压力测试, or asks which approach is better or to design/decide something through competing options (哪个方案更好). Not for interviewing the user question by question about their plan (use grill-me).
---

# Red Team

Find the flaw that would collapse an argument before reality does, or reach a better decision through competing proposals.

## Rule: no self-attack

Every attack, proposal, and critique comes from a subagent. The main agent only prepares the material, dispatches, and merges results; it never adds objections or proposals of its own. If subagents cannot be spawned in the current environment, tell the user the skill cannot run and stop.

## Choose the mode

| Mode | Use when | Follow |
|------|----------|--------|
| Attack, quick | The user supplies existing content and wants objections or a quick pass | `references/attack.md` |
| Attack, full | The user asks for a full or thorough stress test | `references/attack.md` |
| Compete | The user asks which approach is better, or to design or decide something | `references/compete.md` |

Default to quick attack when the request does not name a depth. A compete result can be stress-tested afterwards with an attack.

## Dispatch a subagent

Build each subagent prompt from:

1. The full content of the role file in `references/roles/`.
2. The material: the user's full argument or problem with every fact, constraint, and quote they supplied, plus anything the mode file says to add.
3. The return format the mode file specifies.

Launch subagents of the same round in parallel. Name any subagent that failed in the output instead of dropping it silently. State in the output that all subagents ran on the same model, so agreement among them is weaker evidence than agreement across independent models.
