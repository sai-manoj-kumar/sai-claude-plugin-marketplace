---
description: Check recent GitHub Actions workflow failures and propose fixes
argument-hint: [workflow-name]
allowed-tools: ["Bash(gh:*)"]
---

Check recent GitHub Actions workflow runs for failures and propose fixes.

Step 1 — list recent workflow runs:
  If a workflow name is provided in $ARGUMENTS:
    gh run list --workflow "$ARGUMENTS" --limit 10 --json status,conclusion,name,databaseId,headBranch,createdAt
  Otherwise:
    gh run list --limit 10 --json status,conclusion,name,databaseId,headBranch,createdAt

Step 2 — identify failures:
  Filter runs where conclusion is "failure" or "timed_out" or status is "cancelled".
  If no failures found, report: "No recent workflow failures found." and stop.

Step 3 — fetch logs for each failed run (up to 3 most recent failures):
  gh run view <databaseId> --log-failed

Step 4 — analyze the failure logs and for each failure output:
  - Workflow name and branch
  - The failing step(s) and error message(s)
  - A concrete proposed fix (e.g. missing env var, failing test, dependency issue, wrong Node version)

Step 5 — summarize all findings in a table:
  | Run | Branch | Failing Step | Likely Cause | Proposed Fix |
  Show the most actionable fix first.

Do NOT attempt to apply any fixes automatically. Only propose them.
