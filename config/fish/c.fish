# I used to store these in a machine-local file, but they never changed across
# machines, so I can just put them here
set -g dotfiles_PATH ~/libraries/.vim
set -g work_main_PATH ~/libraries/work/app
set -g work_platform_PATH ~/libraries/work/platform
set -g nextcloud_synch_PATH ~/nextcloud/sync
set -g nextcloud_server_ip 'root@2a01:4f8:c0c:59f8::1'
# and any other global variables
set -gx EDITOR 'nvim'
set -gx SUDO_EDITOR 'nvim'
set -gx LESS 'RS'

if status is-interactive
    set fish_greeting "Asta e Pestisorul meu"
    starship init fish | source
    fzf_configure_bindings --directory=\ct --git_status=\cs --git_log=\cg --history=\cr --variables=\cv --processes=\e\cp

    # ----------------- #
    # --- functions --- #
    # ----------------- #
    # I usually don't use short names here, to make it easier to reuse these in
    # many places without loosing track of the different names.
    # Convenient/short names are for abbreviations or aliases.

    # --- standard options for various things - aka templates
    # --- standard does not mean I want it to be the default every time i use
    # --- it, so I can't just throw them into the config file
    # a pager with syntax and git highlighting
    function delta-template --description 'delta with standard-options' ; delta --paging=always ; end
    function rgg --description 'rg with auto-page into my standard delta'
        rg --json $argv | delta-template
    end
    # view kubernetes pod logs
    function kubernetes-app-log-template --description 'view logs for an app on my local'
        # makes it easier to see the start of stream when quickly scrolling through
        echo '========================================='
        echo '-----------------------------------------'
        echo '========================================='
        kubectl logs --tail=-1 -n development --context docker-desktop -f -l app=$argv[1] | pino-pretty --colorize
    end
    function kubernetes-job-log-template --description 'view logs for a job on my local'
        # makes it easier to see the start of stream when quickly scrolling through
        echo '========================================='
        echo '-----------------------------------------'
        echo '========================================='
        kubectl logs --tail=-1 -n development --context docker-desktop -f -l job-name=$argv[1] | pino-pretty --colorize
    end
    function kubernetes-pod-log-template --description 'view logs for pod on my local'
        # makes it easier to see the start of stream when quickly scrolling through
        echo '========================================='
        echo '-----------------------------------------'
        echo '========================================='
        kubectl logs --tail=-1 -f -n development --context docker-desktop $argv[1]
    end
    # --- utillity
    # change into directory after creating
    function make-and-change-into-directory --description 'change into the directory you created'
        mkdir -vp $argv[1]
        cd $argv[1]
    end
    # tree with ignored files
    function tree-without-symlinks-etc --description 'tree with my default gitignore and with symlinks grepped out'
        tree --gitfile="$dotfiles_PATH/config/gitignore" $argv[1] | grep -v "\->"
    end
    function git-to-vi --description 'I can use git to create a list of the files I want to look at, and open them all with this'
        awk '{print$2}' | tr "\n" " " | xargs nvim -p
    end


    # --------------------- #
    # --- abbreviations --- #
    # --------------------- #
    # also aliases
    alias dlt delta-template
    # the rest is usually just a copy of `abbr --show`
    abbr -a -- cd- 'cd -'
    abbr -a -- cd. 'cd ..'
    abbr -a -- mkd 'mkdir -vp'
    abbr -a -- mkcd 'make-and-change-into-directory'
    abbr -a -- rmv 'rm -rvi'
    abbr -a -- rmd 'rm -dv'
    abbr -a -- mvv 'mv -v'
    abbr -a -- cpv 'cp -rv'
    abbr -a -- vi 'nvim -p'
    abbr -a -- vimu 'vim -u NONE'
    abbr -a -- nvimu 'nvim -u NONE'
    abbr -a -- sedn 'sed -En'
    abbr -a -- lsa 'ls -lAFh'
    abbr -a -- cdv 'cd $dotfiles_PATH'
    abbr -a -- cdw 'cd $work_main_PATH'
    abbr -a -- cdp 'cd $work_platform_PATH'
    abbr -a -- cdn 'cd $nextcloud_synch_PATH'
    abbr -a -- cdNXT 'cd $nextcloud_synch_PATH'
    abbr -a -- sshNXT 'ssh $nextcloud_server_ip'
    abbr -a -- tre 'tree-without-symlinks-etc'
    abbr -a -- viNXT 'cd $nextcloud_synch_PATH/vault && vi Index.md'
    abbr -a -- kk 'k9s'
    abbr -a -- klogj 'kubernetes-job-log-template'
    abbr -a -- klogd 'kubernetes-app-log-template'
    abbr -a -- klogp 'kubernetes-pod-log-template'
    abbr -a -- gvi 'git-to-vi'

end
