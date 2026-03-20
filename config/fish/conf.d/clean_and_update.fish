status is-interactive || exit

function update-inconvenient --description "anything that I want to be in update-side-note but is less convenient/requires interactive"
    echo "-----------------------------"
    echo "--- updating inconvenient ---"
    echo "-----------------------------"
    # npm itself and some of the dependencies have to be handled by pacman
    # unlike pip npm does not take any precautions, so updating all blindly
    # frequently leads to conflicts
    sudo npm update --global @angular/cli pino-pretty
    echo ""
    echo "--- inconvenient packages have been updated ---"
end

function update-side-note --description 'update stuff that does not require docker or restart'
    echo "--------------------------------"
    echo "--- performing small updates ---"
    echo "--------------------------------"
    # these can run without supervision once I have authenticated
    flatpak update  --assumeyes
    rustup update
    uv self update
    # fish plugins, which should go into dotfiles
    # echo "--- updating fish plugins and committing them to dotfiles!!!"
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
    ~/.tmux/plugins/tpm/bin/update_plugins all
    echo ""
    echo "--- small updates done ---"
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
    echo ""
    echo "--- docker has been pruned ---"
end

function update_aur_repo
    cd $argv[1]
    or return

    echo "Checking AUR repository at $PWD"
    if not git fetch
        echo "ERROR failed to fetch $PWD"
        sleep 1s
        echo "Moving on..."
        sleep 1s
        cd ..
        return
    end
    set current_branch (git branch --show-current)
    if git diff --exit-code --quiet origin/$current_branch
        echo "INFO There are no updates to install in $PWD"
        sleep 1s
        echo "Moving on..."
        sleep 1s
        cd ..
        return
    end
    echo '...'
    sleep 1s
    echo '...'
    sleep 1s

    git diff origin/$current_branch
    echo 'are you comfortable going ahead (y/n)?'
    read --nchars 1 --function yesno
    set yesno (string lower $yesno)
    if test -z $yesno; or test $yesno != 'y'
        echo "WARNING Aborting AUR upgrade of $PWD"
        echo "WARNING this can leave the software broken, if its dependencies have been upgraded"
        cd ..
        return
    end

    git merge
    and makepkg --syncdeps
    and sudo pacman -U *.pkg.tar.zst
    and rm -v *.pkg.tar.zst  # sometimes these don't overwrite previous versions
    and cd ..
    and return
    or echo "ERROR Failed to install $PWD, please revisit this repo"
    echo 'Press any key to move on...'
    read --nchars 1 --function yesno
    echo "Moving on..."
    sleep 1s
    cd ..
    return
end

function update_all_aur --description 'update AUR packages'
    echo "--------------------"
    echo "--- updating AUR ---"
    echo "--------------------"
    set current_path $PWD
    sleep 1s
    if whatis yay
        yay
    else if set -q aur_files
        cd $aur_files
        for file in *
            update_aur_repo $file
        end
    else
        echo "Error, no aur files defined and no yay installed"
    end
    sleep 1s
    echo ""
    echo "--- AUR has been updated ---"
    cd $current_path
end

function update-core --description 'possibly requires restart'
    echo "-----------------------"
    echo "--- updating pacman ---"
    echo "-----------------------"
    # now we need user input.  Well, if we don't want to accidentally break
    # anything.
    sudo pacman -Syu && update_all_aur && \
    # remove orphans after last update
    pacman -Qdtq | sudo pacman -Rs - && \
    # clean cache, keep last 4
    paccache -rk4
    echo ""
    echo "--- pacman has been updated ---"
end

function clean_nvim_swap --description 'delete nvim swap files from ~/.local/state/nvim/swap/*'
    echo "-----------------------------------"
    echo "--- cleaning up nvim swap files ---"
    echo "-----------------------------------"
    set nvim_running (ps aux | grep nvim | grep -v grep)
    if test -n "$nvim_running"
        echo "nvim is still running!"
        echo "keeping swap files untouched!"
        echo ""
        return
    else
        rm --verbose ~/.local/state/nvim/swap/*
    end
    echo ""
    echo "--- nvim swap has been cleared ---"
end

function update-all --description 'well, not necessarily all, but regular maintenance stuff'
    echo "=================================================="
    echo "================= System Updates ================="
    echo "=================================================="
    clean-docker-storage
    and update-side-note
    and clean_nvim_swap
    and update-core
    and update-inconvenient
    and echo ""
    and echo "===================================================="
    and echo "================= Updates Complete ================="
    and echo "===================================================="
end
