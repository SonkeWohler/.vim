echo 'default configuration loading'

" note: most customisation options that can be grouped will be found under
" `pack/myMinorModifications/` usually under `start/`. Anything present here
" instead is either experimental or very minor and can't be grouped into its
" own file.vim. I like to keep changes to settings here though.
" 
" note: it can be better to set an option even if it is set by default to
" ensure consistency across environments. This is obviously most useful if you
" use this vimrc in multiple locations with different OS, vim versions,
" emulators etc.
"
" note: I usually have Ctrl mapped to Capslock in my system, at least for
" terminals and vim, which makes some things easier

""" -- experimental options
" these should probably be moved to pack/myMinorModifications some time soon,
" if I keep them

" Use deoplete.
let g:deoplete#enable_at_startup = 1

""" --- plugin related stuff ---

" enable matchit that ships with vim
runtime macros/matchit.vim

""" --- settings ---

"-- automatically load `.vimrc` inside the current directory as well
""set exrc

"-- to allow loading file type stuff
filetype plugin indent on
syntax on
set encoding=utf-8
"-- buffer or window related
set nohidden

" -- spell
" I keep hitting by mistake
nnoremap \= z=
" I don't need spell in most situations, especially code
set nospell
set spellfile=~/.vim/pack/native/config/en.utf-8.add
""if &diff
""  set nospell
""endif

""" --- colorscheme ---

" note: colorschemes are defined in submodules under 'pack/vendor/opt', which vim
" searches with the colorscheme command automatically

set background=dark
""colorscheme solarized

""" --- remapping ---

""" --- hotkeys ---
" note the experimental double space after full-stop
" https://stevelosh.com/blog/2012/10/why-i-two-space/

""" --- commands ---
" quick quit this buffer without saving
:command Q q!
" quick quit all buggers without savin
:command QQ qa!
:command QA qa!
:command Qa qa!

""" --- temporary stuff
