#NoEnv
#NoTrayIcon
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Welcome
winTitle1 = Installing PCW-Fistcheck ahk_class #32770
WinWait, %winTitle1%,, 10
ControlClick, Button2, %winTitle1% ; &Next >

; License agreement
WinWait, %winTitle1%,, 10
ControlClick, Button5, %winTitle1% ; I agree
ControlClick, Button2, %winTitle1% ; &Next >

; Installation folder
WinWait, %winTitle1%,, 10
ControlClick, Button2, %winTitle1% ; &Next >

; Ready to install
WinWait, %winTitle1%,, 10
ControlClick, Button2, %winTitle1% ; Install

; Finish
WinWait, %winTitle1%, &Finish, 60
ControlClick, Button4, %winTitle1% ; Launch PCW-Fistcheck now (disable)
Sleep 500
ControlClick, Button2, %winTitle1% ; Finish