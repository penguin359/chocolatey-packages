#NoEnv
#Warn  ; Enable warnings to assist with detecting common errors.
#NoTrayIcon
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 2  ; 2: A window's title can contain WinTitle anywhere inside it to be a match.
SetControlDelay -1  
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

winTitle = GoPro Quik

WinWait, %winTitle%,, 120 ; Welcome
WinActivate
Sleep 3000
ControlClick, x415 y435, %winTitle%,,,, NA ; Next

WinWait, %winTitle%,, 10 ; License
WinActivate
Sleep 3000
ControlClick, x40 y340, %winTitle%,,,, NA ; Accept
ControlClick, x420 y440, %winTitle%,,,, NA ; Next

WinWait, %winTitle%,, 10 ; Installation folder
WinActivate
Sleep 3000
ControlClick, x420 y435, %winTitle%,,,, NA ; Install

WinWait, %winTitle%,, 240 ; Installation 
WinActivate
Sleep 3000
ControlClick, x39 y334, %winTitle%,,,, NA ; Do not launch automatically
ControlClick, x530 y440, %winTitle%,,,, NA ; Finished