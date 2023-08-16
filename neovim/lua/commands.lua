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
cmd('FF', 'lua require("telescope.builtin").find_files()<cr>', { desc = 'find file' })
-- grep
cmd('RG', 'lua require("telescope.builtin").live_grep()<cr>', { desc = 'rg - live grep in workspace' })
cmd('FS', 'lua require("telescope.builtin").live_grep()<cr>', { desc = 'rg - live grep in workspace' })
cmd('FG', 'lua require("telescope.builtin").live_grep()<cr>', { desc = 'rg - live grep in workspace' })
cmd('FT', 'lua require("telescope.builtin").grep_string()<cr>',
  { desc = 'find this word - grep string under the cursor' })
cmd('FH', 'lua require("telescope.builtin").current_buffer_fuzzy_find()<cr>',
  { desc = 'find here - grep current buffer only' })
-- jump marks
cmd('FM', 'lua require("telescope.builtin").marks()<cr>', { desc = 'find jump marks' })
cmd('FJ', 'lua require("telescope.builtin").jumplist()<cr>', { desc = 'find in jumplist' })
-- lsp diagnostics
cmd('TT', 'Telescope diagnostics', { desc = 'toggle Trouble - lsp diagnostics' })
-- lsp document symbols
cmd('FD', 'lua require("telescope.builtin").lsp_document_symbols()<cr>', { desc = 'Find lsp Document symbols' })
cmd('FW', 'lua require("telescope.builtin").lsp_workspace_symbols()<cr>', { desc = 'Find lsp Workspace symbols' })
-- commands
cmd('FC', 'lua require("telescope.builtin").commands()<cr>', { desc = 'help commands' })
-- undo history
cmd('FU', 'lua require("telescope").extensions.undo.undo()<cr>', { desc = 'help commands' })

----- help stuff -----
-- help tags
cmd('HH', 'lua require("telescope.builtin").help_tags()<cr>', { desc = 'help from helptags' })
cmd('HK', 'lua require("telescope.builtin").keymaps()<cr>', { desc = 'help keymaps' })
cmd('HM', 'lua require("telescope.builtin").map_pages()<cr>', { desc = 'help manpages' })
cmd('HO', 'lua require("telescope.builtin").vim_options()<cr>', { desc = 'help vim options' })

----- history -----
----- except anything git
cmd('HS', 'lua require("telescope.builtin").search_history()<cr>', { desc = 'History of recent Searches' })
cmd('HC', 'lua require("telescope.builtin").command_history()<cr>', { desc = 'History of Commands' })
cmd('HF', 'lua require("telescope.builtin").old_files()<cr>', { desc = 'History of opened Files' })
cmd('HB', 'lua require("telescope.builtin").buffers()<cr>', { desc = 'History of Buffers' })

----- git -----
cmd('GC', 'lua require("telescope.builtin").git_commits()<cr>', { desc = 'git commits' })
cmd('GH', 'lua require("telescope.builtin").git_bcommits()<cr>', { desc = 'git history for this file' })
cmd('GS', 'lua require("telescope.builtin").git_status()<cr>', { desc = 'git status - files with changes' })
cmd('GT', 'lua require("telescope.builtin").git_stash()<cr>', { desc = 'git sTash' })
cmd('GB', 'lua require("telescope.builtin").git_branches()<cr>', { desc = 'git branches' })
cmd('GF', 'lua require("telescope.builtin").git_files()<cr>', { desc = 'git (tracked) files' })

----- diff view -----
cmd('DD', 'lua require("telescope").extensions.diff.diff_current({hidden=true})<cr>', { desc = 'diff this file with another' })
cmd('DDD', 'lua require("telescope").extensions.diff.diff_files({hidden=true})<cr>', { desc = 'diff this file with another' })

----- viewing or running things -----
cmd('GLOW', 'Glow', { desc = 'Markdown preview with Glow' })
cmd('GG', 'Glow', { desc = 'Markdown preview with Glow' })
