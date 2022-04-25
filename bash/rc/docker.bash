
### --- docker
# WIP #
# all this is experimental
# WIP #

dattach() {
  docker exec -i -t $1 /bin/bash
}
kattach() {
  kubectl exec --stdin --tty $1 -- /bin/bash
}
# https://stackoverflow.com/questions/47389443/finding-the-name-of-a-new-pod-with-kubectl
# attach to knosc kubernetes pod
kktach() {
  kattach $(ktl get pod -l app=$1 -o jsonpath="{.items[0].metadata.name}")
}


### --- kubernetes

alias kk='k9s'
alias ktl='kubectl'

alias dcom='docker-compose'
alias dcomup='docker-compose up -d --remove-orphans'
alias dcomp='dcomup'

alias dockerQa='docker system prune -a'
