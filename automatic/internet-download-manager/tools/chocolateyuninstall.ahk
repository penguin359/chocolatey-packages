#NoEnv
#NoTrayIcon
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetControlDelay 0  

; Uninstallation mode 
WinWait, ahk_exe Uninstall.exe, Internet Download Manager, 60
ControlClick, Button2, ahk_exe Uninstall.exe

; Click on Finish to uninstall
ControlClick, Button3, ahk_exe Uninstall.exe

; Do not reboot after uninstallation
WinWait, ahk_exe Uninstall.exe, Internet protocol options, 10
ControlClick, Button2, ahk_exe Uninstall.exe