""" --- small settings and modifications about appearances or commands --- """

""" --- copied from git bash's vimrc (git/etc/vimrc)
set mouse=

set showmode
set visualbell
set showmatch
set laststatus=2
set clipboard=unnamed
set wildmode=list:longest,longest:full
"-- statusline, right now just copied from git
set statusline=%f               " filename relative to current $PWD
set statusline+=%h              " help file flag
set statusline+=%m              " modified flag
set statusline+=%r              " readonly flag
set statusline+=\ [%{&ff}]      " Fileformat [unix]/[dos] etc...
set statusline+=\ (%{strftime(\"%H:%M\ %d/%m/%Y\",getftime(expand(\"%:p\")))})  " last modified timestamp
set statusline+=%=              " Rest: right align
set statusline+=%l,%c%V         " Position in buffer: linenumber, column, virtual column
set statusline+=\ %P            " Position in buffer: Percentage

""" --- colorscheme

" note: colorschemes are defined in submodules under 'pack/vendor/opt', which vim
" searches with the colorscheme command automatically

set background=dark
colorscheme solarized




