#NoEnv
#Warn  ; Enable warnings to assist with detecting common errors.
#NoTrayIcon
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetControlDelay -1  
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;winTitle = Uninstall StartUp Organizer
WinWait, %winTitle%,, 300

ControlClick, Button1, %winTitle%,,,, NA ; Do you want to completely remove...
Sleep 350
ControlClick, Button1, %winTitle%,,,, NA ; Successfully removed.