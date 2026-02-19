# Startup

- On startup, before doing anything else, collect this info:
    1. Ask for the **plan name** (`<name>`)
        - Load or create `.claude/plans/<name>.md`
        - Each session has exactly **one** plan — do not mix plans
        - The directory is `plans/` (plural) because other sessions
          share it
    2. Ask for the **GitHub issue** (optional)
        - If provided, link it in the plan file
    3. Read `@remote.md` if running from the Web interface
       (https://claude.ai/code/)
        - Ignore if running from Claude CLI
    4. Ask for a **description** of what this session is about

# Interview

- After startup, read the repo and the description, then
  prepare a 5–10 question interview to clarify requirements,
  constraints, and approach.
    - Use `AskUserQuestion` to present the questions
    - The user may request additional questions

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
        - Show a message: "I'm back to plan mode..."
- Continuously update the plan file with progress and pending
  items.

# Git & PRs

- **Never** commit, push, or create PRs automatically.
- **Always** ask the user before any git operation.
- Follow this order, each step requiring explicit approval:
    1. **Commit** — so the user can review the diff locally
       or in the web app
    2. **Push** — only after the user approves the commit
    3. **PR** — only after the push, use the **plan name**
       in the PR title

# Acknowledgments

- After each interaction that results in actions/edits/code,
  write:
    - DONE: `<what you just did>`
    - NEXT: `<a suggestion based on the plan>`

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
