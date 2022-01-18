""" --- vimrc for neovim

"-- load vimrc and packages from traditional vim

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

"-- neovim adds <C-G>u to <C-W> and <C-U> in insert by default

iunmap <C-W>
iunmap <C-U>