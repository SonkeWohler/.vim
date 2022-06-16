-- ### this will be used throughout the config
-- mapping keys
keymap = vim.api.nvim_set_keymap
keyopt = { noremap = true }
-- basically nnoremap
function nmap(trigger, target)
  keymap('n', trigger, target, keyopt)
end
-- basically inoremap
function imap(trigger, target)
  keymap('i', trigger, target, keyopt)
end
-- basically cnoremap
function cmap(trigger, target)
  keymap('c', trigger, target, keyopt)
end
function vmap(trigger, target)
  keymap('v', trigger, target, keyopt)
end

require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'tomasr/molokai'
end)

vim.g.colors_name = 'molokai'

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

imap('{', '<C-G>u<Esc>A{<CR>x<BS><CR>}<C-G>u<Esc>kA')
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


vim.opt.ignorecase = true
vim.opt.smartcase = true
-- these cpoptions are largely default, I just keep things consistent
-- a: 
-- A:
-- c: search
-- e: execute straight away with @q
-- f: set buffer filename on read
-- F: set buffer filename on write
-- s: buffer options on enter
-- J: sentences end with double spaces, not single spaces
-- _: cw is more like ciw.  use caw to get the default cw
vim.opt.cpoptions = 'aABcefFsJ_'
vim.opt.joinspaces = true
vim.opt.textwidth = 80
-- vim.opt.colorcolumn = '+1'
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.formatoptions = 'roqlnjp'
vim.opt.formatoptions = 'jcroql'
-- j: handle spaces when using n_J
-- c: autwrap comments
-- r: insert comment leader in newline
-- o: insert comment leader with n_o
-- q: gq for comments
-- l: don't break in insert mode
-- n: recognize lists when formatting
-- p: don't break at single spaces '. ', since I use cpoptions 'J' this makes sense
vim.opt.formatoptions = 'jcroqlnp'
-- this is the default 
--vim.opt.formatlistpat = '^\s*\d\+[\]:.)}\t ]\s*'
vim.opt.wrap = false
vim.opt.linebreak = false
vim.opt.list = true
--set listchars=tab:<->,eol:$
vim.opt.listchars = { eol = '$', tab = '> ' }
vim.opt.foldlevel = 10
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.laststatus = 2
vim.opt.showmode = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.wildmenu = true
vim.opt.wildignorecase = true
--vim.opt.completefunc = ''

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.diffopt = vim.opt.diffopt + 'vertical'

--vmap('yt', ':Tyank<CR>')
--vmap('yy', 'y')

--" so far the only command I reall use
--:command! FF Files

--""" --- https://github.com/autozimu/LanguageClient-neovim/blob/next/INSTALL.md

--""" --- options

--let g:is_pythonsense_alternate_motion_keymaps = 1
--let g:ale_completion_enabled = 1

--""" --- language servers

----nnoremap <silent> gr mgmG:ALEFindReferences<CR>
----nnoremap <silent> L :ALECodeAction<CR>
----nnoremap <silent> <F2> :ALERename<CR>
----nnoremap <silent> gd mgmG:ALEGoToDefinition<CR>
----nnoremap <silent> gn :ALENext<CR>
----nnoremap <silent> gN :ALEPrevious<CR>
----
----inoremap <silent> <C-Space> <C-\><C-O>:ALEComplete<CR>
----
----command FIX ALEFix

--""" --- the below is left over from Language Client for Neovim
--" https://github.com/autozimu/LanguageClient-neovim/blob/next/INSTALL.md
--" nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
--" nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
--" nnoremap <silent> gr :call LanguageClient#textDocument_references()<CR>
--" nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
--" nnoremap <silent> L :call LanguageClient#textDocument_codeAction()<CR>
--" nnoremap <silent> gn :call LanguageClient#diagnosticsNext()<CR>
--" nnoremap <silent> gN :call LanguageClient#diagnosticsPrevious()<CR>
--" " did i do this one right?
--" nnoremap <silent> <C-P> :call LanguageClient#textDocument_completion()<CR>
--"-- language server
--" replaced this line from language client readmes with one from rust-analyzer
--  ""\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
--" let g:LanguageClient_serverCommands = {
--"   \ 'rust': ['rust-analyzer'],
--"   \ 'javascript': ['typescript-language-server', '--stdio'],
--"   \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
--"   \ 'typescript': ['typescript-language-server', '--stdio'],
--"   \ 'typescript.jsx': ['typescript-language-server', '--stdio'],
--"   \ 'python': ['pylsp'],
--"   \ 'sh': ['bash-language-server', 'start'],
--" \ }


--"-- cursor display
--set cursorline
--""set cursorlineopt=number
--"-- hybrid line numbers most of the time
--set number relativenumber
--"-- toggle to absolute line numbers in certain situations
--:augroup linenumbertoggle
--:  autocmd!
--:  autocmd BufWinEnter,WinEnter,BufEnter,FocusGained,InsertLeave * set relativenumber
--:  autocmd BufWinLeave,WinLeave,BufLeave,FocusLost,InsertEnter   * set norelativenumber
--:augroup END

--" always split buffers vertically
--" copied originally from: https://www.reddit.com/r/vim/comments/2irn8j/vertical_split_by_default/
--" also includes any other split related settings
--set splitright
--set splitbelow
--set diffopt+=vertical
--silent! set splitvertical
--if v:errmsg != ''
--  ""cabbrev split vert split
--  ""cabbrev e vsplit
--  ""cabbrev ee e
--  cabbrev vsplit vert split
--  cabbrev hsplit split
--  cabbrev help vert help
--  noremap <C-w>] :vert botright wincmd ]<CR>
--  noremap <C-w><C-]> :vert botright wincmd ]<CR>
--else
--  cabbrev hsplit hor split
--endif
