#NoEnv
#NoTrayIcon
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0  
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Close VueScan to finish installation as VueScan is automatically launched.
;winTitle = VueScan
;WinWait, %winTitle% ahk_class wxWindowNR ahk_exe vuescan.exe,, 600
;WinClose,
Process,Wait,vuescan.exe
Process,Close,vuescan.exe