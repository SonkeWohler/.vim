vim.api.nvim_del_keymap('i', '<C-W>')
vim.api.nvim_del_keymap('i', '<C-U>')

---- insert mode ----
-- delete key in insert mode
imap('<C-l>', '<Del>')
-- automatically create {} block with indentation
imap('{<C-j>', '{<CR>}<Esc>Ox<BS><Esc>')
-- automatically create {} block with indentation and keep typing
-- this works with <c-m> because that is internally equivalent to <CR>
imap('{<CR>', '{<CR>}<Esc>O<C-g>u')

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

---- navigation ----
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


-- https://vim.fandom.com/wiki/Search_for_visually_selected_text
--vmap('//', '"vy/\V<C-R>=escape(@v,'/\')<CR><CR>')

---- remember cursor position ----
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

---- registers ----
-- yank into system register
nmap('""', '"+y')
vmap('""', '"+y')
--by default use black hole register rather than unnamed
nmap('d', '"_d')
nmap('D', '"_D')
nmap('c', '"_c')
nmap('C', '"_C')
nmap('s', '"_s')
nmap('S', '"_S')
nmap('x', '"_x')
nmap('X', '"_X')
nmap('x', '"_x')
nmap('X', '"_X')

---- tabs ----
-- new tab with current buffer
nmap('<C-W>T', ':tab split<CR>')
nmap('gT', ':tab split<CR>')
-- goto next/previous tab
nmap('gt', ':tabnext<CR>')
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
-- breaks use of [count]J
nmap('J', 'mJJ`J')

---- spelling ----
-- choose the first suggestion for the word under the cursor
nmap('zz', 'z=1<CR><CR>')
-- choose the first suggestion for the last misspelled word (before the cursor)
nmap('zs', 'ms[sz=1<CR><CR>`s')

