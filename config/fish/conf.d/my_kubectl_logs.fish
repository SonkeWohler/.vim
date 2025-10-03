status is-interactive || exit


function kubernetes-log-template --description 'view logs for a job'
    argparse -x 'j,p,a' 'n/namespace=' 'c/context=' 'j/job=' 'p/pod=' 'a/app=' -- $argv
    or return
    set -ql _flag_n[1]
    and set namespace $_flag_n[-1]
    or set namespace development
    set -ql _flag_c[1]
    and set context $_flag_c[-1]
    or set context docker-desktop
    if set -ql _flag_j
        set job $_flag_j[-1]
    else if set -ql _flag_p
        set pod $_flag_p[-1]
    else if set -ql _flag_a
        set app $_flag_a[-1]
    else
        echo 'argument for pod (-p), job (-j) or app (-a) required'
        return
    end

    # this makes it easier to see the start of stream when quickly scrolling up
    echo '   '
    echo "kubernetes logs for $job/$pod/$app, on namespace $namespace in context $context"
    echo '========================================='
    echo '-----------------------------------------'
    echo '========================================='
    if set -ql job
        kubectl logs --tail=-1 -n $namespace --context $context -f -l job-name=$job | pino-pretty --colorize
    else if set -ql app
        kubectl logs --tail=-1 -n $namespace --context $context -f -l app=$app | pino-pretty --colorize
    else if set -ql pod
        kubectl logs --tail=-1 -n $namespace --context $context -f $pod | pino-pretty --colorize
    end
end
