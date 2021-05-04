### --- AutoHotkey Startup Script ----------------------------------------- ###
# this is the order in which the scripts should be started. Not following this
# order can lead to interference between the scope of hotkeys e.g. when
# switching windows the hotkeys might conflict for a moment. This has to do
# with which script takes priority, and the easiest way to manage is to start
# them in the right order
### ----------------------------------------------------------------------- ###

cd ~/hotkeysOnStartup

### --- Also note: if the scripts are already running the confirmation windows you get might create issues by reversing the order
start general.ahk
##start windows.ahk
start bash.ahk
