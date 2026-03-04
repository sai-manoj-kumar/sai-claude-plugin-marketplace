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

NEVER use heredoc (<<). NEVER combine cd and git in one command.
