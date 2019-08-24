#NoEnv
; #Warn  ; Enable warnings to assist with detecting common errors.
#NoTrayIcon
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0  
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

winTitle1 = Elsie uninstallation
WinWait, %winTitle1%, This will remove Elsie from your system., 30
ControlClick, Button1, %winTitle1% ahk_class #32770

winTitle2 = Remove shared file
WinWait, %winTitle2%,, 10
ControlClick, Button1, %winTitle2% ahk_class #32770

WinWait, %winTitle1%, Uninstallation complete., 30
Sleep 1000
ControlClick, Button1, %winTitle1% ahk_class AIDialogTemplate