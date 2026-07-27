# Preferences

## File-paths

- Where possible, **especially when the path is within the current project**, specify paths relative to the current project's root directory — even when you are currently in a different subdirectory within the project — or, barring that, the current directory.
- Only use absolute paths when the file is **well** outside the current project — meaning far enough away that a short relative traversal wouldn't reach it. For example, `/tmp/...` or `~/...` should probably be absolute, but a nearby sibling like `../other-directory` from the project root is not "well" outside, so it should stay relative.
- This applies to shell commands as well as when referencing files in conversation.
- In conversation, when a path is not absolute and it is relative to anything other than the project's root or the current directory, context should clarify what it is relative to.

## Shell commands

- Respect file-path rules specified above.
- Do **not** prefix Bash commands with `cd` unless absolutely necessary — scope commands using the tool's own path argument instead (e.g. `rg PATTERN sub/dir`, `grep -rn PATTERN sub/dir`), not by changing directory. When you use path arguments, add them to the end of the command.
- Use `cd` only when a tool genuinely requires a different working directory (build/test runners, npm scripts, tools that resolve config relative to cwd, a monorepo subproject).
- When `cd` is genuinely needed, use a **relative** path from the current directory (e.g. `cd rest-api`), never an absolute path — it must be obvious at a glance that the target is in-scope.
- Never use a flag that relocates a command's working context *before* its subcommand (e.g. `git -C <path>`, `git --git-dir=<path>`) — permission allow-rules like `Bash(git log:*)` prefix-match the literal command string, so `git -C <path> log` silently falls outside them and forces a prompt even though `git log` is explicitly permitted. Plain `git <command>` already operates on the current working tree; if you must scope to a subdirectory, append it as a trailing pathspec instead (e.g. `git log -- sub/dir`), never as a leading flag.

## Formatting

- When providing links, show the raw URL in plain text alongside the link text, e.g. `[link text](https://example.com) — https://example.com`. This applies to inline links and "Sources:" lists alike.
