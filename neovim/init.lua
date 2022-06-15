-- ### this will be used throughout the config
-- mapping keys
local keymap = vim.api.nvim_set_keymap
local keyopt = { noremap = true }
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

imap('<C-j>', '<C-G>u<CR>x<BS><Esc>')
imap('<C-m>', '<C-G>u<CR>x<BS><C-G>u')

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

nmap('zz', 'z=1<CR><CR>')
nmap('zs', 'ms[sz=1<CR><CR>`s')

--vmap('yt', ':Tyank<CR>')
--vmap('yy', 'y')

--""" --- anything that sends you around the buffer, search, tags, marks --- """

--"-- search patterns
--" 
--set ignorecase
--set smartcase

--" -- cpoptions
--" this is copied from the default
--set cpoptions=aABceFs
--" and 'J' added
--" https://stevelosh.com/blog/2012/10/why-i-two-space/  under the 'Power' heading
--set cpoptions+=J
--set joinspaces

--"-- textwidth
--set textwidth=80
--""set colorcolumn=+1

--"-- indents and lines
--" set tabwidth to 2
--set tabstop=2 shiftwidth=2 expandtab
--" smartindent is better than just autoindent
--set smartindent
--" auto-format options
--set formatoptions=roqlnjp
--" for the most part i don't like softwraping lines
--set nowrap nolinebreak list
--set listchars=tab:<->,eol:$

--"-- folding
--set foldlevel=8

--" -- simple formatting function
--function FormatThisBuffer()
--  mark q
--  norm gggqG
--  norm `q
--endfunction

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


--"-- formatting
--" the language client can be used to format very nicely
--" however, if there is no server setup it gets vim stuck

--" because the filetype is not really accessible inside setup scripts the best
--" thing I can really do is set it on BufEnter, even if that means it is
--" redundantly setting the option.  As long as I don't have too many languages
--" installed that should do.

--" function! LanguageClient_Formatting_Expression()
--"   for lang in keys(g:LanguageClient_serverCommands)
--"     if lang ==? &filetype
--"       set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
--"       break
--"     endif
--"   endfor
--"   if $formatexpr ==? ""
--"   endif
--" endfunction

--" augroup LanguageClinet_Formatting
--"   autocmd!
--"   autocmd BufEnter * call LanguageClient_Formatting_Expression()
--" augroup END

--""" --- augroups

--"-- [WIP] on save :w
--""augroup LanguageClient_saveAction
--""  autocmd!
--""  :call LanguageClient#textDocument_formatting()<CR>
--""augroup END
--""" --- the way line numbers and the cursorline are displayed
--" source and inspiration https://jeffkreeftmeijer.com/vim-number/
--" and their plugin https://github.com/jeffkreeftmeijer/vim-numbertoggle

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
--""" --- setting marks at convenient times --- """
--" It often annoys me when an operation moves the cursor and I have to navigate
--" back. This should help

--""" --- copied from git bash's vimrc (git/etc/vimrc)
--set mouse=

--set showmode
--set visualbell
--set showmatch
--set laststatus=2
--""set clipboard=unnamed
--set wildmode=list:longest,longest:full
--"-- statusline, right now just copied from git
--set statusline=%f               " filename relative to current $PWD
--set statusline+=%h              " help file flag
--set statusline+=%m              " modified flag
--set statusline+=%r              " readonly flag
--set statusline+=\ [%{&ff}]      " Fileformat [unix]/[dos] etc...
--set statusline+=\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})  " last modified timestamp
--set statusline+=%=              " Rest: right align
--set statusline+=%l,%c%V         " Position in buffer: linenumber, column, virtual column
--set statusline+=\ %P            " Position in buffer: Percentage
--""" --- use the black hole register more often

--" -- display option
--" size of the netr buffer
--""let g:netrw_winsize = 15
--" how files are listed, 3 = tree view
--let g:netrw_liststyle = 3
--" what <CR> does to a file, 0 = open inside netr buffer
--let g:netrw_browse_split = 0
--" vertical split buffers to the right instead of the left
--let g:netrw_altv = 1
--" turn off banner
--let g:netrw_banner = 0
--" browse from buffer file location, not project location
--let netrw_keepdir = 1
--" https://github.com/tpope/vim-vinegar/issues/13#issuecomment-489440040
--let netrw_fastbrowse = 0

--" -- opening related
--" to enable some autocmd when vim opens
--autocmd StdinReadPre * let s:std_in=1
--" open current dir in netr when starting vim without specifying a file
--autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | Explore | endif
--" open nert when starting in a directory rather than a file
--autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') | Explore | endif
--" open netr on :tabnew, seems to break something right now
--""autocmd BufWinEnter * silent Explore

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
--""" --- stuff to prompt the user at startup in certain conditions --- """
