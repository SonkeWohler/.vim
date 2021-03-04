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
set spell
if &diff
  set nospell
endif
set spellfile=~/.vim/pack/myMinorModifications/config/en.utf-8.add

""" --- remapping ---

""" --- hotkeys ---
" -- interrupt insert
" when typing long paragraphs in text flies (like markdown) I need to remind
" myself to interrupt insert mode and reenter it. There are various downsides to
" staying in insert mode for too long, like loosing granularity in undoing or
" the size of the `".` register. These hotkeys help remind me to do that.
inoremap <Leader>. .<C-G>u<Esc>a 
inoremap <Leader>q <C-G>u<Esc>a
inoremap <C-R> <C-G>u<Esc>a<C-R>

""" --- commands ---
" easier to type than q!, for my hand at least
:command QQ qa!

""" --- temporary stuff
