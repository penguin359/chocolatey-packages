#NoEnv
#NoTrayIcon
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay -1

winTitle1 = devkitProUpdater ahk_class #32770

WinWait, %winTitle1%, Welcome to devkitProUpdater, 180
ControlClick, Button2, %winTitle1% ; &Next >

WinWait, %winTitle1%, Install or just download files?, 10
Sleep 350
ControlClick, Button2, %winTitle1% ; &Next >

WinWait, %winTitle1%, Keep downloaded files after install?, 10
Sleep 350
ControlClick, Button2, %winTitle1% ; &Next >

WinWait, %winTitle1%, Choose Components, 10
Sleep 350
ControlClick, Button2, %winTitle1% ; &Next >

WinWait, %winTitle1%, Choose Install Location, 10
Sleep 350
ControlClick, Button2, %winTitle1% ; &Next >

WinWait, %winTitle1%, Choose Start Menu Folder, 10
Sleep 350
ControlClick, Button2, %winTitle1% ; &Install

WinWait, %winTitle1%, Installation Complete, 450
ControlClick, Button2, %winTitle1% ; &Next >

WinWait, %winTitle1%, Installation Complete, 10
Sleep 350
ControlClick, Button2, %winTitle1% ; Finish