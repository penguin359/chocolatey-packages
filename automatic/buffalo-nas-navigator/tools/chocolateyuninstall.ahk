#NoEnv
#NoTrayIcon
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0  
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

winTitle1 = NAS Navigator2 Installer

WinWait, %winTitle1%, to uninstall NAS Navigator2., 60 ; Click 'OK' to uninstall NAS Navigator2.
ControlClick, OK, %winTitle1%

WinWait, %winTitle1%, NAS Navigator2 has been successfully uninstalled., 60
ControlClick, OK, %winTitle1%