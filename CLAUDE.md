# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

A curated registry of Claude Code plugins. It is purely markdown + JSON — no build system, no tests, no package manager.

## Structure

- `plugins/<name>.md` — one file per plugin listing with YAML frontmatter (source of truth for metadata)
- `plugins/<name>/` — the actual installable plugin directory, referenced by `marketplace.json` as `"source": "./plugins/<name>"`
- `plugins/<name>/.claude-plugin/plugin.json` — runtime plugin manifest
- `plugins/<name>/commands/` — one `.md` file per slash command
- `plugins/<name>/.claude-plugin/hooks/` — hook definitions and scripts
- `.claude-plugin/marketplace.json` — machine-readable registry consumed by Claude Code
- `README.md` — hand-maintained human-browsable storefront with plugin table

## Plugin Listing Format (`plugins/<name>.md`)

YAML frontmatter fields: `name`, `version`, `author`, `description`, `tags`, `commands`, `install`, `source`.

The markdown body must include a commands table and an install section.

## Versioning

Version is tracked in four places — keep them in sync on every change:
1. `plugins/<name>.md` frontmatter
2. `plugins/<name>/.claude-plugin/plugin.json`
3. `.claude-plugin/marketplace.json`
4. `README.md` plugin table row

Use semver. Breaking changes (removed commands) → minor bump. Additions/fixes → patch bump.

## Adding a New Plugin

1. Create `plugins/<name>.md` with full frontmatter and body.
2. Create `plugins/<name>/` with `.claude-plugin/plugin.json` and at minimum one command in `commands/`.
3. Add a row to the `README.md` plugin table.
4. Add an entry to `.claude-plugin/marketplace.json` with `"source": "./plugins/<name>"`.

## Command File Conventions

- Frontmatter: `description`, `argument-hint`, `allowed-tools`
- Keep instructions concise — only include non-obvious, plugin-specific behavior
- Infer context (branch names, commit messages, PR titles) rather than prompting the user
- Do not repeat constraints already enforced by hooks or global CLAUDE.md
