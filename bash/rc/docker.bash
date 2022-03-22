
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
