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
Capslock & i::Right ; convenient to reach and not already used
Capslock & u::Left ; convenient to reach and not already used
 ; whole word operations
Capslock & w::^Right ; like in vim in normal mode
Capslock & b::^Left ; like in vim in normal mode
Capslock & `::^Backspace ; backtick : delete entire word before the curser
Capslock & 1::^Del ; delete entire word after the curser
 ; line operations
Capslock & 4::End ; similar to vim in normal mode
Capslock & 0::Home ; similar to vim in normal mode
Capslock & o::Up ; almost like in bash
Capslock & k::Down ; couldn't find a bash equivalent, but this feels good for my fingers
 ; other convenient operations
Capslock & Enter::^Enter ; confirm the current input
Capslock & p::LButton ; allows shifting focus to where the mouse is, if the cursor is placed conveniently
 ; ignore anything else : it's convenient to use any ignored combination for Escape
Capslock & r::
Capslock & e::
Capslock & q::
Capslock & a::
Capslock & s::
Capslock & l::
Capslock & f::
Capslock & g::
Capslock & t::
Capslock & y::
Capslock & z::
Capslock & x::
Capslock & c::
Capslock & v::
Capslock & n::
Capslock & 2::
Capslock & 3::
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
