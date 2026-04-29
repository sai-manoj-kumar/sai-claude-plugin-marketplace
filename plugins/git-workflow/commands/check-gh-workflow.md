---
description: Check recent GitHub Actions workflow failures and propose fixes
argument-hint: [workflow-name]
allowed-tools: ["Bash(gh:*)"]
model: claude-haiku
---

1. List recent runs: `gh run list [--workflow "$ARGUMENTS"] --limit 10 --json status,conclusion,name,databaseId,headBranch,createdAt`
2. Filter failures (conclusion: failure/timed_out, or cancelled). If none, report and stop.
3. Fetch logs for up to 3 most recent failures: `gh run view <databaseId> --log-failed`
4. For each failure, identify the failing step, error message, and propose a concrete fix.
5. Summarize in a table: Run | Branch | Failing Step | Likely Cause | Proposed Fix — most actionable first.

Only propose fixes — do not apply them.
