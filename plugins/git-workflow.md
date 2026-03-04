---
name: git-workflow
version: 0.1.0
author: Sai
description: Slash commands for common git operations with compound-command and heredoc guards
tags: [git, workflow, productivity]
commands: [add, commit, checkout-branch, push, status]
install: "cc --plugin-dir ~/git-workflow-plugin"
source: ~/git-workflow-plugin
---

## git-workflow

Provides five slash commands for everyday git operations. A `PreToolUse` hook enforces two safety rules on every Bash git call:

1. **No compound `cd + git` commands** — e.g. `cd repo && git push` is blocked.
2. **No heredoc syntax** — e.g. `git commit <<EOF ... EOF` is blocked.

All other git commands prompt the user for manual approval before running.

### Commands

| Command | Description |
|---------|-------------|
| `/git-workflow:add [file-or-pattern ...]` | Stage files with `git add` |
| `/git-workflow:commit [message]` | Commit staged changes with `-m` message |
| `/git-workflow:checkout-branch [branch-name]` | Create and switch to a new branch |
| `/git-workflow:push [remote] [branch]` | Push current branch to remote |
| `/git-workflow:status` | Show `git status` and last 5 commits |

### Install

```bash
cc --plugin-dir ~/git-workflow-plugin
```

### Source

Located at `~/git-workflow-plugin`. Plugin root: `~/git-workflow-plugin/.claude-plugin/`.
