#NoEnv
#NoTrayIcon
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 350  
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetKeyDelay, 1500, 1500
 
winTitle1 = B1 Free Archiver

WinWait, %winTitle1% ahk_class #32770,, 60
WinActivate
Sleep 2000
ControlClick, Button2, %winTitle1% ahk_class #32770 ; Disable "I want to leave a message"
;WinActivate
Sleep 2000

ControlClick, Uninstall, %winTitle1% ahk_class #32770
;ControlSend, Button1, {Enter}, %winTitle1% ahk_class #32770

;WinWait, %winTitle1% ahk_class #32770,, 30
Sleep 2000
ControlClick, OK, %winTitle1% ahk_class #32770
Sleep 5000