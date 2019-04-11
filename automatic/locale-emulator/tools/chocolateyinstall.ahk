#NoEnv
#NoTrayIcon
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay -1

winTitle1 = % "LE Context Menu Installer - V"
WinWait, %winTitle1%, , 20
WinActivate
ControlClick, WindowsForms10.BUTTON.app.0.141b42a_r9_ad12, %winTitle1%

; Install finished.
winTitle2 = % "LE Context Menu Installer"
WinWait, %winTitle2% ahk_class #32770, Install finished., 5 ;
ControlClick, OK, %winTitle2% ahk_class #32770,,,NA

WinActivate, %winTitle1%
WinClose, %winTitle1%