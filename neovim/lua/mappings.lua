----- cleanup -----
-- unlike in vim, neovim by default splits undos in insert mode when using these
-- I use these a lot and prefer a single insert mode to be atomic
vim.api.nvim_del_keymap('i', '<C-W>')
vim.api.nvim_del_keymap('i', '<C-U>')

---- insert mode ----
-- delete key in insert mode
imap('<C-l>', '<Right>')

----- inter-buffer navigation -----
-- similar window controls are defined in the hydra-<C-W>
-- faster left and right, since that is the most common for me
nmap('<c-h>', '<c-w>h')
nmap('<c-l>', '<c-w>l')
nmap('<c-k>', '<c-w>w')
-- commands save and load
nmap('<c-s>', ':wa<CR>')
imap('<c-s>', '<esc>:wa<CR>')
nmap('<c-w>e', ':e<CR>')
-- splilt current buffer into new tab, I use it similar to tmux zoom
nmap('<c-w>t', '<Cmd>tab split<CR>')
-- more like tmux new "tab"
nmap('<c-w>c', '<Cmd>tab split<CR>')
-- next/prev tab
nmap('<c-w>n', '<Cmd>tabnext<CR>')
nmap('<c-w>N', '<Cmd>tabprevious<CR>')
-- go to tab number
-- this doesn't yet work with just <C-1>, hence <c-w>1 instead
-- ??? wtf ???
nmap('<c-w>1', '1gt')
nmap('<c-w>2', '2gt')
nmap('<c-w>3', '3gt')
nmap('<c-w>4', '4gt')
nmap('<c-w>5', '5gt')
nmap('<c-w>6', '6gt')
nmap('<c-w>7', '7gt')
nmap('<c-w>8', '8gt')
nmap('<c-w>9', '9gt')
nmap('<c-w>0', '10gt')
-- I keep hitting ` instead of 1
nmap('`gt', '1gt')
-- neozoom is defined in plugin, since it doesn't work here
-- resize this buffer
nmap('<c-w><', ':lua require("smart-splits").resize_left(3)<CR>')
nmap('<c-w>>', ':lua require("smart-splits").resize_right(3)<CR>')
nmap('<c-w>=', ':lua require("smart-splits").resize_up(3)<CR>')
nmap('<c-w>-', ':lua require("smart-splits").resize_down(3)<CR>')
nmap('<c-w>+', '<c-W>=')
-- fuzzy find files, since I do this all the time
nmap('<c-w>f', ':lua require("telescope.builtin").find_files()<CR>')
-- more window controls are defined in the hydra-<C-W>

---- intra-buffer navigation ----
-- I prefer the cursor at the end of a paste, usually
nmap('p', 'gp')
nmap('P', 'gP')
nmap('gp', 'p')
nmap('gP', 'P')
-- navigating/selecting last edit - easier to reach
nmap('\'"', '\'[')
nmap('\'\'', '\']')
nmap('gv', '\'[v\']V')
-- treesitter based - can be nice for ifs with many branches
-- this can be a little counter-intuitive, where each `elif` is a child of the
-- `if`, but the contents of the first branch of the `if` is also a
-- child of that same if.  Each expression is a child of the branch it is a
-- child of (every foo = bar, try:...except:..., etc)
-- Just takes a little getting used to.
nmap(']n', ":lua require('tree-climber').goto_next()<CR>" )
nmap('[n', ":lua require('tree-climber').goto_prev()<CR>" )
nmap(']p', ":lua require('tree-climber').goto_child()<CR>" )
nmap('[p', ":lua require('tree-climber').goto_parent()<CR>" )
-- emacs navigation in command mode
local readline = require 'readline'
vim.keymap.set('!', '<M-f>', readline.forward_word)
vim.keymap.set('!', '<M-b>', readline.backward_word)
vim.keymap.set('!', '<C-a>', readline.beginning_of_line)
vim.keymap.set('!', '<C-e>', readline.end_of_line)
vim.keymap.set('!', '<M-d>', readline.kill_word)
vim.keymap.set('!', '<C-w>', readline.backward_kill_word)
vim.keymap.set('!', '<M-BS>', readline.unix_word_rubout)
vim.keymap.set('!', '<C-k>', readline.kill_line)
vim.keymap.set('!', '<C-u>', readline.backward_kill_line)
-- scroll screen up/down in insert mode
imap('<C-e>', '<C-o><C-e>')
imap('<C-y>', '<C-o><C-y>')
-- arrow keys
-- I only use these when my hands aren't properly on the keyboard, so it can
-- be quite comfortable to keep just one hand near the arrow keys sometimes
-- faster but gentle scrolling
nmap('<Up>', '5<c-y>')
nmap('<Down>', '5<c-e>')
-- page up and down
nmap('<Left>', '<c-u>')
nmap('<Right>', '<c-d>')

----- LSP -----
-- I am not 100% sure whether I prefer g or l as the leader here
-- g for 'go to', but l for 'lsp'...
-- either way these mappings are experimental and I have to figure out which I
-- prefer
-- next/prev/list error
nmap('<space>n', ':lua vim.diagnostic.goto_next()<cr>')
nmap('<space>N', ':lua vim.diagnostic.goto_prev()<cr>')
nmap('<space>T', '<cmd>Telescope diagnostics<CR>')
nmap('gT', '<cmd>Telescope diagnostics<CR>') -- trouble
-- go to definition, references or implementations
nmap('<space>d', '<cmd>Telescope lsp_definitions<CR>')
nmap('gd', '<cmd>Telescope lsp_definitions<CR>')
nmap('<space>D', '<cmd>Telescope lsp_references<CR>') -- opposite of definition
nmap('gD', '<cmd>Telescope lsp_references<CR>')
nmap('<space>i', '<cmd>Telescope lsp_implementations<CR>')
nmap('gi', '<cmd>Telescope lsp_implementations<CR>')
nmap('<space>t', '<cmd>Telescope lsp_type_definitions<CR>')
-- nmap('gt', '<cmd>Telescope lsp_type_definitions<CR>')  -- already taken by tab navigation
-- show docs and signatures
nmap('<space>k', ':lua vim.lsp.buf.hover()<cr>') -- not sure why I picked k, but that is what I use
nmap('gk', ':lua vim.lsp.buf.hover()<cr>')
nmap('<space>K', ':lua vim.lsp.buf.signature_help()<cr>') -- similar(-ish) to hover
nmap('gK', ':lua vim.lsp.buf.signature_help()<cr>')
nmap('K', ':lua vim.lsp.buf.hover()<cr>')
-- code action
nmap('gl', ':lua vim.lsp.buf.code_action()<CR>')
nmap('<space>l', ':lua vim.lsp.buf.code_action()<CR>')
-- rename
nmap('<space>r', ':lua vim.lsp.buf.rename()<cr>')
nmap('R', ':lua vim.lsp.buf.rename()<cr>')
-- format buffer
nmap('<space>f', ':lua vim.lsp.buf.format()<CR>')

----- GitSigns -----
-- next/prev hunk
nmap('gn', ':lua require("gitsigns").next_hunk()<CR>')
-- nmap('<space>g', ':lua require("gitsigns").next_hunk()<CR>')
nmap('gN', ':lua require("gitsigns").prev_hunk()<CR>')
-- nmap('<space>G', ':lua require("gitsigns").prev_hunk()<CR>')
nmap('gs', ':lua require("gitsigns").stage_buffer()<CR>')
nmap('<space>s', ':lua require("gitsigns").stage_hunk()<CR>')
nmap('<space>u', ':lua require("gitsigns").reset_hunk()<CR>')
nmap('<space>h', ':lua require("gitsigns").undo_stage_hunk()<CR>')
nmap('gl', ':Gitsigns<CR>')

----- searching -----
-- fuzzy find in current buffer
nmap('//', ':FH<cr>')

---- fixes to remember the cursor position ----
-- when searching
nmap('?', 'mh?')
nmap('/', 'mh/')
-- for commands e.g. :%s/
nmap(':', 'mg:')
-- when auto-indenting a paragraph or function
nmap('==', 'mh=ip=if`h')
-- when indenting or unindenting a line
nmap('<<', 'mh<<`hhh')
nmap('>>', 'mh>>`hll')
-- when formatting a line, also indent it, and remember the cursor position
nmap('gqq', 'mhgqq==`h')
-- when formatting a paragraph and remember the cursor position
nmap('gqip', 'mhgqip=ip`h')

---- various ----
-- select the surrounding {} block including its definition (on the same line)
-- assumes the `for () {/newline` format, rather than `for () /newline {`
nmap('va{', 'va{V')
-- swap the two keys under the cursor
nmap('sx', '"xx"xp')
-- help in vertical split
cmap(':hh', 'vert help ')
-- fold less => zl, asopposed to fold more => zm
-- this shouldn't have an uppercase version because zL is already in use
nmap('zl', 'zr')

---- registers ----
-- yank into system register
-- keep in mind "+ and "* are different system registers
vmap('""', '"+ygv"*y')
nmap('""', '"+yygv"*y')
nmap('++', '"+p')
vmap('++', 'x"+P')
imap('"++', '<C-R>+')
-- by default use black hole register rather than unnamed
nmap('d', '"_d')
nmap('D', '"_D')
nmap('c', '"_c')
nmap('C', '"_C')
nmap('s', '"_s')
nmap('S', '"_S')
nmap('x', '"_x')
nmap('X', '"_X')
-- for visual mode as well, except 'd'
vmap('x', '"_x')
vmap('X', '"_X')
vmap('c', '"_c')
vmap('C', '"_C')
vmap('s', '"_s')
vmap('S', '"_S')
-- also, don't need C, D, Y in visual, and S seems to be the same as cc
nmap('S', '"_ddP')
vmap('C', '"_xP')

---- tabs ----
-- new tab with current buffer
nmap('<C-W>T', ':tab split<CR>')
nmap('gT', ':tab split<CR>')
-- goto next/previous tab
-- nmap('gt', ':tabnext<CR>')  -- this is in by default, even with a count
nmap('gh', ':tabprevious<CR>')
-- nicely/force close tab
nmap('gx', ':tabclose<CR>')
nmap('gX', ':tabclose!<CR>')
-- rename current tab
-- waits for argument in command mode
nmap('gr', ':TablineTabRename ')

---- line ----
-- start insert mode with a new line above or below while maintaining indent
nmap('o', 'ox<BS>')
nmap('O', 'Ox<BS>')
-- move current line down by one
-- i.e. insert newline above the curose, cursor stays on current line
nmap('<C-j>', 'Ox<BS><Esc>0"_d$j')
-- insert new line below the cursor and move cursor to new line
nmap('<C-m>', 'ox<BS><Esc>0"_d$')
nmap('<Enter>', 'ox<BS><Esc>0"_d$')
-- insert newline at the cursor and exit insert mode
imap('<C-j>', '<C-G>u<CR>x<BS><Esc>')
-- insert newline at the cursor and keep typing
imap('<C-m>', '<C-G>u<CR>x<BS><C-G>u')
-- break the line at the last space before the cursor
-- defaults to cursor if there is no space before the cursor on this line
nmap('<M-j>', 'F<Space>i<Enter><Esc>k$')
-- join this line with the next while maintaining cursor position
-- breaks use of [count]J, but I don't usually use that anyway
nmap('J', 'mJJ`J')

---- spelling ----
-- choose the first suggestion for the word under the cursor
nmap('zz', 'z=1<CR><CR>')
-- choose the first suggestion for the last misspelled word (before the cursor)
-- also returns the cursor to its original position
nmap('zs', 'ms[sz=1<CR><CR>`s')
