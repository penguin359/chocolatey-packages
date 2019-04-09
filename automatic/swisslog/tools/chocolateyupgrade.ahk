#NoEnv
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 350

; Swisslog pour Windows Setup
winTitle1 = Swisslog pour Windows Setup
WinWait, %winTitle1%,, 120
ControlClick, Button3, %winTitle1%,,,NA
ControlClick, Button1, %winTitle1%,,,NA

; Audio files language
ControlClick, Button8, %winTitle1%,,,NA ; Do not install
ControlClick, Button1, %winTitle1%,,,NA

; Options
ControlClick, Button3, %winTitle1%,,,NA
ControlClick, Button1, %winTitle1%,,,NA

; Installation folder
ControlClick, Button1, %winTitle1%,,,NA

; Ready to install
ControlClick, Button1, %winTitle1%,,,NA

; Successfull install
WinWait, %winTitle1%, % "&Terminer", 60
ControlClick, Button1, %winTitle1%, % "&Terminer",,NA