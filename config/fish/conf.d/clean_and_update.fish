status is-interactive || exit

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

function update_aur
    echo "--------------------"
    echo "--- updating AUR ---"
    echo "--------------------"
    if whatis yay
        yay
    else if set -q aur_files
        cd $aur_files
        for file in ls
            cd $file
            and git fetch
            and git full-log-since-last-pull
            and git pull
            and makepkg --syncdeps
            and sudo pacman -U *.pkg.tar.zst
            or echo "skipping AUR package at $PWD"
        end
    else
        echo "Error, no aur files defined and no yay installed"
    end
end

function update-core --description 'possibly requires restart'
    echo "-----------------------"
    echo "--- updating pacman ---"
    echo "-----------------------"
    # now we need user input.  Well, if we don't want to accidentally break
    # anything.
    sudo pacman -Syu && update_aur && \
    # remove orphans after last update
    pacman -Qdtq | sudo pacman -Rs - && \
    # clean cache, keep last 4
    paccache -rk4
end

function update-all --description 'well, not necessarily all, but regular maintenance stuff'
    clean-docker-storage && echo 'docker has been pruned' && \
    update-side-note && echo 'side notes have been updated' && \
    update-core && echo 'system update done, consider restarting...' && \
    update-inconvenient && echo 'inconvenients have been updated'
end
