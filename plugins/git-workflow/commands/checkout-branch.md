---
description: Create and checkout a new git branch
argument-hint: [branch-name]
allowed-tools: ["Bash(git:*)"]
---

Create and switch to a new branch.

If branch name provided in $ARGUMENTS:
  git checkout -b $ARGUMENTS

If no name provided, ask the user for the branch name, then run:
  git checkout -b <branch-name>

Do NOT use compound commands with cd. Run git checkout -b directly.
