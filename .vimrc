echo 'default configuration loaded'

""" --- settings ---
" softwrap lines and set tabwidth to 2
set wrap linebreak nolist
set tabstop=2 shiftwidth=2 expandtab

""" --- remapping commands ---
" setup to resemble my bash command
:command LSA NERDTree
" easier to type than q!, for my hand at least
:command QQ q!
