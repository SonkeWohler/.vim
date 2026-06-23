---
description: When writing any file to ~/Documents/claude-scratch/, include a project context header so the file remains interpretable after being copied to ~/Documents/claude-refs/ without needing to reopen the original project.
---

When you are about to write or create a file under `~/Documents/claude-scratch/`:

1. **Collect context before writing** — run these if not already known:
   ```
   git rev-parse --show-toplevel 2>/dev/null || pwd
   git rev-parse --abbrev-ref HEAD 2>/dev/null
   git rev-parse --short HEAD 2>/dev/null
   date +%Y-%m-%d
   ```

2. **Prepend a context block** in the format that fits the file:

   Markdown or plain text — YAML frontmatter:
   ```
   ---
   project: <git repo basename, or directory name if not in a repo>
   project_path: <absolute path to repo root or cwd>
   branch: <branch name, omit if not in a repo>
   commit: <short hash, omit if not in a repo>
   date: <YYYY-MM-DD>
   ---
   ```

   Code files — a comment header using the language's comment syntax:
   ```
   # project: <name> | branch: <branch> | <short-hash> | <YYYY-MM-DD>
   # path: <project_path>
   ```

   JSON / TOML / structured data — add a `_context` key at the root, or a leading comment if the format allows it.

3. **Skip the header only when**:
   - The file is binary or an image
   - You are appending to an existing scratch file that already carries a context header
   - The user explicitly says not to add one

The purpose is that the file alone is enough to know which codebase it came from and roughly when, so it stays useful in `claude-refs/` with no extra explanation needed.
