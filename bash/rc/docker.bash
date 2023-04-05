
### --- kubernetes

alias kk='k9s'
alias ktl='kubectl'

klogpods() {
    # makes it easier to see the start of stream when quickly scrolling through
    echo '========================================='
    echo '-----------------------------------------'
    echo '========================================='
    kubectl logs -f $1 -n $2 --context $3 | pino-pretty --colorize
}

klogp() {
    klogpods $1 development docker-desktop
}

kloglabel() {
    # makes it easier to see the start of stream when quickly scrolling through
    echo '========================================='
    echo '-----------------------------------------'
    echo '========================================='
    kubectl logs -f -l $1 -n $2 --context $3 | pino-pretty --colorize
}


klogd() {
    kloglabel app=$1 development docker-desktop
}
klogj() {
    kloglabel job-name=$1 development docker-desktop
}
