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
    uv generate-shell-completion fish | source
    uvx --generate-shell-completion fish | source

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
    function update-inconvenient --description "anything that I want to be in update-side-note but is less convenient/requires interactive"
        echo "-----------------------------"
        echo "--- updating inconvenient ---"
        echo "-----------------------------"
        sudo npm update --global
    end
    function update-side-note --description 'update stuff that does not require docker or restart'
        echo "--------------------------------"
        echo "--- performing small updates ---"
        echo "--------------------------------"
        # these can run without supervision once I have sudo
        flatpak update  --assumeyes
        rustup update
        uv self update
        # it is nice to make sure work is up to date as well.  There are some
        # linters etc installed locally
        cd $work_main_PATH && make local-update-helpers || echo 'skipping work linter update'
        # nvim will open interactive, because anything else seems to struggle
        # with either Mason, Treesitter, or the combination of the two
        # Treesitter is tied into lazy, though i don't think that is the source
        # of my problems
        nvim -c "lua require('lazy').sync({wait = true})" -c 'autocmd User VeryLazy MasonUpdateAll'
    end
    function clean-docker-storage --description 'prune docker images and rebuild main work'
        echo "-------------------------------"
        echo "--- cleaning docker storage ---"
        echo "-------------------------------"
        if ! docker info ;
            echo 'docker is not currently running'
            echo 'skipping clean-docker-storage'
            return 1
        end
        # I haven't been able to set up docker garbage collect yet...
        # so I do this instead
        docker buildx prune --force  # I haven't been able to set up docker garbage collect right yet...
        cd $work_main_PATH && git stash -m 'chore(*): prune and rebuild stash' && git sw development && git pull && make rebuild-dev && git sw -
        sleep 1m  # just to be sure nothing breaks with the above restart
    end
    function update-core --description 'possibly requires restart'
        echo "-------------------------------"
        echo "--- updating pacman and yay ---"
        echo "-------------------------------"
        # sometimes we update docker-desktop.  And even when not, we usually do
        # a restart, and it is nice not to have this running at that point
        systemctl --user stop docker-desktop && sleep 30s
        # now we need user input.  Well, if we don't want to accidentally break
        # anything.
        sudo pacman -Syu && yay
        # remove orphans after last update
        pacman -Qdtq | sudo pacman -Rs -
        # clean cache, keep last 2
        paccache -rk2
    end
    function update-all --description 'well, not necessarily all, but regular maintenance stuff'
        clean-docker-storage && echo 'docker has been pruned'
        update-side-note && echo 'side notes have been updated'
        update-inconvenient && echo 'inconvenients have been updated'
        update-core && echo 'system update done, consider restarting...'
    end
    # e.g.
    # git diff --name-status development...HEAD -- 'rest-api/*' | git-to-vi
    function git-to-vi --description 'I can use git to create a list of the files I want to look at, and open them all with this'
        awk '{print$2}' | tr "\n" " " | xargs nvim -p
    end
    # remindme in 5mins, or so
    # currently, this cannot be send in the background normally, because fish
    # functions cannot be managed that way.
    # https://fishshell.com/docs/current/language.html#job-control
    function wait-and-remind-me --description 'this will sleep for argv[1] and will use notify-send with argv[2]'
        if not set -q argv[1]
            echo "wait-and-remind-me requires argv[1] to be the time to wait for"
            return
        end
        if not set -q argv[2]
            echo "wait-and-remind-me requires argv[2] to be the notification message"
            return
        end
        sleep $argv[1]
        set code (notify-send $argv[2] --action 'done' --action '+1min' --action 'repeat' --app-name "timer $time" --wait --expire-time 300000)
        if test "$code" -eq 1
            wait-and-remind-me "1m" $argv[2]
        else if test "$code" -eq 2
            wait-and-remind-me $argv[1] $argv[2]
        else
            echo "done"
        end
    end
    function notify-me-later --description 'this does not currently work as intended, see above'
        wait-and-remind-me $argv &>/dev/null &
    end
    # --- being time blind sucks
    function work-timer --description 'try to schedule a 3-ish hour focus window, without getting stuck in focus'
        if set -q argv[1]
            set duration "$argv[1]"
        else
            set duration '3h'
        end
        set start_time (date -Iminutes)
        echo "start, $start_time" >> ~/Documents/time_tracking.txt
        # TODO allow interrupt in this time, which should record that as the end
        # of duration to time_tracking.txt, instead of the predicted time
        echo trying to notifying you $duration from $start_time
        sleep "$duration" || notify-send "your work tracker did not sleep very well"
        # TODO I should make this more interactive, allowing me to add 10mins or
        # something
        set response (notify-send "you have worked for $duration, it is time to stop" --action "no I didn't!" --action "ok, I'm done" --action "one more minute" --action "10 more minutes" --action "30 more minutes" --wait --expire-time 300000)
        if test "$response" -eq 0
            # remove that last line
            sed -i '$ d' ~/Documents/time_tracking.txt
            notify-send "I removed that last line then, it marked $start_time" --wait
        else if not test "$response" -eq 0
            notify-send "then you should implement a reply loop, you lazy P!" --action "yeah yeah, I got it" --action "soon" --wait --expire-time 300000
        end
        echo end, (date -Iminutes) >> ~/Documents/time_tracking.txt
    end

    # --------------------- #
    # --- abbreviations --- #
    # --------------------- #
    # also aliases
    alias dlt delta-template
    # the rest is usually just a copy of `abbr --show`
    abbr -a -- cd- 'cd -'
    abbr -a -- cd. 'cd ..'
    abbr -a -- .. 'cd ..'
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
    abbr -a -- remindme 'notify-me-later'

end
