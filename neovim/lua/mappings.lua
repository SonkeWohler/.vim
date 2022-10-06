----- cleanup -----
-- unlike in vim, neovim by default splits undos in insert mode when using these
-- I use these a lot and prefer a single insert mode to be atomic
vim.api.nvim_del_keymap('i', '<C-W>')
vim.api.nvim_del_keymap('i', '<C-U>')

---- insert mode ----
-- delete key in insert mode
imap('<C-l>', '<Right>')

---- keyboard layout fixes ----
-- use double ` for | in insert mode
imap('``', '|')
imap('1`', '`')
imap('2`', '``')
imap('3`', '```')
-- use double q for \ in insert mode
imap('qq', '\\')
imap('1q', 'q')
imap('2q', 'qq')
imap('3q', 'qqq')
-- use double ` for | in command mode
cmap('``', '|')
cmap('1`', '`')
cmap('2`', '``')
cmap('3`', '```')
-- use double q for \ in command mode
cmap('qq', '\\')
cmap('1q', 'q')
cmap('2q', 'qq')
cmap('3q', 'qqq')

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
-- splilt current buffer into new tab, effectively similar to tmux zoom
nmap('<c-w>t', '<Cmd>tab split<CR>')
-- next/prev tab
nmap('<c-w>n', '<Cmd>tabnext<CR>')
nmap('<c-w>N', '<Cmd>tabprevious<CR>')
-- go to tab number, this doesn't yet work ??? wtf ???
nmap('`gt', '1gt')
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
-- resize this buffer
nmap('<c-w><', ':lua require("smart-splits").resize_left(3)<CR>')
nmap('<c-w>>', ':lua require("smart-splits").resize_right(3)<CR>')
nmap('<c-w>=', ':lua require("smart-splits").resize_up(3)<CR>')
nmap('<c-w>-', ':lua require("smart-splits").resize_down(3)<CR>')
nmap('<c-w>+', '<c-W>=')
-- more window controls are defined in the hydra-<C-W>

---- intra-buffer navigation ----
-- methods are sort of functions
nmap(']f', ']m')
nmap(']F', ']M')
nmap('[f', '[m')
nmap('[F', '[M')
-- emacs navigation in command mode
cmap('<c-b>', '<Left>')
cmap('<c-f>', '<Right>')
cmap('<m-b>', '<S-Left>')
cmap('<m-f>', '<S-Right>')
cmap('<c-a>', '<Home>')
cmap('<c-e>', '<End>')
cmap('<c-d>', '<Del>')
cmap('<c-p>', '<Up>')
cmap('<c-n>', '<Down>')
-- easy quit in certain settings when <Esc> wasn't working right
cmap('<c-q>', '<C-e><c-u><c-h>')
-- scroll screen up/down in insert mode
imap('<C-e>', '<C-o><C-e>')
imap('<C-y>', '<C-o><C-y>')
---- arrow keys
---- I only use these when my hands aren't properly on the keyboard, so it can
---- be quite comfortable to keep just one hand near the arrow keys sometimes
-- faster but gentle scrolling
nmap('<Up>', '5<c-y>')
nmap('<Down>', '5<c-e>')
-- page up and down
nmap('<Left>', '<c-u>')
nmap('<Right>', '<c-d>')

----- LSP -----
-- next/prev error
nmap('Ln', ':lua vim.diagnostic.goto_next()<cr>')
nmap('LN', ':lua vim.diagnostic.goto_prev()<cr>')
-- go to definition, references or implementations
nmap('Ld', ':lua vim.lsp.buf.definition()<cr>')
nmap('LD', ':lua vim.lsp.buf.references()<cr>')
nmap('LI', ':lua vim.lsp.buf.implementation()<cr>')
-- show docs and signature
nmap('Lk', ':lua vim.lsp.buf.hover()<cr>')
nmap('LK', ':lua vim.lsp.buf.signature_help()<cr>')
nmap('K', ':lua vim.lsp.buf.hover()<cr>')
-- code action
nmap('Ll', ':lua vim.lsp.buf.code_action()<cr>')
-- rename
nmap('Lr', ':lua vim.lsp.buf.rename()<cr>')
-- since I don't use build-in L or H, I'd like to see hints instead
nmap('L', ':WhichKey L<CR>')

----- GitSigns -----
-- next/prev hunk
nmap('gn', ':lua require("gitsigns").next_hunk()<CR>')
nmap('gN', ':lua require("gitsigns").prev_hunk()<CR>')
nmap('gs', ':lua require("gitsigns").stage_hunk()<CR>')
nmap('gr', ':lua require("gitsigns").reset_hunk()<CR>')
nmap('gl', ':Gitsigns<CR>')

-- https://vim.fandom.com/wiki/Search_for_visually_selected_text
--vmap('//', '"vy/\V<C-R>=escape(@v,'/\')<CR><CR>')
vmap('//', '"vy/<C-R>v<CR>')

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
-- when formatting a line
nmap('gqq', 'mhgqq=ip`h')
-- when formatting a paragraph
-- also indent that paragraph
nmap('gqip', 'mhgqip=ip`h')

---- various ----
-- select the surrounding {} block including its definition (on the same line)
-- assumes the `for () {/newline` format, rather than `for () /newline {`
nmap('va{', 'va{V')
-- swap the two keys under the cursor
nmap('sx', '"xx"xp')
-- help in vertical split
cmap(':hh', 'vert help ')
-- insert only a space
nmap('<space>', 'i<space><esc>')
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
