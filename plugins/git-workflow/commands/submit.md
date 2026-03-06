---
description: Commit staged changes, push the branch, and open a pull request against main
argument-hint: [title]
allowed-tools: ["Bash(git:*)", "Bash(gh:*)", "Bash(pnpm:*)"]
---

If on main: tell the user, then follow the start command flow to create a feature/bugfix branch first.

1. Stage all changes and commit — ask the user for a commit message.
2. Run the project's test suite. Stop if tests fail.
3. Push the branch to remote.
4. Create a PR against main:
   - Use $ARGUMENTS as the title if provided, otherwise ask.
   - `gh pr create --title "<title>" --body "<description>" --base main`

Never commit or push to main.
