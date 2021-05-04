# Hotkeys on Startup
The AutoHotkey scripts in this folder setup remappings based on what window is
active. For example, in bash the `<Capslock>` becomes `<Ctrl>`, in chrome it
performs a few similar functions but when running a game it has its original
function.

For this to work I run the `scripts/*.ahk` files at system startup (hence
`hotkeysOnstartup`), but before jumping into that, a few notes of advice.

## Production vs Development
In order for the system to run them it is recommended to copy them into
`~/hotkeysOnStartup/` or another dedicated directory and link to the
`~/hotkeysOnStartup/startHotkeys.sh` script from within the system startup
routine (see below). You can deploy the scripts by calling `copyHotkeys.sh`.

#### DO NOT edit the scripts that are called on system startup directly or link to the scripts in the git repository from your system startup routine!
The scripts in the git repository are for development and backup purposes. When
you want to work on them to add remappings or hotkeys you can start them
individually with `start <scriptname>`. Do this until you are certain that your
scripts are safe. If anything funny happens in the worst case you can always
restart your system and the faulty behaviour should stop. If the faulty
behaviour is caused by the scripts you call on system startup you won't fix
things that way. 

In short think of the scripts in repository as development and those in
`~/hotkeysOnStartup` as production.

## Adding scripts to System Startup
On my system I can add scripts to the system startup routine by adding a shell
script to `~/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup/`,
which calls `~/hotkeysOnStartup/startHotkeys.sh`, which in turn will start the
remapping scripts in the correct order.

