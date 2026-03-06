---
description: Commit staged changes with a message
argument-hint: [message]
allowed-tools: ["Bash(git:*)"]
---

Commit staged changes. The commit message must be passed as a direct -m argument.

If the user provided a message in $ARGUMENTS:
  git commit -m "$ARGUMENTS"

If no message was provided, ask the user for a commit message, then run:
  git commit -m "the message"

Commit message guidelines:
  - Be clear and concise — describe the change and its purpose.
  - Use the conventional commits format: <type>(<scope>): <description>
  - Common types: feat, fix, chore, refactor, test, docs
  - Example: git commit -m "feat(auth): add email verification flow"

NEVER use heredoc (<<). NEVER combine cd and git in one command.
