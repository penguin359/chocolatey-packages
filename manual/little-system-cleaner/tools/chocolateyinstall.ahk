#NoEnv
; #Warn  ; Enable warnings to assist with detecting common errors.
#NoTrayIcon
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetControlDelay 0  
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode, 2 ; A windows's title can contain WinTitle anywhere inside it to be a match
winTitle1 = Little System Cleaner
WinWait, %winTitle1%,, 60
ControlClick, Button1, %winTitle1%