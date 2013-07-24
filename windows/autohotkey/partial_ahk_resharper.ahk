;==================================================
;bring up the R# context actions
actions="c,cd,d,cft,e,fe,gf,ft,ff,fs,fu,fw,i,ltn,le,lt,gm,sy,oc,owc,hu,se,so,swa,pi,qq,t,su,jj,kk,vd,mmu,mmd,mml,mmr"
LWIN & u::
Input,command_input,T1/1,{enter}{esc}{tab},%actions%
if (ErrorLevel = Max | ErrorLevel = Timeout )
{
    return
}
if (command_input <> "")
{
  SetTimer, %command_input%, -1
}
return
;===================================================
;R# Shortcut Remappings
;===================================================
;Resharper generate code(alt + insert) or in solution explorer Create file from template 
LWIN & i:: 
  send, !{insert}
return

;generate code dialog
LWIN & '::
  send, !{Enter}
return

;Go To Type
LWIN & n::
Send,!rnt
return

;Resharper navigate from here
LWIN & g::
send, !rna
return

;statement completion
LWIN & Enter::
  send, ^+{enter}
return

;symbol completion
LWIN & space::
  send, ^{Space}
return

;smart auto completion
LWIN & /::
  send, ^+{Space}
return

;Smart symbol completion
LWIN & .::
Send, ^!{Space}
return

;Move Up A Method
$!k::
    Send, !{Up}
return

;Move Down A Method
$!j::
    Send, !{Down}
return

;Process Move Method Up
$^+!k::
  Send, ^+!{Up}
return
mmu:
  Send, ^+!{Up}
return

;Process Move Method Down
$^+!j::
  Send, ^+!{Down}
return
mmd:
  Send, ^+!{Down}
return

;Move Member Left
$^+!h::
    Send, ^+!{Left}
return
mml:
Send, ^+!{Left}
return

;Move Member Right
$^+!l::
    Send, ^+!{Right}
return
mmr:
Send, ^+!{Right}
return


;Process Go to next usage 
$+!j::
    Send, ^!{Down}
return
jj:
    Send, ^!{Down}
return

;Process Go to previous usage 
$+!k::
    Send, ^!{Up}
return
kk:
    Send, ^!{Up}
return
;===================================================
;R# Actions
;===================================================

;Naviagate to containing declaration
cd:
Send, !rnc
return

;Find Usages
fu:
Send, !{F7}
return

;Find Window
fw:
Send, ^!u
return

;Highlight Current Usages
hu:
Send, ^+{F7}
return

;Next Error In Solution
se:
Send, !{F12}
return

;Goto file
gf:
Send, ^+n
return

;Turn on solution wide error analysis
swa:
click_mouse_in_active_window_multiple_times(1914,1074,2)
WinWaitActive, Solution-wide Analysis,,2
Send, {Enter}
return

;Next Error In File
fe:
Send, {F12}
return


;observations with contract
oc:
Send, !renb
return

;observations without contract
owc:
Send, !reno
return

;static observations
so:
Send, !rent
return

;new class
c:
Send, !renc
return

;new delegate
d:
Send, !rend
return

;new delegate
vd:
Send, !renv
return

;new interface
i:
Send, !reni
return

;Recent Files
e:
Send,!rnr
return

;Parameter Info
pi:
Send,!rep
return

;Quick Doc
qq:
Send,!req
return

;file structure
fs:
Send,^{F11}
return

;Goto File Member
gm:
Send,^{F12}
return

;Goto symbol
sy:
Send, ^+!n
return

;Live Templates
lt:
send_keystrokes_to_program("!RL",devenv)
send_with_sleep("{down}",200)
click_mouse_in_active_window(20,35)
send_keystrokes("+{tab}")
return

;last edit location
le:
Send, ^+{backspace}
return

;New Live Template
ltn:
send_keystrokes_to_program("!RL",devenv)
send_with_sleep("{down}",200)
click_mouse_in_active_window(89,97)
click_mouse_in_active_window(16,59)
send_with_sleep("!RL+{escape}",100)
send_with_sleep("{down}",500)
click_mouse_in_active_window(126,130)
return


;File Templates
ft:
send_keystrokes_to_program("!RL",devenv)
send_with_sleep("{down}",200)
click_mouse_in_active_window(251,34)
return

;Create A File Template
cft:
send_keystrokes_to_program("!RL",devenv)
send_with_sleep("{down}",200)
click_mouse_in_active_window(251,34)
click_mouse_in_active_window(58,244)
send_with_sleep("{down}",200)
click_mouse_in_active_window(18,60)
send_with_sleep("!RL+{escape}",100)
send_with_sleep("{down}",500)
click_mouse_in_active_window(90,151)
return

;Reformat Code
ff:
send, ^+!f
return

;close current tool window
t:
send, ^+{F4}
send, +{ESCAPE}
return

;surround with template
su:
send, ^!j
return

;================================================================
