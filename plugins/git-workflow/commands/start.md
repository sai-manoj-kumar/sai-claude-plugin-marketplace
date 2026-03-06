---
description: Pull latest main and create a new feature or bugfix branch
argument-hint: [branch-name]
allowed-tools: ["Bash(git:*)"]
---

1. Checkout main and pull latest.
2. Create and checkout the new branch:
   - If $ARGUMENTS provided: `git checkout -b $ARGUMENTS`
   - Otherwise ask: "Feature or bugfix? Provide a short description." then create `feature/<slug>` or `bugfix/<slug>` (lowercase, hyphens only).
