# Claim Analysis

Prepare the material attackers work from. This is preparation, not attack: do not judge the claims.

## Atomic claims

Break the argument into numbered claims that are each self-contained, specific, and challengeable on their own. Mark each claim:

- **fundamental**: physics, math, or verified fact.
- **assumed**: everything else, including market prices, best practices, and "how it's always done".

Include hidden claims the argument depends on but never states ("of course we need X").

## Constraint classification (full attack only)

List everything the argument treats as a constraint (requirements, "we have to", budgets, timelines, policies) and classify each with its evidence:

| Type | Test | Can change? |
|------|------|-------------|
| HARD | Violating it would break physics, math, or reality | No |
| SOFT | A decision-maker could change it | Yes |
| ASSUMPTION | Not yet tested; name the evidence that would confirm or refute it | Maybe false |

Classify nothing as HARD unless it passes the HARD test. Constraints presented as HARD that are really SOFT or ASSUMPTION are the prime targets; mark them.

## Output

```
# CLAIMS
1. [claim] — fundamental | assumed
...

# CONSTRAINTS (full attack only)
| Constraint | Type | Evidence | Prime target? |
```
