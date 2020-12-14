echo configuration loaded: Soenke Default # sometimes used for debugging
cd ~ # sometimes bash is started in a different directory (e.g. in administrator rights)

### --- note: single `#` is used for comments, usually at the end of the line
### --- note: double `##` is used to comment out lines of code, much like is convention in vimrc

## set -o vi # set vi mode 

### --- file manipulation aliases, I like everything verbal
alias mkd='mkdir -vp'
alias rmv='rm -rv'
alias rmd='rm -dv'
alias mvv='mv -v'
alias cpv='cp -rv'

### --- file and directory viewing aliases
alias lessx='less -RFX'
alias lsa='ls -lAh'
alias lsx='lsa --color=always | less -RFX'

### --- git related aliases
alias gitCC='git add -A ; git commit -m' # with Capital letters in it means it will commit something/ make permanent changes
alias gitC='git add -A ; git commit'
alias gitd='git checkout .'
alias gitch='git checkout --' 
alias gitvv='git branch -vv'
alias gitdif='git diff --'
alias gitf='git fetch ; git status'
alias gitF='git pull ; git status'
alias gitqbranches='git branch -d $(git branch --merged |tail -n +2)' # remove any branches that don't exist on origin
alias gitQean='git pull ; git reset --hard [HEAD] ; git clean [-f] ; git branch -d $(git branch --merged |tail -n +2)' # thorough cleanup in line with origin
