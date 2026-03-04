---
description: Push current branch to remote
argument-hint: [remote] [branch]
allowed-tools: ["Bash(git:*)"]
---

Push the current branch to remote.

Default (no arguments):
  git push

With remote and branch from $ARGUMENTS:
  git push $ARGUMENTS

First run git status to confirm branch state, then push.
Do NOT combine cd and git. Do NOT use heredoc.
