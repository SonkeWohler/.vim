
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
# which acts as a log in to the production environment
# When I am done the file is overwritten with config.bak again, which acts as
# a log off, sometimes referred to as cut off.
# This creates a sort of session dynamic that I log into and log out of.

# you should be notified of everything that is happening as it does.
# also, the start and end notifications are fully blocking, so if you don't
# interact with the notification the process will not continue.  This way you
# can't be put online or log off without acknowledging.

# scripts to do all this are below



# so you can conveniently start it on any bash shell.  Sends all terminal output
# to /tmp/kube_config.log and allows you to keep using this shell
log_into_production_kubernetes() {
    start_kube_production_session &>/tmp/kube_config.log &
}

# if you want to debug
debug_log_into_production_kubernetes() {
    set -x
    start_kube_production_session
}

# allow to leave production early
early_cut_out_from_production_kubernetes() {
    # 300000 = 5mins
    code=$(notify-send 'you can log out early from production kubernetes below' --action "that's ok" --action 'CUT NOW' --expire-time 300000)
    # when notify-send expires code will be empty
    # default to 0
    if test -z $code; then
        code=0
    fi
    if test $code -eq 1; then
        end_kube_production_session force
    fi
}

# switch to production kubernetes, wait for 5mins and trigger log off
start_kube_production_session() {
    code=$(notify-send 'Switching Kubernetes context to production environment for 5mins!!!' --action 'I changed my mind' --action "Let's go!" --urgency critical)
    if test -z $code; then
        code=0
    fi
    if test $code -eq 0; then
        echo 'not switching to production'
        return
    fi

    cp -v ~/.kube/config ~/.kube/config.bak
    cp -v ~/.kube/production.config ~/.kube/config

    notify-send 'YOU ARE NOW ON PRODUCTION KUBERNETES!  You have 5mins' --action 'OK' --urgency critical &>>/tmp/kube_config.log &
    early_cut_out_from_production_kubernetes &>>/tmp/kube_config.log &

    sleep 5m
    end_kube_production_session
}

ensure_kube_production_will_end_in_ten() {
    sleep 10m
    end_kube_production_session force
}

end_kube_production_session() {
    if ! test -f ~/.kube/config.bak; then
        notify-send 'looks like you are already logged off from production kubernetes'
        return
    fi
    if [ "$1" != "force" ]; then
        # ensure_kube_production_will_end_in_ten &>>/tmp/kube_config.log &
        code=$(notify-send 'CUTTING KUBERNETES PRODUCTION ACCESS!' --action 'OK' --action '+1min' --urgency critical)
    fi
    # if notify-send expires or $1 was 'force'
    if test -z $code; then
        code=0
    fi

    if test $code -eq 0; then
        mv -v ~/.kube/config.bak ~/.kube/config
        notify-send 'you are back on your local kubernetes config' --action 'cool' --urgency critical &>>/tmp/kube_config.log &
    else
        sleep 1m
        end_kube_production_session
    fi
}
