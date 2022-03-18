
### --- docker
# WIP #
# all this is experimental
# WIP #

dattach() {
  docker exec -i -t $1 /bin/bash
}

alias dcom='docker-compose'
alias dcomup='docker-compose up -d --remove-orphans'
alias dcomp='dcomup'

alias dockerQa='docker system prune -a'

### --- package manager
# I should (eventually) adapt this to work on any package manager and use some way to detect the correct one.  Not now though.

#-- pacman

# install but update before you do
alias install='sudo pacman -Syu && sudo pacman -S '
