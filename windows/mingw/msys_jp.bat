@echo off

set WD=%~dp0
set WD=%WD%bin

set MSYSCON=sh.exe
set MSYSTEM=MINGW32
set DISPLAY=

%WD%\sh --login -i
