echo configuration loaded: Soenke Default

# set vi mode 
## set -o vi

# file manipulation aliases
alias mkd='mkdir -vp'
alias rmv='rm -rv'
alias rmd='rm -dv'
alias mvv='mv -v'
alias cpv='cp -rv'

# file and directory viewing aliases
alias lessx='less -RFX'
alias lsa='ls -lAh'
alias lsx='lsa --color=always | less -RFX'

# git related aliases
alias gitCC='git add -A ; git commit -m'
alias gitC='git add -A ; git commit'
alias gitch='git checkout --' # for resetting files when I don't like the changes
alias gitvv='git branch -vv'
alias gitf='git fetch ; git status'
alias gitF='git pull ; git status'
