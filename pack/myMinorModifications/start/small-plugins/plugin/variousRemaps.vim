""" --- remappings for general purpose operations --- """

""" --- viewing

" So I can more easily scroll though a file with hands off keyboard too
nnoremap <Up> 5<c-y>
nnoremap <Down> 5<c-e>
nnoremap <Left> <c-u>
nnoremap <Right> <c-d>

""" --- insert/command

" I am missing a <Del> key, but <C-d> (used in bash) is already taken
inoremap <C-l> <Del>

" swap two chars, like xp but without effecting "_ and as one atom
nnoremap sx "xx"xp

"-- bracketing

" open {} block from insert
inoremap \{ <C-G>u<Esc>A{<CR>x<BS><CR>}<C-G>u<Esc>kA
inoremap {<CR> <C-G>u<Esc>A{<CR>x<BS><CR>}<C-G>u<Esc>kA
inoremap {<C-j> <C-G>u<Esc>A{<CR>x<BS><CR>}<C-G>u<Esc>kA

"-- keyboard layout
" On my new keyboard \ and | are in a weird place and in combination with my
" keyboard layout they are unaccessible
inoremap `` \|
inoremap 2` \|\|
inoremap qq \
inoremap 22q qq
inoremap 2q \\
inoremap 3q \\\
inoremap 4q \\\\
inoremap 5q \\\\\
" the same in command mode
cnoremap `` \|
cnoremap 2` \|\|
cnoremap qq \
cnoremap 22q qq
cnoremap 2q \\
cnoremap 3q \\\
cnoremap 4q \\\\
cnoremap 5q \\\\\
" which gives me an idea about comments
nnoremap q- o\\-<cr><Esc>
nnoremap #- o#--<cr><Esc>
nnoremap "- o"--<cr><Esc>

"-- navigation

cnoremap <c-a> <c-b>
cnoremap <c-i> <Left>
cnoremap <c-o> <Right>
cnoremap <c-b> <S-Left>
cnoremap <c-f> <S-Right>

""" --- normal mode

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
inoremap <C-j> <C-G>u<CR>x<BS><Esc>
inoremap <C-m> <C-G>u<CR>x<BS><C-G>u

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

