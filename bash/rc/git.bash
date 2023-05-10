### --- git --- ###

### --- note: with Capital letters in it means it will commit something/ make
# permanent changes/ delete something that has been staged for commit etc.

### --- navigation

# root of git repo
alias root='cd $(git rev-parse --show-toplevel)' 
# return from git submodule to root of superproject
alias git.='root ; cd .. ; root'

# git switch and switch back
alias gitsw='git switch'
# alias git-='git switch -'
# alias gi-='git switch -'
alias git-='git switch -'

### --- diffs related

#-- commits
# easy commit everything
alias gitCC='git add -A ; git commit -m' 
# easy commit everything
alias gitC='git add -A ; git commit -v' 

#-- multiple commits
# squash commits on current branch similar to git squash
gitSquash() {
  if [[ $1 = "h" ]] || [[ $1 = "" ]]; then
    echo ' "gitSquash x message"'
    echo "  Squash the last x commits into one, prepending 'message' to the commit message"
    return 0
  fi
  # https://stackoverflow.com/questions/806906/how-do-i-test-if-a-variable-is-a-number-in-bash
  re='^[0-9]+$'
  if ! [[ $1 =~ $re ]]; then
    echo "gitSquash requires an integer as its first argument"
    return 1
  fi
  # https://stackoverflow.com/questions/5189560/squash-my-last-x-commits-together-using-git
  git reset --soft HEAD~"$1" &&
  git commit --edit --message="$2" --message="squashing commits:" --message="$(git log --format="%cn (%ci) :: %s%nhash[ %H ]%n%b%n" --reverse HEAD..HEAD@{1})"
}

#-- reseting, since I keep forgetting
# soft reset, but don't need it staged
alias  gitr='git reset --soft HEAD~ && git restore --staged :/'
# hard reset
alias gitR='git reset --hard HEAD~'

#-- clean
# unstage a list of files
alias gitq='git restore --staged' 
# unstage all changes
alias gitqa='git restore --staged :/' 
# completely restore a file to 'HEAD'
gitQ() { git restore --staged $1 ; git restore $1 ; } 
# restore to 'HEAD'
alias gitQa='git clean --force -d ; git restore --staged :/ ; git restore :/' 

#-- diff
# list unstaged changes
gitd() { git diff --color=always --submodule -M -C -B $@ | lessx ; }
# staged changes only
gitdif() { git diff --staged --color=always --submodule $@ | lessx ; }

# staged changes only
alias gitdiff='git diff --staged' 

### --- status

#-- viewing status
alias gits='git status'
alias gitsx='git -c color.status=always status | less -RF --use-color'
alias gitf='git fetch ; git status'
alias gitF='git pull ; git status'

#-- updating/pulling
# https://stackoverflow.com/questions/12216595/how-to-show-new-commits-in-git
alias gitp='git pull && printf '\n--------------------\n' && gitlog @{1}..'

### --- branches

alias gitch='git checkout'
# list all branches
alias gitvv='git branch -vv' 
# create new branch, checkout that branch and push it upstream
gitbranch() {
  git branch $1 && git checkout $1 && git push --set-upstream origin $1
}

### --- remotes

#-- force with lease
alias pleasegit='git push --force-with-lease'

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

#-- git log my way ; to make it easy to change my preferred format 
# default
alias gitlogm='git log --pretty=format:"%cn, %cr :: %s"' 
# hash
alias gitlogmh='git log --pretty=format:"%h, %cd  -- %cn  :: %s"'
# diffs
alias gitlogmp='git log --pretty=format:"%n%h, %cd :: %s%n=============================================%n"'
# graph
alias gitlogmg='git log --pretty=format:"%cr :: %s"'
# whole message (%B)
alias gitlogmb='git log --pretty=format:"%Cblue%cn, %cr %Cred(%cd)%Creset :: %H%n%Cgreen%s %n%n%b"'
#-- list commits
# history
gitlog() { gitlogm --color=always $@ | lessx ; } 
# hashes
gitlogh() { gitlogmh --color=always $@ | lessx ; }
# diffs
gitlogp() { gitlogmp -p --color=always $@ | lessx ; }
# graph
gitgraph() { gitlogmg --graph --color=always $@ | lessx ; } 
# whole message
gitlogb() { gitlogmb --color=always $@ | lessx ; }

### --- submodules

giteach() {
  git submodule foreach "$@ && echo '' || echo '+++ command failed +++' && echo ''"
}
giteachall() {
  giteach --recursive $@
}
giteachone() {
  giteach $1
}

gitsub() {
  currentpath=$PWD
  cd $1 || return 1
  eval $2
  cd $currentpath
}

alias gitsubupdate='git submodule update --recursive --remote'

# alias gitpullsubs='git pull && echo && git submodule foreach "git checkout development && git pull ; echo "'
alias gitpullsubs='git checkout development && git pull && git submodule foreach "git checkout development && git pull"'
alias gitsubpull='gitpullsubs'
alias gitsubbranches='git submodule foreach "git branch --show-current"'
alias gitresetwork='gitsubpull && make rebuild-dev'

gitsubd() {
    git diff --color=always -M -B -C $@ && git submodule foreach "git diff --color=always -M -B -C $@" | lessx
}
