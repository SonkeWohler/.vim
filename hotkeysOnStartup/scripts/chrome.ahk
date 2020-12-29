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
Capslock & e::End ; similar to bash
Capslock & a::Home ; similar to bash
Capslock & p::Up ; like in bash
Capslock & n::Down ; like in bash
 ; large text operations
Capslock & g::^End ; kinda like in vim and vimium, but specific to the text area
Capslock & t::^Home ; couldn't use exactly the same key as in vim/vimium
 ; other convenient operations
Capslock & Enter::^Enter ; confirm the current input
Capslock & k::LButton ; allows shifting focus to where the mouse is, if the cursor is placed conveniently
 ; ignore anything else
Capslock & r::
Capslock & q::
Capslock & s::
Capslock & l::
Capslock & f::
Capslock & y::
Capslock & z::
Capslock & x::
Capslock & c::
Capslock & v::
Capslock & o::
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
Capslock & ]::
Capslock & }::
Capslock & '::
Capslock & @::
Capslock & #::
Capslock::return
Capslock & [::Esc
#IfWinActive
