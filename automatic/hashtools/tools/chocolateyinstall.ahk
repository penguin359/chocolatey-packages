#NoEnv
#NoTrayIcon
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay -1

winTitle1 = HashTools
WinWait, %winTitle1%, , 60
WinActivate
ControlClick, WindowsForms10.BUTTON.app.0.3598b65_r9_ad14, %winTitle1% ahk_class WindowsForms10.Window.8.app.0.3598b65_r9_ad1