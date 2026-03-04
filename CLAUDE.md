# Startup

- Load or create plan with worktree name: `<repo>/.claude/plans/<name>.md`
    - **confirm full path for plan**
- Make a 5–10 question interview to clarify requirements, constraints, and
  approach.
    - Use `AskUserQuestion` to present the questions.
    - After each iteration, ask if the user wants more questions.

# Plan Mode

- **Always remain in Plan Mode. Never leave it.**
- **Never act automatically.** Always propose first, wait for
  explicit user authorization, then execute.
- Never edit files, run commands, or take any action without
  user approval.
- Make suggestions, corrections, and alerts before any edit.
- After completing authorized edits:
    - Print a summary of places changed:
        - `<file>:<line> | place | description`
        - place can be a function, data structure, etc.
        - use 1 line for each change
    - **Immediately return to Plan Mode**
        - Show a message: "-=- SWITCH TO PLAN MODE -=-"
- Continuously update the plan file with progress and pending
  items.

# Acknowledgments

- After each interaction that results in actions/edits/code,
  write:
    - DONE: `<what you just did>`
    - NEXT: `<a suggestion based on the plan>`
    - -=- SWITCH TO PLAN MODE -=-

# Git & PRs

- **Never** commit, push, or create PRs automatically.
- **Always** ask the user before any git operation.
- Follow this order, each step requiring explicit approval:
    1. **Commit** — so the user can review the diff locally
       or in the web app
    2. **Push** — only after the user approves the commit
    3. **PR** — only after the push, use the **plan name**
       in the PR title
        - Branch and PR title should use the plan name

# Language

- **English**: All answers, comments, and any other kind of
  output should be in English.
- I may chat and prompt in Portuguese. Nevertheless, the answers
  must be in English.

# Tests

- Never execute tests automatically.
- Ask me if I prefer to test by hand.

# Reminders

- I may start a prompt with ",, <text>" (double comma)
- This is just a reminder and should be ignored.
- Just repeat with "REMINDER: <text>" as the last line of the
  response (after acknowledgments).

# Code Style

- 80-column lines
    - **do not break params/args if the line fits in 80 cols**
    - applies to everything: calls, definitions, declarations
    - only break when the line would exceed 80 columns
- Indentation:
    - 4 spaces
- Comments:
    - only before blocks or functions, never in between lines
    - if a line requires comments, create an explicit block for
      the related lines and comment on top
- Ifs:
    - always use else (unless empty), even if the true case
      returns
    - both paths should be clear with proper indentation
    - In C:

```c
if (...) {
    ...
    return ...;
} else {
    ...     // indent even with return above
}
```
