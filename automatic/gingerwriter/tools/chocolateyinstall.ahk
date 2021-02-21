#NoEnv
#NoTrayIcon
SendMode Input
SetWorkingDir %A_ScriptDir%
SetTitleMatchMode, 1   ;match if begins
 
winTitle = Ginger Writer Setup ahk_class WindowsForms10.Window.8.app.0.390be75_r23_ad2
 
WinWait, %winTitle%,, 120
WinActivate, %winTitle%
Click, 350 350 ; Install
 
ExitApp