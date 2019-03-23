#NoEnv
#NoTrayIcon
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 3  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay -1

; GNS3 2.1.15 Uninstall
winTitle1 = GNS3 2.1.15 Uninstall
WinWait, %winTitle1%, Are you sure you want to uninstall GNS3 2.1.15?, 10
Sleep 350
ControlClick, &Oui, %winTitle1% ahk_class #32770

; GNS3 2.1.15 was successfully removed from your computer.
WinWait, %winTitle1%, GNS3 2.1.15 was successfully removed from your computer., 10
ControlClick, OK, %winTitle1% ahk_class #32770