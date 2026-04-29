---
name: git-workflow
version: 0.4.0
author: Sai
description: Slash commands for starting branches and submitting pull requests
tags: [git, workflow, productivity]
commands: [start, submit, check-gh-workflow]
install: "cc --plugin-dir ~/git-workflow-plugin"
source: ~/git-workflow-plugin
---

## git-workflow

Provides two slash commands for branch-based git workflows.

### Commands

| Command                                           | Description                                        |
| ------------------------------------------------- | -------------------------------------------------- |
| `/git-workflow:start [branch]`                    | Pull latest main and create a new feature branch   |
| `/git-workflow:submit`                            | Run tests, push the branch, and open a PR          |
| `/git-workflow:check-gh-workflow [workflow-name]` | Check recent GH Actions failures and propose fixes |

### Install

```bash
cc --plugin-dir ~/git-workflow-plugin
```

### Source

Located at `~/git-workflow-plugin`. Plugin root: `~/git-workflow-plugin/.claude-plugin/`.
