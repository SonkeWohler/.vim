
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

### --- credentials

# I don't like having permanent access to production kubernetes.  Not just that
# I might accidentally mess with something, but I also run scripts regularly
# (more than I run manual commands, actually), and then I might not even realise
# I wasn't on my local kubernetes environment.

# As a solution I keep two config files under ~/.kube
# production.config has the production keys.  They should only be used to
# interact with production and be removed after
# config.bak is a backup of my normal config file

# Kubernetes context etc is set via the ~/.kube/config file.  This file will be
# overwritten with production.config when I want to work on production stuff,
# and will be overwritten with config.bak when I am done

# scripts to do all this are below


start_kube_production_session() {
    notify-send 'Switching Kubernetes context to production environment for 5mins!!!' --urgency critical

    cp -v ~/.kube/config ~/.kube/config.bak
    cp -v ~/.kube/production.config ~/.kube/config

    notify-send 'YOU ARE NOW ON PRODUCTION KUBERNETES!  You have 5mins' --urgency critical

    sleep 5m
    end_kube_production_session
}

end_kube_production_session() {
    if [ "$1" != "force" ]; then
        code=$(notify-send 'CUTTING KUBERNETES PRODUCTION ACCESS!' --action 'OK' --action '+1min' --urgency critical)
    fi
    # if notify-send expires or $1 was 'force'
    if test -z $code; then
        code=0
    fi

    if test $code -eq 0; then
        mv -v ~/.kube/config.bak ~/.kube/config
        notify-send 'you are back on your local kubernetes config' --urgency critical
    else
        sleep 1m
        end_kube_production_session
    fi
}
