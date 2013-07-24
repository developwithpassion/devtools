reload_window_title = Project file modification detected

;===========================
;bring up the VS# context actions
actions="aep,el,ani,drun,rwd,fac,fl,h,imp,key,l,anp,nu,par,rr,ru,s,o,vi,w,pairv,pairr,rel,rb,vv,vh"
LWIN & o::
Input,command_input,T1/1,{enter}{esc}{tab},%actions%
if (ErrorLevel = Max | ErrorLevel = Timeout)
{
    return
}
if (command_input <> "")
{
  SetTimer, %command_input%, -1
}
return

;================================================================
; Visual studio actions

;Error List
el:
send_keystrokes_to_program("^\e",devenv)
return

;Project add reference
par:
send_keystrokes_to_program("!PR",devenv)
return

;Tools-options-fonts
fac:
send_keystrokes_to_program("!TO",devenv)
send_with_sleep("+{tab}{PageUp}ff",200)
return

;Tools-options-keyboard
key:
send_keystrokes_to_program("!TO",devenv)
send_with_sleep("+{tab}{PageUp}k",200)
return

;Import settings
imp:
send_keystrokes_to_program("!TI",devenv)
send_with_sleep("!i!n!o!n!b",100)
send_with_sleep("C:{enter}",100)
send_keystrokes("C:\users\jp\repositories\developwithpassion\devtools\windows\visual_studio{enter}+{tab}+{tab}")
return

;Add New Project
anp:
send_keystrokes_to_program("!FDN",devenv)
return

;Add New Item
ani:
send_keystrokes_to_program("^+A",devenv)
return

;Add Existing Project
aep:
send_keystrokes_to_program("!FDE",devenv)
return

;build all
o:
send, ^+b
return

;rebuild solution
rb:
send, !br
return

;split view vertically
vv:
send_keystrokes_to_program("!wv",devenv)
return

;split view horizontally
vh:
send_keystrokes_to_program("!wz",devenv)
return

;save all
s:
send, ^+s
return


;close all active windows
w:
send_keystrokes_to_program("!wl",devenv)
return

;hide
h:
send_keystrokes_to_program("!wh",devenv)
return

;run tests
ru:
send, ^!+t
return

;run with debugging
drun:
send, {F5}
return

;run withouth debugging
rwd:
send, ^{F5}
return

;rerun tests
rr:
send, ^!+r
return

;nuget console
nu:
send,!tno
return

;reload all projects in the solution
rel:
WinWaitActive, %reload_window_title%
click_mouse_in_active_window(459,232)
return

;solution explorer
l:
send,+!l
return

;open current file with vim
vi:
send,!tv
return

;enable pair settings for vs r#
pairv:
send,!ro
WinWaitActive, ReSharper - Options,,2
click_mouse_in_active_window(54,76)
click_mouse_in_active_window(266,194)
click_mouse_in_active_window(288,433)
send_with_sleep("{Escape}",500)
Send, {Escape}
return

;enable pair settings for intellij r#
pairr:
send,!ro
WinWaitActive, ReSharper - Options,,2
click_mouse_in_active_window(54,76)
click_mouse_in_active_window(268,279)
click_mouse_in_active_window(288,433)
Send, {Escape}
return

;float the current document to the next monitor
fl:
send,!W{Down}{Down}{Enter}
send, ^m
send, !q
WinWaitActive, Executor
send,Divvy.exe{Enter}
sleep, 200
send,{ALT}+{TAB}
sleep, 200
send,9
sleep,200
send,{Escape}
return

;================================================================
