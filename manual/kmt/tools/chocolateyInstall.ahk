#NoEnv
#NoTrayIcon
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetTitleMatchMode, slow
SetControlDelay 0  

winTitle = G4FON Koch Method Morse Trainer Install Program ahk_class InstItClass

; Welcome
WinWait, %winTitle%, Welcome to the G4FON Koch Method Morse Trainer Install program., 300
ControlClick, Button1, %winTitle% ; &Next>

; Changes to version 9
WinWait, %winTitle%, Changes to Version 9, 10
ControlClick, Button1, %winTitle% ; &Next>

; Directory
WinWait, %winTitle%, Directory, 10
ControlClick, Button1, %winTitle% ; &Next>

; Confirmation
WinWait, %winTitle%, Confirmation, 10
ControlClick, Button1, %winTitle% ; &Start>

; End
WinWait, %winTitle%, End, 60
ControlClick, Button2, %winTitle% ; E&xit