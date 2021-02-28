### --- git --- ###

### --- note: with Capital letters in it means it will commit something/ make
# permanent changes/ delete something that has been staged for commit etc.

### --- navigation

# root of git repo
alias root='cd $(git rev-parse --show-toplevel)' 
# return from git submodule to root of superproject
alias git.='root ; cd .. ; root'

### --- diffs related

#-- commits
# easy commit everything
alias gitCC='git add -A ; git commit -m' 
# easy commit everything
alias gitC='git add -A ; git commit -v' 

#-- clean
# unstage a list of files
alias gitq='git restore --staged' 
# unstage all changes
alias gitqa='git restore --staged :/' 
# completely restore a file to <HEAD>
gitQ() { git restore --staged $1 ; git restore $1 ; } 
# restore to <HEAD>
alias gitQa='git clean --force -d ; git restore --staged :/ ; git restore :/' 

#-- diff
# list unstaged changes
alias gitd='git diff'
# staged changes only
alias gitdif='git diff --staged'
# staged changes only
alias gitdiff='git diff --staged' 

### --- status

alias gits='git status'
alias gitf='git fetch ; git status'
alias gitF='git pull ; git status'

### --- branches

alias gitch='git checkout'
# list all branches
alias gitvv='git branch -vv' 
# create new branch, checkout that branch and push it upstream
gitbranch() {
  git branch $1 && git checkout $1 && git push --set-upstream origin $1
}

### --- cleaning

# remove dead branches 
# ( https://medium.com/@kcmueller/delete-local-git-branches-that-were-deleted-on-remote-repository-b596b71b530c  )
gitqbranches() { 
  git checkout master
  git remote prune origin
  git branch -vv | grep ': gone]'|  grep -v "\*" | awk '{ print $1; }' | xargs -r git branch -D 
}
# thorough cleanup in line with origin
alias gitQean='gitqbranches ; git pull ; gitQa' 

### --- log

#-- note:
# use lessx to clear the output with 'q', rather than spamming my screen after I'm done looking at it
# $1 can be used for other options or to specify the number of commits to display before cutting
# one day these will be colorful

#-- git log my way ; to make it easy to change my preferred format 
# default
alias gitlogm='git log --pretty=format:"%an, %ar :: %s"' 
# hash
alias gitlogmh='git log --pretty=format:"%h, ad :: %s"'
# graph
alias gitlogmg='git log --pretty=format:"%ar :: %s"'
#-- list commits
#-- note: I haven't figured out how to make less give this in color yet
gitlog() { gitlogm $1 $2 $3 | less -R ; } 
gitlogh() { gitlogmh $1 $2 $3 | less -R ; }
# it can be useful to see in color
gitlogp() { gitlogm -p $1 $2 $3 ; } 
# but I usually prefer in less
gitlogpx() { gitlogp | less -R ; }
#-- graph
gitgraph() { gitlogmg --graph $1 $2 $3 | less -R ; } 
