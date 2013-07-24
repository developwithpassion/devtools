;=============================
;STANDARD KEY MAPPINGS
;=============================
;Map altGr to alt
;RAlt::Alt
;RShift::Shift
;RCtrl::Ctrl


LWIN & ,::
  send, {shift}+{tab}
return

LWIN & m::
  Send, {Tab}
return

;Map to delete
LWIN & x::
send, {delete} 
return

;Map alt & up
$!K::
	Send, !{Up}
return


;send right mouse button or ctrl shift r
LWIN & r::
GetKeyState, state, rshift, P
if state = D 
send, ^+r
else
send, {shift}+{F10}
return

;Map to left arrow or ctrl left arrow
LWIN & h::
GetKeyState, state, shift, P
if state = D 
send, ^{left}
else
send, {left} 
return


;Map to right arrow or ctrl right arrow
LWIN & l::
GetKeyState, state, shift, P
if state = D 
send, ^{right}
else
send, {right} 
return

;Map to up arrow
LWIN & k::
GetKeyState, state, shift, P
if state = D 
send, {shift}+{up}
else
send, {up}
return

;Map to down arrow
LWIN & j::
GetKeyState, state, shift, P
if state = D 
send, {shift}+{down}
else
send, {down}
return

;Map to Alt + Shift + Tab
LWIN & d:: ShiftAltTab

;Map to Alt + Tab
LWIN & f:: AltTab

;Map c to close window
LWIN & c::
GetKeyState, state, shift, P
if state = D 
send !{F4}
else
send, ^{F4}
return

;Stop win & key from toggling capslock.
LWIN::
;*LWIN::
+LWIN::
LWIN & down:: 
LWIN & up::
LWIN & right::
LWIN & left::
LWIN & shift::
LWIN & appskey::
LWIN & tab::
LWIN & `::
LWIN & 3:: 
LWIN & 5::
LWIN & 7::
LWIN & 8::
LWIN & 9::
LWIN & 0::
LWIN & -::
LWIN & =::
LWIN & a::
LWIN & s::
LWIN & p::
LWIN & `;::
LWIN & \::
LWIN & z::
LWIN & v::
LWIN & w::
LWIN & [::
LWIN & ]::
LWIN & #::



