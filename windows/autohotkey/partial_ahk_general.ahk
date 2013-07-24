;===========================
actions="div,cm,con,as,e,kk,lm,clm,mmsc,mmc,mmn,wtr,wtl,wbl,wbr,wc,wf,rwind,ww,rr,sm,sr,se,sd,x,savr,cyg,ming,proc,lw,ulw"
LWIN & y::
Input,command_input,T1/5,{enter}{esc}{tab},%actions%
if (ErrorLevel = Max | ErrorLevel = Timeout )
{
    return
}
if (command_input <> "")
{
  SetTimer, %command_input%, -1
}
return

MsgBox Hello

;===================================================
;Basic Actions
;===================================================

;exit the current app
x:
send, !{F4}
return


;launch executor
e:
send, !q
return

;activate the menu in a shell window
cm:
click_mouse_in_active_window(14,16)
return

;launch the cygwin shell
cyg:
run_start_menu_program(cygwin)
return

;launch the mingw shell
ming:
run_start_menu_program(mingw)
return

;launch the conemu terminal
con:
run_start_menu_program(conemu)
return

lm:
Click
return

lw:
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation, 0
return

ulw:
RegWrite, REG_DWORD, HKEY_CURRENT_USER, Software\Microsoft\Windows\CurrentVersion\Policies\System, DisableLockWorkstation, 1
return

clm:
ControlClick
return

;launch divvy
div:
run_regular_program(divvy)
return


;Move the mouse center
mmc:
move_mouse_to_middle_of_active_screen()
return


;Move the mouse center
mmsc:
click_mouse_in_middle_of_screen()
return

;Move the window to the next monitor
mmn:
send, +{Right}
return


;Run autohotkey spy
as:
run_regular_program(autohotkey_spy)
return

kk:
send, {Home}
return

wtl:
position_window_and_size(0,0,screen_center_x,screen_center_y)
return

wtr:
position_window_and_size(screen_center_x,0,screen_center_x,screen_center_y)
return

wbl:
position_window_and_size(0,screen_height-screen_center_y,screen_center_x,screen_center_y)
return

wbr:
position_window_and_size(screen_width - screen_center_x,screen_center_y,screen_center_x,screen_center_y)
return

wc:
WinGetActiveTitle, current_active_window
position_window_and_size(screen_center_x - screen_center_x/2,screen_center_y - screen_center_y/2,screen_width/2,screen_height/2)
return

wf:
position_window_and_size(0,0,screen_width,screen_height)
return

rwind:
run_regular_program(process_explorer)
SetTimer,CloseProcExplorer,500
return

;run process explorer
proc:
run_regular_program(process_explorer)
return

;close the current file window
ww:
send_keystrokes("!fc")
return

;Reload autohotkey scripts
rr:
Loop,%autohotkey_scripts%
{
  Run,%A_LoopFileFullPath%
}
return

;launch the start menu
sm:
send, {LWIN}
return



;========================================
;Camtasia
;========================================
;start new recording
sr:
IfWinNotExist, %camrec%
{
  run_regular_program(camrec_exe)
  wait_for_window(camrec)
}
send, {F9}
return


;stop recording
se:
send, {F10}
return

;save recording as
savr:
click_mouse_in_active_window(1223,866)
return

;delete current recording
dr:
click_mouse_in_active_window(1378,812)
return
;================================================

;shut down the machine
sd:
send_with_sleep("{LWin}",500)
send, {Right}{Enter}
return


CloseProcExplorer:
IfWinNotExist, Process Explorer
{
  process_explorer_close_attempts+=1
  if (process_explorer_close_attempts > 4)
  {
    process_explorer_close_attempts = 0
    disable_timer("CloseProcExplorer")
  }
}
else
{
  WinClose, Process Explorer
  disable_timer("CloseProcExplorer")
}
return
