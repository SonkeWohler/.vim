vim.api.nvim_del_keymap('i', '<C-W>')
vim.api.nvim_del_keymap('i', '<C-U>')

imap('<C-l>', '<Del>')

imap('``', '|')
imap('1`', '`')
imap('2`', '``')
imap('3`', '```')
imap('qq', '\\')
imap('1q', 'q')
imap('2q', 'qq')
imap('3q', 'qqq')

imap('<C-e>', '<C-o><C-e>')
imap('<C-y>', '<C-o><C-y>')

imap('{<CR>', '<C-G>u<Esc>A{<CR>x<BS><CR>}<C-G>u<Esc>kA')
imap('{<C-j>', '<C-G>u<Esc>A{<CR>x<BS><CR>}<C-G>u<Esc>kA')

cmap('``', '|')
cmap('1`', '`')
cmap('2`', '``')
cmap('3`', '```')
cmap('qq', '\\')
cmap('1q', 'q')
cmap('2q', 'qq')
cmap('3q', 'qqq')

cmap('<c-b>', '<Left>')
cmap('<c-f>', '<Right>')
cmap('<m-b>', '<S-Left>')
cmap('<m-f>', '<S-Right>')
cmap('<c-a>', '<Home>')
cmap('<c-e>', '<End>')
cmap('<c-d>', '<Del>')
cmap('<c-p>', '<Up>')
cmap('<c-n>', '<Down>')

cmap('<c-q>', '<C-e><c-u><c-h>')

cmap(':hh', 'vert help ')

nmap('va{', 'va{V')

-- https://vim.fandom.com/wiki/Search_for_visually_selected_text
--vmap('//', '"vy/\V<C-R>=escape(@v,'/\')<CR><CR>')

nmap('?', 'mh?')
nmap('/', 'mh/')
nmap('<<', 'mh<<`hhh')
nmap('>>', 'mh>>`hll')

nmap('sx', '"xx"xp')

nmap('<Up>', '5<c-y>')
nmap('<Down>', '5<c-e>')
nmap('<Left>', '<c-u>')
nmap('<Right>', '<c-d>')

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
nmap('c', '"_c')
nmap('C', '"_C')

nmap('<C-W>T', ':tab split<CR>')
nmap('gT', ':tab split<CR>')
nmap('gt', ':tabnext<CR>')
nmap('gh', ':tabprevious<CR>')
nmap('gx', ':tabclose<CR>')
nmap('gX', ':tabclose!<CR>')

nmap('o', 'ox<BS>')
nmap('O', 'Ox<BS>')

nmap('<C-j>', 'Ox<BS><Esc>0"_d$j')
nmap('<C-m>', 'ox<BS><Esc>0"_d$')
nmap('<Enter>', 'ox<BS><Esc>0"_d$')
imap('<C-j>', '<C-G>u<CR>x<BS><Esc>')
imap('<C-m>', '<C-G>u<CR>x<BS><C-G>u')
nmap('<M-j>', 'F<Space>i<Enter><Esc>k$')
nmap('J', 'mJJ`J')

imap('<C-j>', '<C-G>u<CR>x<BS><Esc>')
imap('<C-m>', '<C-G>u<CR>x<BS><C-G>u')

nmap('zz', 'z=1<CR><CR>')
nmap('zs', 'ms[sz=1<CR><CR>`s')

