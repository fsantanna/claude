- As soon as `claude` starts, it should permanently change the terminal title
  to `"[CC] <current directory>"`.
- Update `CLAUDE.md` when necessary.

# Plan Mode Workflow

- Always enter plan mode before making any file edits.
- Never edit files without explicit user authorization.
- Just before edit, you should make one last suggestion.
- After completing authorized edits, return to plan mode automatically.

# Tests

- Never execute tests.
- Let me do this step by hand.

# Code Style

- 80-column lines
- Indentation:
    - 4 spaces
- Comments:
    - only before blocks or functions, never in between lines
    - if a line requires comments, create an explicit block for the related
      lines and comment on top
- Ifs:
    - always use else (unless empty), even if the true case returns
    - both paths should be clear with proper indentation
    - In C:

```c
if (...) {
    ...
    return ...;
} else {
    ...     // indent event with return above
}
```
