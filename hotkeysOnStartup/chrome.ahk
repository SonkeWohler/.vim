#IfWinActive ahk_class Chrome_WidgetWin_1
 ; single character operations
Capslock & h::Backspace ; like in bash
Capslock & j::Enter ; like in bash
Capslock & m::Enter ; like in bash
Capslock & l::Del ; not like in bash but i like it like that
 ; whole word operations
Capslock & w::^Right ; like in vim in normal mode
Capslock & b::^Left ; like in vim in normal mode
Capslock & `::^Backspace ; backtick : delete entire word before the curser
Capslock & 1::^Del ; delete entire word after the curser
 ; line operations
Capslock & 4::End ; similar to vim
Capslock & 0::Home ; similar to vim
 ; other convenient operations
Capslock & Enter::^Enter ; 
Capslock & k::LButton ; allows shifting focus to where the mouse is, if the cursor is placed conveniently
 ; ignore anything else : it's convenient to use any ignored combination for Escape
Capslock & r::
Capslock & e::
Capslock & q::
Capslock & a::
Capslock & s::
Capslock & d::
Capslock & f::
Capslock & g::
Capslock & t::
Capslock & y::
Capslock & u::
Capslock & i::
Capslock & o::
Capslock & p::
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
Capslock & [::
Capslock & ]::
Capslock & }::
Capslock & '::
Capslock & @::
Capslock & #::
Capslock::Esc
#IfWinActive
