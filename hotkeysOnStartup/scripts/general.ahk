 ;;; --- Hotkeys for various general use windows ----------------------------------------------------------------- ;;;
 ; Chrome_WidgetWin_1 is Google Chrome
 ; Windows.UI.Core.CoreWindow applies to many "windows" that are part of the system, but important to me is:
 ;  * start menu
 ;  * search function inside menu
 ;  * desktop selector
 ;  * calender and many taskbar widgets
 ; TaskManagerWindow is the TaskManager
 ; WdcWindow is the resource Monitor Window
 ; CabinetWClass is the Windows Explorer
 ; Progman is the Windows Desktop
 ; IEFrame Internet Explorer
 ; HH is the autohotkey help window
 ; vguiPopupWindow refers various steam windows
 ; UnrealWindow refers to Epic games Launcher, NOTE: that this may apply to unreal games, will have to check, see #12
 ; ApplicationFrameWindow is the windows calculator
 ; Shell_TrayWnd is the windows taskbar while most widgets opened from there (calender etc) are Windows.UI.Core.CoreWindow
 ; NotifyIconOverflowWindow is the notification window inside the taskbar (bottom right usually)
 ; Qt5QWindowIcon refers to TexStudio
 ; Notepad++ is obvious
 ;;; --- General Windows ---------------------------------------------------------------------------------------- ;;; 


#If WinActive("ahk_class Chrome_WidgetWin_1") || WinActive("ahk_class Windows.UI.Core.CoreWindow") || WinActive("ahk_class TaskManagerWindow") || WinActive("ahk_class CabinetWClass") || WinActive("ahk_class Progman") || WinActive("ahk_class IEFrame") || WinActive("ahk_class HH") || WinActive("ahk_class vguiPopupWindow") || WinActive("ahk_class UnrealWindow") || WinActive("ahk_class ApplicationFrameWindow") || WinActive("ahk_class Shell_TrayWnd") || WinActive("ahk_class NotifyIconOverflowWindow") || WinActive("ahk_class Qt5QWindowIcon") || WinActive("ahk_class Notepad++")


 ;;; --- Alt related
 ; German Letters
![::Send {U+00FC} ; lowercase ü
!+[::Send {U+00DC} ; uppercase Ü
!`;::Send {U+00F6} ; lowercase ö
!+`;::Send {U+00D6} ; uppercase Ö
!'::Send {U+00E4} ; lowercase ä
!+'::Send {U+00C4} ; uppercase Ä
!-::Send {U+00DF} ; ß
 ; Navigation
!j::Send {WheelDown}
!k::Send {WheelUp}
 ;;; --- Capslock related
 ; single character operations
Capslock & h::Backspace ; like in bash
Capslock & j::Enter ; like in bash
Capslock & m::Enter ; like in bash
Capslock & d::Del ; like in bash
Capslock & o::Right ; convenient to reach and not already used
Capslock & i::Left ; convenient to reach and not already used
 ; whole word operations
Capslock & f::^Right ; like in bash
Capslock & b::^Left ; like in bash
Capslock & w::^Backspace ; as in bash
Capslock & `::^Del ; backtick : delete entire word after the curser
Capslock & 1::^Del ; might be more comfy than above
 ; line operations
Capslock & e::End ; like in bash
Capslock & a::Home ; like in bash
Capslock & u:: ; like in bash
Send +{Home}
Send {Backspace}
return
Capslock & p::Up ; like in bash
Capslock & n::Down ; like in bash
 ; large text operations
Capslock & g::^End ; kinda like G in vim and vimium, but specific to the text area
Capslock & t::^Home ; couldn't use gg and Caps+g is much like Shift+g
 ; other convenient operations
Capslock & q::Esc ; like in my .vimrc
Capslock & Enter::^Enter ; confirm the current input
Capslock & k::LButton ; allows shifting focus to where the mouse is, if the cursor is placed conveniently
 ; ignore anything else
Capslock & r::
Capslock & s::
Capslock & l::
Capslock & y::
Capslock & z::
Capslock & x::
Capslock & c::
Capslock & v::
Capslock & 0::
Capslock & 2::
Capslock & 3::
Capslock & 4::
Capslock & 5::
Capslock & 6::
Capslock & 7::
Capslock & 8::
Capslock & 9::
Capslock & -::
Capslock & =::
Capslock & \::
Capslock & ,::
Capslock & .::
Capslock & /::
Capslock & Tab::
Capslock & {::
Capslock & [::
Capslock & ]::
Capslock & }::
Capslock & '::
Capslock & @::
Capslock & #::
Capslock::return
#IfWinActive
