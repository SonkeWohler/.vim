# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

Personal dotfiles for Arch Linux / Arch-based systems (EndeavourOS). All configs are managed as symlinks created by `setup/config.bash`. The repo is normally cloned to `~/libraries/.vim` or `~/Documents/.vim`.

## Setup order for a new machine

1. `git-setup.bash` — configure SSH for GitHub, clone this repo
2. `setup/pacman.bash` — install all packages via pacman, flatpak, npm, cargo
3. `setup/script.bash` — install neovim spell dict to `/usr/share`
4. `setup/config.bash` — create all symlinks (requires `~/locationsForCD.bash` with `$vimCD` pointing to this repo)

`setup/config.bash` must be run before KDE starts, since it replaces KDE config files directly.

## Neovim config (`neovim/`)

Lua config using **lazy.nvim** for plugin management and **Mason** for LSP/tool installs.

**Load order in `init.lua`:**
- Global helpers defined first: `keymap`, `nmap`, `imap`, `cmap`, `vmap`, `cmd` — these are intentionally global (not local) so all other modules can use them without importing
- `nvim_tree_on_attach` — must load before plugins, as required by nvim-tree plugin
- `plugins` — bootstraps lazy.nvim and loads all `lazy_plugins/*.lua` specs
- Then: `mappings`, `commands`, `settings`, `autocmds`, `lsp_setup`

**Plugin categories** (`lua/lazy_plugins/`): `colorscheme`, `git`, `telescope`, `lsp_completion`, `treesitter`, `ux`, `additional_ux`, `looks`, `inter_buffer_navigation`, `intra_buffer_navigation`, `simple_editing`, `integrations`

**Filetype overrides** live in `neovim/after/ftplugin/<ft>.lua`.

**Key mapping conventions** in `mappings.lua`:
- `<space>` prefix: LSP actions (`<space>d` → definition, `<space>r` → rename, `<space>F` → format)
- `g` prefix: git hunks (`gs` stage, `gU` reset, `gn`/`gN` next/prev) and tab ops (`gh` prev tab, `gx` close tab)
- `d`, `c`, `s`, `x` use the black hole register by default — use `y` explicitly to yank
- `""` in visual yanks to system clipboard; `++` pastes from system clipboard
- `w`/`e`/`b` are remapped to spider.nvim (subword-aware), `W`/`E`/`B` retain original vim behavior

To update plugins: `nvim -c "lua require('lazy').sync({wait = true})" -c 'autocmd User VeryLazy MasonUpdateAll'` (also available as the `update-side-note` fish function).

## Fish shell config (`config/fish/`)

- `c.fish` → `~/.config/fish/config.fish` — sets global path vars (`dotfiles_PATH`, `work_main_PATH`), `$EDITOR=nvim`, abbreviations, and interactive functions
- `conf.d/` — auto-sourced files: `clean_and_update.fish` (system maintenance functions), `my_github_convenience.fish` (GitHub PR helpers), plus plugin configs (fzf, autopair, puffer-fish)
- `p` → `~/.config/fish/fish_plugins` — fisher plugin list
- Key abbreviations: `vi` → `nvim -p`, `cdv` → dotfiles dir, `gg` → gitui, `kk` → k9s, `lsa` → `ls -lAFh`
- Update functions: `update-side-note` (nvim/tmux/flatpak/rustup), `update-core` (pacman + AUR), `update-all` (everything)

## Claude config (`config/claude/`)

- `claude_settings.json` → `~/.claude/settings.json`
- `commands/` → `~/.claude/commands/` (slash commands)
- `skills/` → `~/.claude/skills/` (not yet wired by setup script as of last check)

**Active hooks** in `claude_settings.json`:
- `PreToolUse[Bash]` — `notify-send` with command preview (async)
- `PermissionRequest` — `notify-send` alert (async)
- `UserPromptSubmit` — `kdialog` warning if there are uncommitted changes
- `Stop` — `notify-send` when Claude finishes (async)

## Key config file locations and their symlink targets

Changes to any of these files may require adaptations in relevant `setup/*` files as well.

| Repo path | Symlink target |
|---|---|
| `config/gitconfig` | `~/.gitconfig` |
| `config/gitignore` | `~/gitignore` (global) |
| `config/tmux.conf` | `~/.tmux.conf` |
| `config/alacritty.toml` | `~/.config/alacritty.toml` |
| `config/starship.toml` | `~/.config/starship.toml` |
| `config/fish/` files | `~/.config/fish/` |
| `config/kde/*` | `~/.config/` (directly) |
| `config/keyd.conf` | `/etc/keyd/keyd.conf` (root) |
| `config/k9s/p.yml` | `~/.config/k9s/plugins.yaml` |
| `neovim/*` | `~/.config/nvim/` |
| `config/claude/claude_settings.json` | `~/.claude/settings.json` |
| `config/claude/commands` | `~/.claude/commands` |

## Committing conventions

This repo loosely uses conventional commits.
