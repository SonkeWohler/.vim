echo configuration loaded: Soenke Default # sometimes used for debugging
cd ~ # sometimes bash is started in a different directory (e.g. in administrator rights)

### --- note: single `#` is used for comments, usually at the end of the line
### --- note: double `##` is used to comment out lines of code, much like is convention in vimrc

## set -o vi # set vi mode 

### --- other utilities
alias exx='sleep 0.1s ; exit' # prevents issues related to Capslock being mapped to Ctrl

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
# note: with Capital letters in it means it will commit something/ make permanent changes/ delete something that has been staged for commit etc.
alias gitCC='git add -A ; git commit -m' # easy commit
alias gitC='git add -A ; git commit' # easy commit
alias gitd='git checkout .' # undo all unstaged
alias gitch='git checkout --' # undo specific file
alias gitvv='git branch -vv' # list all branches
alias gitdif='git diff --'
alias gitdiff='git diff --'
alias gitf='git fetch ; git status'
alias gitF='git pull ; git status'
alias gitqbranches='git branch -d $(git branch --merged |tail -n +2)' # remove any branches that don't exist on origin
alias gitQean='git pull ; git reset --hard [HEAD] ; git clean [-f] ; git branch -d $(git branch --merged |tail -n +2)' # thorough cleanup in line with origin

### --- kotlin related

# compile a `kotlin.kt` file to `kotlin.kt.jar`, because it is easier
kotlinCompile () {
  kotlinc $1 -include-runtime -d $1.jar
}

# compile and run `kotlin.kt` file to `kotlin.kt.jar`
kotlinRun () {
  kotlinCompile $1 && echo "" && echo "|----- compile done -----|" && echo "" && java -jar $1.jar
}
