#NoEnv
#NoTrayIcon
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 2  ; A window's title can contain WinTitle anywhere inside it to be a match
SetControlDelay 0  
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Remove VueScan
WinTitle = VueScan
WinWait, %WinTitle% ahk_class #32770 ahk_exe vuescan.exe,, 30 ; Do yu want to remove VueScan?
ControlClick, Button1, %winTitle% ahk_class #32770 ahk_exe vuescan.exe ; Yes