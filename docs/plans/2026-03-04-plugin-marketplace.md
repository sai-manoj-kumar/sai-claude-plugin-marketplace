# Claude Code Plugin Marketplace Implementation Plan

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** Create a local directory at `~/claude-plugin-marketplace` that serves as a curated registry of Claude Code plugins, with git-workflow as the first listing.

**Architecture:** Per-plugin `.md` files with YAML frontmatter as structured metadata; hand-maintained `README.md` as the browsable storefront with a plugin table; `CONTRIBUTING.md` explaining how to add a plugin.

**Tech Stack:** Plain markdown, YAML frontmatter, bash (for verification), git.

---

### Task 1: Initialize the git repo

**Files:**
- Directory: `~/claude-plugin-marketplace/` (already exists)

**Step 1: Initialize git**

Run from `~/claude-plugin-marketplace/`:
```bash
git init
```
Expected: `Initialized empty Git repository in .../claude-plugin-marketplace/.git/`

**Step 2: Create a .gitignore**

Create `~/claude-plugin-marketplace/.gitignore`:
```
.DS_Store
```

**Step 3: Verify**

```bash
git status
```
Expected: `.gitignore` listed as untracked.

---

### Task 2: Create the git-workflow plugin file

**Files:**
- Create: `plugins/git-workflow.md`

**Step 1: Create plugins/ directory**

```bash
mkdir -p ~/claude-plugin-marketplace/plugins
```

**Step 2: Write the plugin file**

Create `~/claude-plugin-marketplace/plugins/git-workflow.md`:

```markdown
---
name: git-workflow
version: 0.1.0
author: Sai
description: Slash commands for common git operations with compound-command and heredoc guards
tags: [git, workflow, productivity]
commands: [add, commit, checkout-branch, push, status]
install: cc --plugin-dir ~/git-workflow-plugin
source: ~/git-workflow-plugin
---

## git-workflow

Provides five slash commands for everyday git operations. A `PreToolUse` hook enforces two safety rules on every Bash git call:

1. **No compound `cd + git` commands** — e.g. `cd repo && git push` is blocked.
2. **No heredoc syntax** — e.g. `git commit -m <<EOF` is blocked.

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
```

**Step 3: Verify YAML frontmatter is valid**

```bash
python3 -c "
import sys
content = open('plugins/git-workflow.md').read()
parts = content.split('---')
assert len(parts) >= 3, 'No frontmatter found'
import yaml
meta = yaml.safe_load(parts[1])
required = ['name','version','author','description','tags','commands','install','source']
missing = [f for f in required if f not in meta]
assert not missing, f'Missing fields: {missing}'
print('Frontmatter OK:', list(meta.keys()))
"
```
Expected: `Frontmatter OK: ['name', 'version', 'author', 'description', 'tags', 'commands', 'install', 'source']`

If python3 yaml module not available: `pip3 install pyyaml` first, or just visually confirm the frontmatter.

---

### Task 3: Create README.md (the storefront)

**Files:**
- Create: `~/claude-plugin-marketplace/README.md`

**Step 1: Write README.md**

```markdown
# Claude Code Plugin Marketplace

A curated registry of [Claude Code](https://claude.ai/claude-code) plugins. Each plugin is a drop-in directory you install with a single command.

## Plugins

| Plugin | Version | Description | Commands | Install |
|--------|---------|-------------|----------|---------|
| [git-workflow](plugins/git-workflow.md) | 0.1.0 | Slash commands for git ops with safety guards | `add` `commit` `checkout-branch` `push` `status` | `cc --plugin-dir ~/git-workflow-plugin` |

## Contributing

Want to add your plugin? See [CONTRIBUTING.md](CONTRIBUTING.md).
```

**Step 2: Verify the table renders correctly**

```bash
grep -c '|' README.md
```
Expected: 4 or more (header, separator, at least one data row, plus any other pipe lines). Visually confirm in a markdown preview if possible.

---

### Task 4: Create CONTRIBUTING.md

**Files:**
- Create: `~/claude-plugin-marketplace/CONTRIBUTING.md`

**Step 1: Write CONTRIBUTING.md**

```markdown
# Contributing a Plugin

Thank you for contributing to the Claude Code Plugin Marketplace!

## Requirements

Your plugin must have:
- A `.claude-plugin/plugin.json` with `name`, `version`, `description`, and `author`
- At least one command, hook, skill, agent, or MCP server
- A working install path or GitHub URL

## How to Add Your Plugin

1. Fork this repository (or open a PR if you have access).
2. Create `plugins/<your-plugin-name>.md` using the template below.
3. Add a row to the table in `README.md`.
4. Open a pull request with a brief description.

## Plugin File Template

Copy this to `plugins/<your-plugin-name>.md` and fill in the fields:

```yaml
---
name: your-plugin-name
version: 0.1.0
author: Your Name
description: One-line description of what your plugin does
tags: [tag1, tag2]
commands: [command1, command2]
install: cc --plugin-dir ~/your-plugin-directory
source: https://github.com/you/your-plugin
---
```

Then write a markdown body with: description, commands table, usage examples, and install instructions.

## Review Criteria

- Plugin installs without errors
- Commands are documented with clear descriptions
- No destructive or unsafe default behaviors without explicit user consent
```

**Step 2: Verify file exists and has content**

```bash
wc -l CONTRIBUTING.md
```
Expected: 40+ lines.

---

### Task 5: Commit everything

**Step 1: Stage all files**

```bash
git add .gitignore plugins/git-workflow.md README.md CONTRIBUTING.md docs/
```

**Step 2: Verify what's staged**

```bash
git status
```
Expected: All 5+ files shown as "Changes to be committed".

**Step 3: Create initial commit**

```bash
git commit -m "feat: initial plugin marketplace with git-workflow listing"
```
Expected: commit created with 5+ files.

**Step 4: Verify log**

```bash
git log --oneline
```
Expected: one commit line like `abc1234 feat: initial plugin marketplace with git-workflow listing`
