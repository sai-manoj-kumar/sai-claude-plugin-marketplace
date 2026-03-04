# Contributing a Plugin

Thank you for contributing to the Claude Code Plugin Marketplace!

## Requirements

Your plugin must have:
- A `.claude-plugin/plugin.json` with `name`, `version`, `description`, and `author` — this is the runtime plugin manifest. The `plugins/<name>.md` frontmatter in this registry mirrors those fields.
- At least one command, hook, skill, agent, or MCP server
- A working install path or GitHub URL

## How to Add Your Plugin

1. Fork this repository (or open a PR if you have access).
2. Create `plugins/<your-plugin-name>.md` using the template below.
3. Add a row to the table in `README.md`. Example row:
   ```
   | [your-plugin-name](plugins/your-plugin-name.md) | 0.1.0 | Short description | `cmd1` `cmd2` | `cc --plugin-dir ~/your-plugin-directory` |
   ```
4. Open a pull request with a brief description.

## Plugin File Template

Copy this to `plugins/<your-plugin-name>.md` and fill in all sections:

```markdown
---
name: your-plugin-name
version: 0.1.0
author: Your Name
description: One-line description of what your plugin does
tags: [tag1, tag2]
commands: [command1, command2]
install: "cc --plugin-dir ~/your-plugin-directory"
source: ~/your-plugin-directory   # local path, or a GitHub URL like https://github.com/you/your-plugin
---

## your-plugin-name

One paragraph describing what the plugin does and why it is useful.

### Commands

| Command | Description |
|---------|-------------|
| `/your-plugin-name:command1` | What command1 does |
| `/your-plugin-name:command2` | What command2 does |

### Install

\```bash
cc --plugin-dir ~/your-plugin-directory
\```
```

## Review Criteria

- Plugin installs without errors
- Commands are documented with clear descriptions
- No destructive or unsafe default behaviors without explicit user consent
