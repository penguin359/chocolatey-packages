#NoEnv
#NoTrayIcon
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SRR_Version = 1.2.7.1

; Simple Radio Recoder Uninstallation
winTitle1 = Simple Radio Recorder v.%SRR_Version% Uninstallation
WinWait, %winTitle1%, This will uninstall the Simple Radio Recorder v.%SRR_Version% from this user account., 10
ControlClick, Button2, %winTitle1% ahk_class #32770

; The program was successfully uninstalled.
WinWait, %winTitle1%, The program was successfully uninstalled., 10
ControlClick, Button2, %winTitle1% ahk_class #32770
