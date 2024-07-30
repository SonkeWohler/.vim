### --- git --- ###

### --- note: with Capital letters in it means it will commit something/ make
# permanent changes/ delete something that has been staged for commit etc.

### --- fzf and similar

# branches
gitb() {
    git branch --color \
        | fzf --ansi \
        | sed -e 's/* //' \
        | xargs -I {} git switch {} --recurse-submodules
}
# add changes
gita() {
    git -c color.status=always status --short \
        | fzf --multi --ansi \
        | awk '{print $2}' \
        | xargs -I {} git add {} --verbose
}
# un-add changes
gitu() {
    git -c color.status=always status --short \
        | fzf --multi --ansi \
        | awk '{print $2}' \
        | xargs -I {} git restore {} --staged
}

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
gitQ() { git restore --staged $@ ; git restore $@ ; git clean --force $@ ; }
# restore to 'HEAD'
alias gitQa='git clean --force -d ; git restore --staged :/ ; git restore :/'
# prune and remove all branches not on remote
# to be aliased from gitconfig
gitGetPrunableBranches() {
    git branch -vv | grep ': gone]'|  grep -v "\*" | awk '{ print $1; }'
}
gitPruneWell() {
  echo '-------------------------------------------------------'
  echo '---  WARNING, this will delete branches with -D !!! ---'
  echo '--- you may <C-C> now, or forever hold your silence ---'
  echo '-------------------------------------------------------'
  echo ''
  sleep 2s
  echo '`$ git fetch --prune`'
  git fetch --prune
  sleep 0.5s
  echo ''
  echo ''
  echo 'branches to be deleted:'
  echo '-----------------------'
  gitGetPrunableBranches | tr ' ' '\n'
  echo '-----------------------'
  echo ''
  echo ''
  sleep 2s
  echo '`$ git branch delete -D {}`'
  sleep 1s
  gitGetPrunableBranches | xargs -r git branch -D
}

#-- diff
# list unstaged changes
gitd() { git diff --color=always --irreversible-delete --submodule -M -C -B "$@" | dlt ; }
# staged changes only
gitdif() { git diff --irreversible-delete --staged --color=always --submodule "$@" | dlt ; }
alias gitdd='gitdif'
alias gitdiff='gitdif'

# staged changes only
alias gitdiff='git diff --staged'

### --- status

#-- viewing status
alias gits='git -c color.status=always status'

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

#-- git log format my way ; I might refactor using git alias at some point, but
#I would have to be able to use variables, which I haven't figured out yet.
# default
export gitLogMessageFormat='%Cblue%an, %Creset%cr :: %Cred%h%Creset :: %Cblue%s%Creset'
# display just default
alias gitlogmm='git log --pretty=format:"$gitLogMessageFormat"'
# diffs, where I need to catch the line between commits as I scroll through
alias gitlogmp='git log --pretty=format:"%n%n%n%n%n==================================================================================================================%n === $gitLogMessageFormat ===%n=================================================================================================================="'
# whole message (%B), this is old but I haven't removed it yet
alias gitlogmb='git log --pretty=format:"$gitLogMessageFormat%n---------------------%n%b%n%n"'
#-- list commits with a pager by default
# history
gitlog() { gitlogmm --color=always "$@" | dlt ; }
# diffs
gitlogp() { gitlogmp -p --color=always "$@" | dlt ; }
# whole message
gitlogb() { gitlogmb --color=always "$@" | dlt ; }

#-- new compared to GitHub PR base branch or development, if no base branch exists
gitHubBaseBranchNoError() {
    gitHubBaseBranch=$(gh pr view --json baseRefName | jq '.baseRefName' -r)
    if test -z $gitHubBaseBranch; then
        if git branch | grep development; then gitHubBaseBranch='development'
        else
            gitHubBaseBranch='master'
        fi
    fi
}
# log
alias gitn='gitHubBaseBranchNoError && gitlog $gitHubBaseBranch..HEAD'
alias gitnn='gitHubBaseBranchNoError && gitlog $gitHubBaseBranch...HEAD'
# diff
alias gitdn='gitHubBaseBranchNoError && gitd $gitHubBaseBranch..HEAD --relative'
alias gitdnn='gitHubBaseBranchNoError && gitd $gitHubBaseBranch...HEAD --relative'
# status
alias gitsn='gitdn --name-status'
alias gitsnn='gitdnn --name-status'
#-- missing compared to development branch
# log
alias gitm='gitHubBaseBranchNoError && gitlog HEAD..$gitHubBaseBranch'
alias gitmm='gitHubBaseBranchNoError && gitlog HEAD...$gitHubBaseBranch'
# diff
alias gitdm='gitHubBaseBranchNoError && gitd HEAD..$gitHubBaseBranch --relative'
alias gitdmm='gitHubBaseBranchNoError && gitd HEAD...$gitHubBaseBranch --relative'
# status
alias gitsm='gitdm --name-status'
alias gitsmm='gitdmm --name-status'
# since last pull
# https://stackoverflow.com/questions/12216595/how-to-show-new-commits-in-git
alias gitl='gitlog @{1}..'
alias gitdl='gitd @{1}.. --relative'
alias gitsl='gitdl --name-status'
# since last push
# https://stackoverflow.com/a/8182309
alias gitln='gitlog @{u}..'
alias gitdln='gitd @{u}..'
alias gitsln='gitdln --name-status'

### --- updating/pulling
gitp() {
    git pull "$@" && printf '\n---------------------\n' && gitlogmm @{1}..
}
alias gitpp='gitp --rebase'
