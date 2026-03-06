---
description: Stage files with git add
argument-hint: [file-or-pattern ...]
allowed-tools: ["Bash(git:*)"]
---

Pre-condition: You are in a git repository. Move inside the repository if you are not already.

Stage the specified files using git add.

If arguments were provided use them as the file pattern, e.g.:
git add $ARGUMENTS

If no arguments were provided, ask the user which files to stage, then run:
git status --short

Then run git add with the chosen files. Do NOT use compound commands or heredoc.
