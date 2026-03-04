# Plugin Marketplace Design

**Date:** 2026-03-04
**Author:** Sai

## Summary

A GitHub-style registry for Claude Code plugins. Source of truth is one `.md` file per plugin with YAML frontmatter. The `README.md` is the human-browsable storefront with a plugin table.

## Directory Structure

```
~/claude-plugin-marketplace/
├── README.md
├── CONTRIBUTING.md
└── plugins/
    └── git-workflow.md
```

## Plugin File Format (`plugins/<name>.md`)

YAML frontmatter fields:
- `name` — kebab-case plugin name
- `version` — semver
- `author` — author name
- `description` — one-line description
- `tags` — array of strings
- `commands` — array of slash command names
- `install` — install command string
- `source` — local path or GitHub URL

Body sections: description paragraph, commands table, usage examples, install command.

## README Layout

1. Header: "Claude Code Plugin Marketplace"
2. Plugin table: Name (linked to plugin file) | Version | Description | Commands | Install
3. Contributing section linking to CONTRIBUTING.md

## Plugin Table Columns

| Plugin | Version | Description | Commands | Install |
|--------|---------|-------------|----------|---------|
| [git-workflow](plugins/git-workflow.md) | 0.1.0 | Slash commands for git ops with safety guards | add, commit, checkout-branch, push, status | `cc --plugin-dir ~/git-workflow-plugin` |

## Decisions

- **Per-plugin .md files** chosen over registry.json for human readability and easy contributions.
- **Local directory** (no GitHub yet) — Sai can push to GitHub later.
- **No generation script** — README is hand-maintained; acceptable at small scale.
