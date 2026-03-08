# Startup

- Persistent plan:
    - ask plan <name> for session:
    - save in current repository or worktree:
        - `<repo|worktree>/.claude/plans/<name>.md`
    - **confirm full path for plan**

- Make questions about the plan.

# Interaction

- **Never** edit or write any files.
- **Never** commit, push, or create PRs.
- **Never** execute tests.

- User must type `xxx` at prompt to allow any of the actions above.

- After editions and writes to files:
    - Print a summary of places changed:
        - `<file>:<line> | place | description`
        - place can be a function, data structure, etc.
        - use 1 line for each change
    - Print a 2-line footer:
        - DONE: `<what you just did>`
        - NEXT: `<a suggestion based on the plan>`

- Always update current plan file with progress and pending items

# Language

- **English**: All answers, comments, and any other kind of
  output should be in English.
- I may chat and prompt in Portuguese. Nevertheless, the answers
  must be in English.

# Code Style

- 80-column lines
    - **do not break if line fits in 80 columns**
    - applies to everything:
        - calls, definitions, declarations, string concatenation
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

# Markdown & Documentation Style

- 80-column lines
- Phrases must start in a new line
- Tables
    - all lines with column separators should match positions
    - phrases rule does not apply
