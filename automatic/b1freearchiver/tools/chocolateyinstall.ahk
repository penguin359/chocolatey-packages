#NoEnv
#NoTrayIcon
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0  
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
 
winTitle1 = B1 Free Archiver
winTitle2 = Welcome

WinWait, %winTitle1% ahk_class #32770, Most friendly and simple software to open and create archives, 60
ControlClick, Button7, %winTitle1% ahk_class #32770 ; Disable "I agree to send statistical data to make B1 better"
ControlClick, Install >, %winTitle1% ahk_class #32770

WinWait, %winTitle2% ahk_class Qt5QWindowIcon,,180
WinClose

WinWait, %winTitle1% ahk_class Qt5QWindowIcon,,30
WinClose

WinWait, %winTitle1% ahk_class ahk_class #32770,Some features will work properly only after restarting your computer, 30
WinActivate
ControlClick, Button1, %winTitle1% ahk_class #32770 ; Finish