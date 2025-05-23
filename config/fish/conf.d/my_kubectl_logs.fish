status is-interactive || exit

function kubernetes-app-log-template --description 'view logs for an app on my local'
    # makes it easier to see the start of stream when quickly scrolling through
    echo '========================================='
    echo '-----------------------------------------'
    echo '========================================='
    kubectl logs --tail=-1 -n development --context docker-desktop -f -l app=$argv[1] | pino-pretty --colorize
end

function kubernetes-pod-log-template --description 'view logs for pod on my local'
    # makes it easier to see the start of stream when quickly scrolling through
    echo '========================================='
    echo '-----------------------------------------'
    echo '========================================='
    set -l namespace development
    set -l context docker-desktop
    set -l pod $argv[1]
    kubectl logs --tail=-1 -f -n $namespace --context $context $pod
end

function kubernetes-job-log-template --description 'view logs for a job'
    argparse 'n/namespace=' 'c/context=' 'j/job=' -- $argv
    or return
    set -ql _flag_n[1]
    and set namespace $_flag_n[-1]
    or set namespace development
    set -ql _flag_c[1]
    and set context $_flag_c[-1]
    or set context docker-desktop
    if set -ql _flag_j
        set job $_flag_j[-1]
    else
        if set -ql argv[2]
            echo 'multiple arguments are only allowed with flags, use -n, -c and -j'
            return
        end
        if set -ql argv[1]
            set job $argv[1]
        else
            echo '-j/--job argument is required'
            return
        end
    end

    # this makes it easier to see the start of stream when quickly scrolling up
    echo '   '
    echo "kubernetes logs for job $job, on namespace $namespace in context $context"
    echo '========================================='
    echo '-----------------------------------------'
    echo '========================================='
    kubectl logs --tail=-1 -n $namespace --context $context -f -l job-name=$job | pino-pretty --colorize
end
