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
    set fish_greeting "Frische Fische fischt Fischer Fritz"
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
    # view kubernetes pod logs
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
        # npm itself and some of the dependencies have to be handled by pacman
        # unlike pip npm does not take any precautions, so updating all blindly
        # frequently leads to conflicts
        sudo npm update --global @angular/cli pino-pretty
    end
    function update-side-note --description 'update stuff that does not require docker or restart'
        echo "--------------------------------"
        echo "--- performing small updates ---"
        echo "--------------------------------"
        # these can run without supervision once I have sudo
        flatpak update  --assumeyes
        rustup update
        uv self update
        # fish plugins, which should go into dotfiles
        echo "--- updating fish plugins and committing them to dotfiles!!!"
        # cd $dotfiles_PATH
        # and git pull --rebase
        # and git qa
        # and git stash
        # and fisher update
        # and git commit -a -m 'chore(config/fish): fisher update (part of update-side-note automation)' --no-edit --allow-empty
        # and git stash pop
        # and git push
        # and echo '--- there is a new commit in your dotfiles now'
        # or echo '--- failed to update fisher, please check your dotfiles'
        # it is nice to make sure work is up to date as well.  There are some
        # linters etc installed locally
        # cd $work_main_PATH && make local-update-helpers || echo 'skipping work linter update'
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
        docker system prune --all --force --volumes  # I haven't been able to set up docker garbage collect right yet...
        cd $work_main_PATH && git stash -m 'chore(*): prune and rebuild stash' && git sw development && git pull && make all-dev && git sw -
        sleep 1m  # just to be sure nothing breaks with the above restart
    end
    function update-core --description 'possibly requires restart'
        echo "-------------------------------"
        echo "--- updating pacman and yay ---"
        echo "-------------------------------"
        # sometimes we update docker-desktop.  And even when not, we usually do
        # a restart, and it is nice not to have this running at that point
        systemctl --user stop docker-desktop && echo 'waiting for docker to stop...' && sleep 5s && \
        # now we need user input.  Well, if we don't want to accidentally break
        # anything.
        sudo pacman -Syu && yay && \
        # remove orphans after last update
        pacman -Qdtq | sudo pacman -Rs - && \
        # clean cache, keep last 2
        paccache -rk2
    end
    function update-all --description 'well, not necessarily all, but regular maintenance stuff'
        clean-docker-storage && echo 'docker has been pruned' && \
        update-side-note && echo 'side notes have been updated' && \
        update-core && echo 'system update done, consider restarting...' && \
        update-inconvenient && echo 'inconvenients have been updated'
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
    # # before starting this one I should cherry-pick any other commits needed for
    # # that release, so that is worth thinking about
    # function git-wait-for-pr-and-start-release --description 'automatically trigger release workflow if and when my PR merges'
    #     set tag_branch $argv[1]
    #     set release_tag $argv[2]
    #     set pr_number $argv[3]
    #     set release_message $argv[4]
    #     echo "tag branch: $tag_branch"
    #     echo "tag: $tag"
    #     echo "pr: $pr_number"
    #     echo "message: $release_message"
    #     # TODO are you ready?
    #     # print some instructions and context expectations and confirm user has
    #     # read them, checked the arguments and is ready to go
    #     git switch $tag_branch && git pull && git switch development && git pull || return 1
    #     # wait for a new commit on development, which should be from my pr
    #     watch -g -n 120 git pull || return 1
    #     # check if the pr is gone i.e. merged, verifying that the above commit
    #     # is from this pr
    #     set pr_status (gh pr view $pr_number --json closed --jq '.closed') || return 1
    #     if $pr_status = false
    #         echo 'error: the PR is not closed, please check it and retry'
    #         return 1
    #     end
    #     # cherry-pick that commit to the release branch, tag it and push the tag
    #     # TODO I commented out pushing until I tested it a couple of times
    #     git pull && git switch $tag_branch && git cherry-pick $(git log -n 1 --pretty=format:"%H" development) && git tag -a $release_tag -m $release_message # && git push && git push --tags || return 1
    # end

    # --------------------- #
    # --- abbreviations --- #
    # --------------------- #
    abbr -a --position command -- cd- 'cd -'
    abbr -a --position command -- cd. 'cd ..'
    abbr -a --position command -- .. 'cd ..'
    abbr -a --position command -- remindme 'notify-me-later'
    abbr -a --position anywhere -- mkd 'mkdir -vp'
    abbr -a --position anywhere -- mkcd 'make-and-change-into-directory'
    abbr -a --position anywhere -- rmv 'rm -rvI'
    abbr -a --position anywhere -- rmvi 'rm -rvi'
    abbr -a --position anywhere -- rmd 'rm -dv'
    abbr -a --position anywhere -- mvv 'mv -vi'
    abbr -a --position anywhere -- cpv 'cp -rv'
    abbr -a --position anywhere -- vi 'nvim -p'
    abbr -a --position anywhere -- vimu 'vim -u NONE'
    abbr -a --position anywhere -- nvimu 'nvim -u NONE'
    abbr -a --position anywhere -- sedn 'sed -En'
    abbr -a --position anywhere -- lsa 'ls -lAFh'
    abbr -a --position anywhere -- cdv 'cd $dotfiles_PATH'
    abbr -a --position anywhere -- cdw 'cd $work_main_PATH'
    abbr -a --position anywhere -- cdp 'cd $work_platform_PATH'
    abbr -a --position anywhere -- cdpc 'cd $work_platform_PATH/cli'
    abbr -a --position anywhere -- cdn 'cd $nextcloud_synch_PATH'
    abbr -a --position anywhere -- cdNXT 'cd $nextcloud_synch_PATH'
    abbr -a --position anywhere -- sshNXT 'ssh $nextcloud_server_ip'
    abbr -a --position anywhere -- tre 'tree-without-symlinks-etc'
    abbr -a --position anywhere -- viNXT 'cd $nextcloud_synch_PATH/vault && nvim Index.md'
    abbr -a --position anywhere -- kk 'k9s'
    abbr -a --position anywhere -- klog 'kubernetes-log-template'
    abbr -a --position anywhere -- klogj 'kubernetes-log-template --job'
    abbr -a --position anywhere -- klogp 'kubernetes-log-template --pod'
    abbr -a --position anywhere -- kloga 'kubernetes-log-template --app'
    abbr -a --position anywhere -- gvi 'git-to-vi'
    abbr -a --position anywhere -- gg gitui
    abbr -a --position anywhere --set-cursor -- rp "rg --json '%'"
    # abbr -a --position anywhere --set-cursor -- klog "kubectl logs --tail=-1 -f % | pino-pretty --colorize"
    abbr -a awww --position command --set-cursor --regex   "aww+"  "awk '{print \$%}'"
    abbr -a --position anywhere -- dlt '| delta-template'
    abbr -a --position anywhere --set-cursor -- rgg "rg --json '%' | delta-template"
    abbr -a --position anywhere -- nogit "not test (git status --porcelain)"
    # wait for pid to complete, then do other stuff
    # useful with <C-M-p> from fzf.fish
    abbr -a --position anywhere --set-cursor -- ww "tail --pid % -f /dev/null && "

end
