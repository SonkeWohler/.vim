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
lsx() { lsa --color=always $@ | lessx ; }

# -- cd
# back
alias cd-='cd -' 
# up
alias cd.='cd ..' 
# lsa after cd
cda() { cd $@ && lsa ; }

### --- oversimplified bookmarks

alias cdd='cd $writingCD'
alias cdwork='cd $workCD'
alias cdihp='cd $workCD/iHP'
alias cdt='cd $tempCD'
alias cdv='cd $vimCD'
alias cdl='cd $librariesCD'
alias cdw='cd $wikiCD'
