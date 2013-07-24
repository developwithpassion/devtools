;================================================================
;utilities
;================================================================
disable_timer(timer_name)
{
  SetTimer, %timer_name%, off
}

wait_for_window(window_name)
{
  WinWaitActive, %window_name%,,0.8
  return ErrorLevel
}

move_mouse(x,y)
{
  MouseMove,x,y
}

move_mouse_to_middle_of_active_screen()
{
  WinGetPos,X,Y,Width,Height,A
  move_mouse(Width/2,Height/2)
}

click_mouse_in_middle_of_screen()
{
  SysGet, screen_width, 59
  SysGet, screen_height, 60 
  click_mouse_on_screen(screen_width/2,screen_height/2)
}

screen_drag(x1,y1,x2,y2)
{
  CoordMode,Mouse,Screen
  MouseClickDrag,Left,x1,y1,x2,y2
  CoordMode,Mouse,Relative
}

click_mouse_in_active_window(x,y)
{
  click_mouse_in_active_window_multiple_times(x,y,1)
}

click_mouse_on_screen(x,y)
{
  CoordMode,Mouse,Screen
  click_mouse_in_active_window(x,y)
  CoordMode,Mouse,Relative
}

click_mouse_in_active_window_multiple_times(x,y,times)
{
  MouseClick,Left,x,y,times
}


send_with_sleep(keystrokes,duration)
{
  send, %keystrokes%
  sleep,duration
}

send_keystrokes(keystrokes)
{
  send_with_sleep(keystrokes,0)
}

send_keystrokes_to_program(keystrokes,program)
{
  IfWinActive, %program%
  {
    send_keystrokes(keystrokes)
  }
}

run_start_menu_program(program)
{
  send_with_sleep("{LWIN}",100)
  send_with_sleep(program,100)
  send_with_sleep("{enter}",1000)
}


run_regular_program(program)
{
  Run, %program%
}

position_window_and_size(x1,y1,width,height)
{
  WinGetActiveTitle, current_active_window
  WinMove,%current_active_window%,,x1,y1,width,height
}


maximize_active_program()
{
  WinGetActiveTitle,current_active_window
  WinMaximize, %current_active_window%
}
