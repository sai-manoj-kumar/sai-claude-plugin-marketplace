---
description: Commit staged changes, push the branch, and open a pull request against main
argument-hint: [title]
allowed-tools: ["Bash(git:*)", "Bash(gh:*)", "Bash(pnpm:*)"]
---

Submit your branch for review. Follow these steps in order:

Step 0 — check the current branch:
Run: git branch --show-current
If the current branch is "main":
Tell the user: "You are on main. Creating a feature branch first."
Follow the same steps as the start command: - Ask: "Is this a feature or bugfix? Provide a short description." - Run: git checkout -b feature/<short-description>
or: git checkout -b bugfix/<short-description> - Use lowercase, hyphens only (no spaces or underscores)
Then continue with the steps below on the new branch.

Step 1 — commit staged changes:
Run: git status
If there are staged or unstaged changes:
Run: git add -A
Run: git commit -m "<message>"
If there is nothing to commit, skip this step.
NEVER commit directly to main. This step only runs on a non-main branch.

Step 2 — ensure all tests pass (follow the project's CLAUDE.md for test commands):
Run the test suite locally. Do NOT proceed if tests fail.

Step 3 — push the branch to remote:
git push origin <current-branch-name>

Step 4 — create a pull request against main:
If a title was provided in $ARGUMENTS:
    gh pr create --title "$ARGUMENTS" --body "Detailed description of the changes and any relevant context." --base main

If no title provided, ask the user:
"Provide a short PR title and a brief description of the changes."
Then run:
gh pr create --title "<title>" --body "<description>" --base main

Do NOT use compound commands with cd. Run each command separately.
Do NOT push or create the PR if tests are failing.
Do NOT commit or push to main under any circumstances.
