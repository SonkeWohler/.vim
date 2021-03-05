#IfWinActive ahk_class Chrome_WidgetWin_1
 ;;; --- Alt related
![::Send {U+00FC} ; lowercase ü
!+[::Send {U+00DC} ; uppercase Ü
!`;::Send {U+00F6} ; lowercase ö
!+`;::Send {U+00D6} ; uppercase Ö
!'::Send {U+00E4} ; lowercase ä
!+'::Send {U+00C4} ; uppercase Ä
!-::Send {U+00DF} ; ß
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
Capslock & 1::
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
Capslock & ]::
Capslock & }::
Capslock & '::
Capslock & @::
Capslock & #::
Capslock::return
Capslock & [::Esc
#IfWinActive
