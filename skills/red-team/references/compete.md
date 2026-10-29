# Compete

Produce a decision or design that beats every single proposal, through competing proposals and a critique.

## Steps

1. Round 1, proposals: dispatch `roles/proposer-pragmatist.md`, `roles/proposer-idealist.md`, and `roles/proposer-skeptic.md` in parallel. Give each the problem and the proposal return format below.
2. Round 2, critique: dispatch `roles/critic.md` with the problem, all three proposals, and the critique return format below.
3. Round 3, synthesis: the main agent combines the proposals into one solution that fixes every flaw the critique named and keeps each proposal's real strengths. If no combination is clearly better than the strongest single proposal, say so and recommend that proposal.

## Proposal return format

```
APPROACH: [one sentence]
DESIGN: [the complete, specific solution]
OPTIMIZES FOR: [what this perspective prioritizes]
GIVES UP: [what it knowingly sacrifices]
```

## Critique return format

```
For each proposal:
  RIGHT: [specific genuine strengths]
  WRONG: [at least one flaw that changes the outcome if left unfixed]
UNCOMFORTABLE TRUTH: [what none of the proposals addressed]
STRONGEST FOUNDATION: [which proposal and why]
```

## Output

```
# COMPETE: [problem]

**Proposals:** [one line each]
**Critique:** [key flaws per proposal, and the uncomfortable truth]
**Synthesis:** [the final solution, and which flaw each element fixes]
**Remaining trade-offs:** [tensions not fully resolved]
**Failed subagents / same-model note**
```

The synthesis fails if it reads the same as it would have without the critique, or if it is one proposal with minor tweaks.
