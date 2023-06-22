#####################################################################
###                                                               ###
###      related to any projects I am running/working on now      ###
###                                                               ###
#####################################################################

### --- lemmy

turn_on_lemmy() {
    mkdir --parents --verbose /tmp/logs/lemmy
    sudo systemctl start postgresql || return 5
    cdl && cd lemmy/lemmy && \
    cargo run &>> /tmp/logs/lemmy/cargo_run.log &
    cdl && cd lemmy/lemmy-ui
    yarn start &>> /tmp/logs/lemmy/yarn_start.log &
}
