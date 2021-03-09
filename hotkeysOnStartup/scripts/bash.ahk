 ;;; --- remappings to make cml (command line interfaces) more comfortable ----------------------------- ;;;
 ; note that this won't work inside cml with administrator rights
 ;;; --------------------------------------------------------------------------------------------------- ;;;

#If WinActive("ahk_class mintty") || WinActive("ahk_class ConsoleWindowClass") ; this may not work when in administrator priviliges 
 ; --- turn Capslock into Ctrl while in bash, cmd etc
*Capslock::
  SetCapsLockState, Off ; will prevent some issues that can arise when switching windows and using CapsLock
  Send {Ctrl down}
  return
*Capslock up::
  SetCapsLockState, Off
  Send {Ctrl up}
  return
