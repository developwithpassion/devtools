;=======================================================================================
;BDD Test Naming Mode AHK Script
;
;Description:
;  Replaces spaces with underscores while typing, to help with writing BDD test names.
;  Toggle on and off with Ctrl + Shift + U.
;=======================================================================================
enabledIcon := "testnamingmode_16.ico"
disabledIcon := "testnamingmode_disabled_16.ico"
IsInTestNamingMode := false
SetTestNamingMode(false)

;==========================
;Functions
;==========================
SetTestNamingMode(toActive) {
  local iconFile := toActive ? enabledIcon : disabledIcon
  local state := toActive ? "ON" : "OFF"

  IsInTestNamingMode := toActive
  Menu, Tray, Icon, %iconFile%,
  Menu, Tray, Tip, Test naming mode is %state%  

}

;==========================
;Test Mode toggle
;==========================
LWin & t::
  SetTestNamingMode(true)
return

;==========================
;Handle Enter press
;==========================
$Enter::
  if (IsInTestNamingMode){
	  SetTestNamingMode(false)
  }
  else{
	  Send, {Enter}
 }
return

;==========================
;Handle Escape press
;==========================
;Map to escape or shift + escape
LWIN & e:: 
GetKeyState, state, shift, P
if state = D
  send, {shift}+{escape}
else
  send, {escape}
SetTestNamingMode(false)
return

$Escape::
SetTestNamingMode(false)
Send, {Escape}
return

;==========================
;Handle SPACE press
;==========================
$Space::
  if (IsInTestNamingMode) {
    Send, _
  } else {
    Send, {Space}
  }
return
