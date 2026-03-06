---
description: Run tests, push the branch, and open a pull request against main
argument-hint: [title]
allowed-tools: ["Bash(git:*)", "Bash(gh:*)", "Bash(pnpm:*)"]
---

Submit your branch for review. Follow these steps in order:

Step 1 — ensure all tests pass (follow the project's CLAUDE.md for test commands):
  Run the test suite locally. Do NOT proceed if tests fail.

Step 2 — push the branch to remote:
  git push origin <current-branch-name>

Step 3 — create a pull request against main:
  If a title was provided in $ARGUMENTS:
    gh pr create --title "$ARGUMENTS" --body "Detailed description of the changes and any relevant context." --base main

  If no title provided, ask the user:
    "Provide a short PR title and a brief description of the changes."
    Then run:
    gh pr create --title "<title>" --body "<description>" --base main

Do NOT use compound commands with cd. Run each command separately.
Do NOT push or create the PR if tests are failing.
