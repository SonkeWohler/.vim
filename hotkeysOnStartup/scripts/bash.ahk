 ;;; --- remappings to make cml (command line interfaces) more comfortable ----------------------------- ;;;
 ; note that this won't work inside cml with administrator rights
 ; ahk_classes:
 ;   * mintty: git bash for windows runs on this
 ;   * ConsoleWindowClass: Windows native console window class i.e. cmd, powershell
 ;   * Qt5QWindowIcon: used by NeoVim. I hope this won't cause issues down the line with GUI tools using Qt5
 ;     - note that neovim doesn't by default work well on console windows
 ;   * Vim: gVim, analogous to NeoVim's windows but I don't use it.
 ;;; --------------------------------------------------------------------------------------------------- ;;;

#If WinActive("ahk_class mintty") || WinActive("ahk_class ConsoleWindowClass") || WinActive("ahk_class Qt5QWindowIcon") || WinActive("ahk_class Vim") ; this may not work when in administrator priviliges 
 ; --- turn Capslock into Ctrl while in bash, cmd etc
*Capslock::
  SetCapsLockState, Off ; will prevent some issues that can arise when switching windows and using CapsLock
  Send {Ctrl down}
  return
*Capslock up::
  SetCapsLockState, Off
  Send {Ctrl up}
  return
