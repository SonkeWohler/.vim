### --- anything related to file viewing, manipulating, directories etc --- ###

### --- file manipulation, I like everything verbal

alias mkd='mkdir -vp'
alias rmv='rm -rv'
alias rmd='rm -dv'
alias mvv='mv -v'
alias cpv='cp -rv'
mkcd() { mkdir -vp $1 ; cd $1 ; }

### --- file and directory viewing/changing aliases

# -- ls etc
alias lessx='less -RF'
alias lsa='ls -lAh'
lsx() { lsa --color=always $1 | lessx ; }
# in case that anything is wrong with vim or special use cases
alias novim='vim -u NONE' 

# -- cd
# back
alias cd-='cd -' 
# up
alias cd.='cd ..' 
cda() { cd $1 && lsa ; }

### --- oversimplified bookmarks

alias cdd='cd $journalCD'
alias cdw='cd $workCD'
alias cdt='cd $tempCD'
alias cdv='cd $vimCD'
