#NoEnv
#NoTrayIcon
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Version = 0.3.2

; Simple Radio Recoder Uninstallation
winTitle1 = qutIM %Version% Uninstall
WinWait, %winTitle1%,, 10
ControlClick, Button1, %winTitle1% ahk_class #32770

WinWait, %winTitle1%,, 10
ControlClick, OK, %winTitle1% ahk_class #32770

; The program was successfully uninstalled.
WinWait, %winTitle1%,, 15
ControlClick, OK, %winTitle1% ahk_class #32770