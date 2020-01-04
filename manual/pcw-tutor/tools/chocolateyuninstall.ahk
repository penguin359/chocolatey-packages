#NoEnv
#NoTrayIcon
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Uninstallation
winTitle1 = Uninstalling PCW-Tutor ahk_class #32770
WinWait, %winTitle1%,, 30
ControlClick, Button1, %winTitle1% ; &Next >

; Finish

WinWait, %winTitle1%, &Finish, 60
ControlClick, Button1, %winTitle1% ; &Finish