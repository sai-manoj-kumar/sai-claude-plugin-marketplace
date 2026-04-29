---
description: Pull latest main and create a new feature or bugfix branch
argument-hint: [branch-name]
allowed-tools: ["Bash(git:*)"]
model: claude-haiku
---

1. Checkout main and pull latest.
2. Create and checkout the new branch:
   - If $ARGUMENTS provided: `git checkout -b $ARGUMENTS`
   - Otherwise infer from current context (recent changes, task, conversation) whether it's a feature or bugfix, derive a short slug, and create `feature/<slug>` or `bugfix/<slug>` (lowercase, hyphens only).
