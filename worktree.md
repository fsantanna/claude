---
description: Manage git worktrees for parallel Claude Code sessions
argument-hint: add|rem|pr <name>
allowed-tools: Bash
---

# Git Worktree Management

Parse the arguments: first word is the action (`add`, `rem`, or `pr`), remaining words depend on the action.

## For `add <name>`:

1. Run: `git worktree add .worktrees/<name> -b ai/<name>`
    - if any error occurs, stop and report the error to the user as-is
2. Set upstream tracking:
   - Run: `git config branch.ai/<name>.remote origin`
   - Run: `git config branch.ai/<name>.merge refs/heads/ai/<name>`
3. Open a new terminal in `.worktrees/<name>` and run `claude` there:
   - Run: `i3-sensible-terminal -e bash -c "cd $(realpath .worktrees/<name>) && unset CLAUDECODE && claude --dangerously-skip-permissions" &`

## For `pr <name> <url>`:

1. Parse the URL to extract `NN` and the repo base URL:
   - URL format: `https://github.com/<owner>/<repo>/pull/<NN>`
   - Extract `NN` from the `/pull/NN` part
   - Extract repo base URL: `https://github.com/<owner>/<repo>`
2. Fetch the PR head:
   - Run: `git fetch <repo-base-url>.git pull/NN/head`
    - if any error occurs, stop and report the error to the user as-is
3. Create the worktree from FETCH_HEAD:
   - Run: `git worktree add .worktrees/pr-NN-<name> -b pr-NN-<name> FETCH_HEAD`
    - if any error occurs, stop and report the error to the user as-is
4. Set upstream tracking:
   - Run: `git config branch.pr-NN-<name>.remote origin`
   - Run: `git config branch.pr-NN-<name>.merge refs/heads/pr-NN-<name>`
5. Open a new terminal in `.worktrees/pr-NN-<name>` and run `claude` there:
   - Run: `i3-sensible-terminal -e bash -c "cd $(realpath .worktrees/pr-NN-<name>) && unset CLAUDECODE && claude --dangerously-skip-permissions" &`

## For `rem <name>`:

Determine the branch name from `<name>`:
- If `<name>` starts with `pr-`, the branch is `<name>` (no prefix)
- Otherwise, the branch is `ai/<name>`

1. Run: `git merge-base --is-ancestor <branch> main`
    - check `$?` result
        - if `0`, ok (branch was merged into main)
        - otherwise, stop and report error to the user
2. Run: `git worktree remove .worktrees/<name>`
    - if error, stop and report the error to the user as-is
3. Run: `git branch -D <branch>`
    - if error, stop and report the error to the user as-is

## Error handling

- Do NOT continue if any command fails
- Show the exact error message from git to the user
- Do not attempt to clean up or retry
