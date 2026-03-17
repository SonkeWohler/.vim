status is-interactive || exit


function kubernetes-log-template --description 'view logs for a job'
    argparse -x 'j,p,a' 'n/namespace=' 'c/cluster=' 'j/job=' 'p/pod=' 'a/app=' -- $argv
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

function log_into_production_kubernetes --description "I keep production and staging kubeconfig separate"
    argparse 'f/force' 'n/no-move' -- $argv
    or return
    set -ql _flag_h
    and set force 1
    or set force 0
    set -ql _flag_n
    and set no_move 1
    or set no_move 0

    if test $force -eq 1
        echo 'INFO --force was supplied, this may overwrite ~/.kube/*.bak files!'
        sleep 1s
        echo '...'
        sleep 1s
    end
    echo 'INFO switching ~/.kube/config to the production config'

    if not test -f ~/.kube/production.config
        echo 'ERROR could not find production config, aborting!'
        return
    end

    if not test -f ~/.kube/config
        if not test $force -eq 1
            echo 'WARNING ~/.kube/config is not a file!  Use --force if you want to overwrite anyway'
            return
        else
            echo 'WARNING ~/.kube/config is not a file, but --force supplied, overwriting anyway!'
        end
    end

    echo 'INFO last chance to abort (Ctrl-C)'
    echo '3...'
    sleep 1s
    echo '2...'
    sleep 1s
    echo '1...'
    sleep 1s

    if test $no_move -eq 1
        cv -v ~/.kube/config ~/.kube/config.bak
        cv -v ~/.kube/production.config ~/.kube/config
    else
        mv -v ~/.kube/config ~/.kube/config.bak
        cp -v ~/.kube/production.config ~/.kube/production.config.bak
        mv -v ~/.kube/production.config ~/.kube/config
    end

    notify-send --urgency critical 'K8s config switched to Production!  Be careful!'
end

function log_out_of_production_kubernetes
    argparse 'f/force' -- $argv
    or return
    set -ql _flag_f
    and set force 1
    or set force 0

    if test $force -eq 1
        echo 'INFO --force was supplied, this may overwrite ~/.kube/*.bak files!'
        sleep 1s
        echo '...'
        sleep 1s
    end
    echo 'INFO switching ~/.kube/config back from production'

    if not test -f ~/.kube/config.bak
        if not test $force -eq 1
            echo 'ERROR could not find ~/.kube/config.bak, maybe you are already logged out?  Use --force if you think this is expected'
            echo 'ERROR Aborting'
            return
        else
            echo 'WARNING could not find ~/.kube/config.bak, but --force was supplied!'
        end
    end
    if test -f ~/.kube/production.config
        if not test $force -eq 1
            echo 'ERROR could not find ~/.kube/production.config!  Use --force if you think this is expected'
            echo 'ERROR Aborting'
            return
        else
            echo 'WARNING could not find ~/.kube/production.config, but --force was supplied!'
        end
    end

    mv -v ~/.kube/config ~/.kube/production.config
    mv -v ~/.kube/config.bak ~/.kube/config
    rm -v ~/.kube/production.config.bak

    notify-send --urgency critical 'Switched k8s back from production'
end

# non-standard at work,
# but this might be nicer than docker desktop, which kept creating problems for me
function kindly --description 'load docker images into the kindly cluster'
    argparse -x 'i,p' 'i/images=+' 'n/name=' 'p/pattern=' 'v/verbose' -- $argv
    or return
    set -ql _flag_i[1]
    and set images $_flag_i
    or set images (docker images | grep knosc | awk '{print $1}')
    set -ql _flag_p[1]
    and set pattern $_flag_p
    or set pattern '*'
    set -ql _flag_n[1]
    and set name $_flag_n[-1]
    or set name 'docker-desktop'
    set -ql _flag_v[1]
    and set verbose 1
    or set verbose 0

    set indexes_to_use
    for i in (seq (count $images))
        set image $images[$i]
        if not string match --quiet -- '*/*' $image
            set image "knosc/$image"
        end
        if not string match --quiet -- '*:*' $image
            set image "$image:latest"
        end
        if string match --quiet -- $pattern $image
            set indexes_to_use $indexes_to_use $i
        else if test $verbose -eq 1
                echo "skipping '$image' because it doesn't match pattern '$pattern"
        end
    end

    kind load docker-image $images[$indexes_to_use] --name $name
end
