 ;;; --- remappings to make cml (command line interfaces) more comfortable ----------------------------- ;;;
 ; note that this won't work inside cml with administrator rights
 ; ahk_classes:
 ;   * mintty: git bash for windows runs on this
 ;   * ConsoleWindowClass: Windows native console window class i.e. cmd, powershell
 ;   * Qt5QWindowIcon: used by NeoVim. I hope this won't cause issues down the line with GUI tools using Qt5
 ;     - note that neovim doesn't by default work well on console windows
 ;   * Vim: gVim, analogous to NeoVim's windows but I don't use it.
 ;   * Alacritty: ahk_class doesn't work well, so need to use ahk_exe, which is version specific (sigh)
 ;;; --------------------------------------------------------------------------------------------------- ;;;

; this does not work in administrator mode!!!
#If WinActive("ahk_class mintty") || WinActive("ahk_class ConsoleWindowClass") || WinActive("ahk_class Qt5QWindowIcon") || WinActive("ahk_class Vim") || WinActive("ahk_exe Alacritty-v0.8.0-rc6-portable.exe")
 ; --- turn Capslock into Ctrl while in bash, cmd etc
*Capslock::
  SetCapsLockState, Off ; will prevent some issues that can arise when switching windows and using CapsLock
  Send {Ctrl down}
  return
*Capslock up::
  SetCapsLockState, Off
  Send {Ctrl up}
  return
 ; on my new keyboard the | doesn't really exist, but I like it otherwise
!z::Send {U+005C}
!`::Send {U+007C}
