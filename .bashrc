echo configuration loaded: Soenke Default # sometimes used for debugging
cd ~ # sometimes bash is started in a different directory (e.g. in administrator rights)

### --- note: single `#` is used for comments, usually at the end of the line
### --- note: double `##` is used to comment out lines of code, much like is convention in vimrc

##set -x # currently in debugging mode, shouldn't be committed like that

### --- other utilities
alias exx='sleep 0.25s ; exit' # reduces issues related to Capslock being mapped to Ctrl
bind '"\C-l":" | lessx"' # i prefer to type `clear` out and now I found a use for \C-l
##bind -r "\C-i" # this sometimes annoys me as on windows autocomplete can take a while in certain situations
## set -o vi # set vi mode 

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
alias novim='vim -u NONE' # in case that anything is wrong with vim or special use cases
# -- cd
alias cd-='cd -' # back
alias cd.='cd ..' # up
cda() { cd $1 && lsa ; }
# -- oversimplified bookmarks
alias cdd='cd $journalCD'
alias cdw='cd $workCD'
tempCD="/d/temp"
alias cdt='cd $tempCD'
vimCD="~/.vim"
alias cdv='cd $vimCD'
# define bookmarks above in this file, specific to the machine I am working on
bashLocationsFile="locationsForCD.bash"
if test -f $bashLocationsFile; then
  source $bashLocationsFile 
  echo "sourced" $bashLocationsFile
else
  echo "couldn't source" $bashLocationsFile "see ~/.vim/README.md under '#### Bash'"
fi

### --- git related aliases
# note: with Capital letters in it means it will commit something/ make permanent changes/ delete something that has been staged for commit etc.
#-- navigation
alias root='cd $(git rev-parse --show-toplevel)' # root of git repo
#-- commits
alias gitCC='git add -A ; git commit -m' # easy commit everything
alias gitC='git add -A ; git commit -v' # easy commit everything
#-- diffs related
alias gitq='git restore --staged' # unstage a list of files
alias gitqa='git restore --staged :/' # unstage all changes
gitQ() { git restore --staged $1 ; git restore $1 ; } # completely restore a file to <HEAD>
alias gitQa='git clean --force -d ; git restore --staged :/ ; git restore :/' # restore to <HEAD>
alias gitd='git diff' # list unstaged changes
alias gitdif='git diff --staged' # staged changes only
alias gitdiff='git diff --staged' # staged changes only
#-- status
alias gits='git status'
alias gitf='git fetch ; git status'
alias gitF='git pull ; git status'
#-- branches
alias gitch='git checkout'
alias gitvv='git branch -vv' # list all branches
gitbranch() { git branch $1 && git checkout $1 && git push --set-upstream origin $1 ; } # create new branch, checkout that branch and push it upstream
#-- cleaning
# remove dead branches ( https://medium.com/@kcmueller/delete-local-git-branches-that-were-deleted-on-remote-repository-b596b71b530c  )
gitqbranches() { 
  git checkout master
  git remote prune origin
  git branch -vv | grep ': gone]'|  grep -v "\*" | awk '{ print $1; }' | xargs -r git branch -D 
}
alias gitQean='gitqbranches ; git pull ; gitQa' # thorough cleanup in line with origin
#-- log
alias gitlogm='git log --pretty=format:"%an, %ar :: %s"' # git log my way ; to make it easy to change my preferred format 
gitlog() { gitlogm $1 $2 $3 | less -R ; } 
gitlogp() { gitlogm -p $1 $2 $3 ; } 
gitlogpx() { gitlogp | less -R ; }
gitgraph() { git log --pretty=format:"%ar :: %s" --graph $1 $2 $3 | less -R ; } # doesn't use default format
# to clear the output with 'q', rather than spamming my screen after I'm done looking at it
# $1 can be used for other options, but it's intent was to allow specifying a number of commits to be displayed (although since I use less, why do I care?
# one day these will be colorful

### --- kotlin related

# compile a `kotlin.kt` file to `kotlin.kt.jar`, because it is easier
kotlinCompile () {
  kotlinc $1 -include-runtime -d $1.jar
}

# compile and run `kotlin.kt` file to `kotlin.kt.jar`
kotlinRun () {
  kotlinCompile $1 && echo "" && echo "|----- compile done -----|" && echo "" && java -jar $1.jar
}

### --- sourcing optional content
# sdkman https://sdkman.io/
alias sdkSource='source ~/.sdkman/sourceSDK'
