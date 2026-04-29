---
description: Commit staged changes, push the branch, and open a pull request against main
argument-hint: [title]
allowed-tools: ["Bash(git:*)", "Bash(gh:*)", "Bash(pnpm:*)"]
model: claude-haiku-4.5
---

If on main: tell the user, then follow the start command flow to create a feature/bugfix branch first.

1. Stage all changes made in this session and commit — infer the message from context.
2. Don't stage/commit sensitive files (e.g. containing secrets, .env, config files) — instead, don't include them in the commit and warn the user about unstaged sensitive files.
3. Run the project's test suite. Stop and fix if tests fail.
4. Run linting according to project CLAUDE.md. Fix the lint errors if any, and repeat until linting passes.
5. Push the branch to remote.
6. Create a PR against main:
   - Use $ARGUMENTS as the title if provided, otherwise infer from context.
   - `gh pr create --title "<title>" --body "<description>" --base main`
   - PR description should contain test coverage

Never commit or push to main directly
