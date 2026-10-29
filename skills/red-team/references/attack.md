# Attack

Attack existing content and return its strongest objections ranked by severity.

## Steps

1. Prepare the material with `claim-analysis.md`: atomic claims for a quick attack; claims plus constraint classification for a full attack.
2. Dispatch the four attackers in parallel, one per file: `roles/attacker-engineer.md`, `roles/attacker-architect.md`, `roles/attacker-adversary.md`, `roles/attacker-outsider.md`. Give each the argument, the claim analysis, and the attacker return format below.
3. Merge the returns:
   - Rank findings by severity. A weakness several attackers reached independently ranks above a lone finding; a lone finding that breaks a load-bearing claim still counts.
   - Merge duplicates and discard nitpicks and objections that attack a claim the argument does not make.
   - Name the fundamental flaw: the specific assumption whose failure collapses the whole argument.
4. Write the output for the depth requested.

## Attacker return format

```
FOR: [strongest point in favor of the argument from this angle] (claim #N)
AGAINST:
1. [severity: critical | high | medium | low] [objection] (claim #N)
   Why it breaks: [reasoning or evidence]
   Fix: [remediation within the stated constraints]
...up to 3
VERDICT: [one sentence: sound with fixable execution, or fundamentally flawed]
```

## Quick output

```
# RED TEAM: [what was attacked]

**Claims attacked:** [numbered atomic claims]

1. [severity] [objection, one or two sentences]
   Breaks: claim #N
   Fix: [remediation within the stated constraints]
...4-6 items

**Fundamental flaw:** [the assumption and how the structure collapses without it]
**Verdict:** [one sentence]
**Failed attackers / same-model note**
```

## Full output

Quick output, plus the constraint table and the two sections below. Each has 8 points, one sentence each, self-contained, in plain language, ordered so impact escalates.

```
# STEELMAN
**The position (best version):** [one sentence]
1-8. [strongest case for, strongest last]

# COUNTER-ARGUMENT
1-8. [opening on the fundamental flaw]
**Assessment:** [one sentence on soundness after analysis]
```

The proponent must recognize the steelman as their own argument, and the counter-argument must defeat that steelman, not a weaker version. Build both only from attacker returns.
