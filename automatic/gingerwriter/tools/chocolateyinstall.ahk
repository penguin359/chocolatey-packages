#NoEnv
#NoTrayIcon
SendMode Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 1   ;match if begins
 
winTitle = Ginger Writer Setup
 
WinWait, %winTitle%,, 120
WinActivate, %winTitle%
Click, 350 350 ; Install
 
ExitApp