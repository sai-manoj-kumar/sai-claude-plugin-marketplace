---
description: Pull latest main and create a new feature or bugfix branch
argument-hint: [branch-name]
allowed-tools: ["Bash(git:*)"]
---

Start new work by syncing with main and creating a branch.

Step 1 — switch to main and pull latest:
  git checkout main
  git pull origin main

Step 2 — create and checkout the new branch:
  If branch name provided in $ARGUMENTS:
    git checkout -b $ARGUMENTS

  If no name provided, ask the user:
    "Is this a feature or bugfix? Provide a short description."
    Then run: git checkout -b feature/<short-description>
           or: git checkout -b bugfix/<short-description>

Branch naming rules:
  - Feature branches: feature/short-description
  - Bugfix branches:  bugfix/short-description
  - Use lowercase, hyphens only (no spaces or underscores)
  - Example: feature/add-email-verification

Do NOT use compound commands with cd. Run each git command separately.
