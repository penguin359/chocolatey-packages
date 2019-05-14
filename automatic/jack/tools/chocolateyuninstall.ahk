#NoEnv
; #Warn  ; Enable warnings to assist with detecting common errors.
#NoTrayIcon
SetTitleMatchMode, 2 ; A windows's title can contain WinTitle anywhere inside it to be a match
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetControlDelay 0  
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

winTitle = Uninstalling Jack

; Uninstalling Jack
WinWait, %winTitle%, Welcome to the Jack Uninstallation!, 30
ControlClick, &Next >, %winTitle%

; Jack has been successfully uninstalled!
WinWait, %winTitle%, Jack has been successfully uninstalled!, 30
ControlClick, &Finish, %winTitle%