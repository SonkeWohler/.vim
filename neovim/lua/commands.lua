-- ## commands

----- Other -----
cmd('Q', 'q!', { desc = 'force quit' })
cmd('Qa', 'qa!', { desc = 'force quit all buffers' })
cmd('TERM', 'ToggleTerm size=100 direction=vertical', { desc = 'ToggleTerm vertical' })
cmd('YankFilePath', 'let @+ = expand("%")', { desc = 'yank relative path to current file to system clipboard' })
cmd('YY', 'let @+ = expand("%")', { desc = 'yank relative path to current file to system clipboard' })

----- Filetree -----
cmd('LSA', 'NvimTreeFindFile', { desc = 'open NvimTree here' })
cmd('LSC', 'NvimTreeClose', { desc = 'close NvimTree' })
cmd('LSX', 'NvimTreeClose', { desc = 'close NvimTree' })

----- Common Editing
cmd('Trim', '%s/\\v\\s+$//eg', { desc = 'trim whitespace' })
-- TODO formatting
-- TODO organising imports

----- maintenance -----
cmd('PP', 'PackerSync', { desc = 'run PackerSync' })

----- finding things -----
----- mostly telescope now
-- files
cmd('FF', function() require("telescope.builtin").find_files() end, { desc = 'find file' })
-- grep
cmd('RG', function() require("telescope.builtin").live_grep() end, { desc = 'rg - live grep in workspace' })
cmd('FS', function() require("telescope.builtin").live_grep() end, { desc = 'rg - live grep in workspace' })
cmd('FG', function() require("telescope.builtin").live_grep() end, { desc = 'rg - live grep in workspace' })
cmd(
  'FT',
  function() require("telescope.builtin").grep_string() end,
  { desc = 'find this word - grep string under the cursor' }
)
cmd(
  'FH',
  function() require("telescope.builtin").current_buffer_fuzzy_find() end,
  { desc = 'find here - grep current buffer only' }
)
-- jump marks
cmd('FM', function() require("telescope.builtin").marks() end, { desc = 'find jump marks' })
cmd('FJ', function() require("telescope.builtin").jumplist() end, { desc = 'find in jumplist' })
-- lsp diagnostics
cmd('TT', 'Telescope diagnostics', { desc = 'toggle Trouble - lsp diagnostics' })
-- lsp document symbols
cmd('FD', function() require("telescope.builtin").lsp_document_symbols() end, { desc = 'Find lsp Document symbols' })
cmd('FW', function() require("telescope.builtin").lsp_workspace_symbols() end, { desc = 'Find lsp Workspace symbols' })
-- commands
cmd('FC', function() require("telescope.builtin").commands() end, { desc = 'help commands' })
-- undo history
cmd('FU', function() require("telescope").extensions.undo.undo() end, { desc = 'help commands' })

----- help stuff -----
-- help tags
cmd('HH', function() require("telescope.builtin").help_tags() end, { desc = 'help from helptags' })
cmd('HK', function() require("telescope.builtin").keymaps() end, { desc = 'help keymaps' })
cmd('HM', function() require("telescope.builtin").map_pages() end, { desc = 'help manpages' })
cmd('HO', function() require("telescope.builtin").vim_options() end, { desc = 'help vim options' })

----- history -----
----- except anything git
cmd('HS', function() require("telescope.builtin").search_history() end, { desc = 'History of recent Searches' })
cmd('HC', function() require("telescope.builtin").command_history() end, { desc = 'History of Commands' })
cmd('HF', function() require("telescope.builtin").old_files() end, { desc = 'History of opened Files' })
cmd('HB', function() require("telescope.builtin").buffers() end, { desc = 'History of Buffers' })

----- git -----
cmd('GC', function() require("telescope.builtin").git_commits() end, { desc = 'git commits' })
cmd('GH', function() require("telescope.builtin").git_bcommits() end, { desc = 'git history for this file' })
cmd('GS', function() require("telescope.builtin").git_status() end, { desc = 'git status - files with changes' })
cmd('GT', function() require("telescope.builtin").git_stash() end, { desc = 'git sTash' })
cmd('GB', function() require("telescope.builtin").git_branches() end, { desc = 'git branches' })
cmd('GF', function() require("telescope.builtin").git_files() end, { desc = 'git (tracked) files' })

----- diff view -----
cmd(
  'DD',
  function() require("telescope").extensions.diff.diff_current({ hidden = true }) end,
  { desc = 'diff this file with another' }
)
cmd(
  'DDD',
  function() require("telescope").extensions.diff.diff_files({ hidden = true }) end,
  { desc = 'diff this file with another' }
)

----- viewing or running things -----
cmd('GLOW', 'Glow', { desc = 'Markdown preview with Glow' })
cmd('GG', 'Glow', { desc = 'Markdown preview with Glow' })

----- Neorg -----
cmd('NN', 'Neorg workspace work', { desc = 'notes for work' })
cmd('NTOC', 'Neorg toc', { desc = 'Table of Contents for Neorg' })
