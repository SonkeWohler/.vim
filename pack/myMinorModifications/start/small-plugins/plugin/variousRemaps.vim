""" --- remappings for general purpose operations --- """

""" --- various

" I am missing a <Del> key, but <C-d> (used in bash) is already taken
inoremap <C-l> <Del>

"-- viewing
" So I can more easily scroll though a file with hands off keyboard too
nnoremap <Up> 5<c-y>
nnoremap <Down> 5<c-e>
nnoremap <Left> <c-u>
nnoremap <Right> <c-d>

"-- keyboard layout
" On my new keyboard \ and | are in a weird place and in combination with my
" keyboard layout it is unaccessible
inoremap `` \|
inoremap zz \
inoremap 2z \\
inoremap 3z \\\
inoremap 4z \\\\
inoremap 5z \\\\\
" the same in command mode
cnoremap `` \|
cnoremap zz \
cnoremap 2z \\
cnoremap 3z \\\
cnoremap 4z \\\\
cnoremap 5z \\\\\

"-- new lines
" keep indentation or whitespace from being deleted with <Esc>, <C-R> or the like
" https://vim.fandom.com/wiki/Get_the_correct_indent_for_new_lines_despite_blank_lines
nnoremap o ox<BS>
nnoremap O Ox<BS>
" I feel like inserting a single new line should be done in normal mode
nnoremap <C-j> Ox<BS><Esc>0"_d$j
nnoremap <C-m> ox<BS><Esc>0"_d$
" In insert new lines should be a separate atom
""inoremap <C-j> <C-G>u<Esc>a<CR>
inoremap <C-j> <CR>x<BS><Esc>
inoremap <C-m> <CR>x<BS><C-G>u

"-- bracketing
" open {} block from insert
inoremap \{ <C-G>u<Esc>A{<CR>x<BS><CR>}<C-G>u<Esc>kA
inoremap {<CR> <C-G>u<Esc>A{<CR>x<BS><CR>}<C-G>u<Esc>kA
inoremap {<C-j> <C-G>u<Esc>A{<CR>x<BS><CR>}<C-G>u<Esc>kA

""" --- Esc key
"-- I don't enjoy <C-[> with my little finger, so I use <C-Q>
inoremap <c-q> <Esc>
vnoremap <c-q> <Esc>
nnoremap <c-q> <Esc>
xnoremap <c-q> <Esc>
snoremap <c-q> <Esc>
onoremap <c-q> <Esc>
" See Issue #5 https://github.com/SonkeWohler/.vim/issues/5
cnoremap <c-q> <C-e><c-u><c-h>

""" --- command mode navigation
"-- need a more efficient way to navigate, inspired by my chrome shortcuts i guess
" can use <c-r>. instead, and this is important
cnoremap <c-a> <c-b>
cnoremap <c-i> <Left>
cnoremap <c-o> <Right>
cnoremap <c-b> <S-Left>
cnoremap <c-f> <S-Right>


