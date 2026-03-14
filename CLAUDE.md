# Plans

- All plans must be saved in the current repo with a name provided by the user.
    - ask plan <name> for the overall session
    - ask plan <name> when in plan mode

- Save plans in current repository or worktree:
    - `<repo|worktree>/.claude/plans/<name>.md`
    - **confirm with user full path for plan**

- Make questions about the plan.

# Interaction

- Editions:
    - **never** edit or write any files
    - **never** commit, push, or create PRs
    - **never** execute tests

- Before editions:
    - editions are hard locked
    - when locked
        - print absolute current plan filename
        - print summary of files you will modify:
            - `<file> | place | description`
            - place can be a function, data structure, etc.

- After editions:
    - print absolute current plan filename
    - print summary of files you modified:
        - `<file> | place | description`
        - use 1 line for each change
    - print a 2-line footer:
        - DONE: `<what you just did>`
        - NEXT: `<a suggestion based on the plan>`

- Always update current plan file with progress and pending items

# Language

- **English**: All answers, comments, and any other kind of
  output should be in English.
- I may chat and prompt in Portuguese. Nevertheless, the answers
  must be in English.

# Code Style

- Indentation:
    - 4 spaces
- Do not break lines
    - applies to everything:
        - definitions, declarations
        - calls, string concatenation
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
