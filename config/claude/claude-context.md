# Preferences

## Shell commands

- The shell already starts in the project root. Do **not** prefix Bash commands with `cd` to the current directory — scope commands using the tool's own path argument instead (e.g. `rg PATTERN sub/dir`, `grep -rn PATTERN sub/dir`), not by changing directory.
- Use `cd` only when a tool genuinely requires a different working directory (build/test runners, npm scripts, tools that resolve config relative to cwd, a monorepo subproject).
- When `cd` is genuinely needed, use a **relative** path from the project root (e.g. `cd rest-api`), never an absolute path — it must be obvious at a glance that the target is in-scope.

## Formatting

- When providing links, show the raw URL in plain text alongside the link text, e.g. `[link text](https://example.com) — https://example.com`. This applies to inline links and "Sources:" lists alike.
