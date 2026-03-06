#!/bin/bash
set -euo pipefail

input=$(cat)
command=$(echo "$input" | jq -r '.tool_input.command // empty')

# Not a git command — allow immediately
if ! echo "$command" | grep -qE '(^|\s)git\s'; then
  exit 0
fi

# Block compound cd+git commands
if echo "$command" | grep -qE 'cd\s+.*&&\s*git|cd\s+.*;\s*git'; then
  printf '{"hookSpecificOutput":{"permissionDecision":"deny"},"systemMessage":"Compound cd+git commands are not allowed. Use git commands directly without cd."}' >&2
  exit 2
fi

# Block heredoc in git commands
if echo "$command" | grep -qE '<<\s*\w+'; then
  printf '{"hookSpecificOutput":{"permissionDecision":"deny"},"systemMessage":"Heredoc syntax is not allowed in git commands. Pass arguments directly."}' >&2
  exit 2
fi

exit 0
