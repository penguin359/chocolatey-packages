#NoEnv
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetTitleMatchMode, slow
;SetControlDelay 0
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Welcome to GNS3 2.1.15 Setup
winTitle1 = GNS3 2.1.15 Setup
WinWait, %winTitle1%, Welcome to GNS3 2.1.15 Setup, 30 ; Welcome to GNS3 2.1.15 Setup
Sleep, 500
ControlClick, Button2, %winTitle1% ahk_class #32770,,,NA
Sleep, 1000

; License agreement
WinWait, %winTitle1%, License Agreement, 10
Sleep, 500
ControlClick, I &Agree, %winTitle1% ahk_class #32770,,,NA
Sleep, 1000

; Choose Start Menu F older
WinWait, %winTitle1%, Choose Start Menu Folder, 10
Sleep, 500
ControlClick, &Next >, %winTitle1% ahk_class #32770
Sleep, 1000
 
; Choose Components
WinWait, %winTitle1%, Choose Components, 10
Sleep, 500

; [X] GS3
Send, {Down}
Sleep, 500

; [ ] WinPCAP
Send, {Space}
Sleep, 500
Send, {Down}
Sleep, 500

; [ ] Wireshark
Send, {Space}
Sleep, 500
Send, {Down}
Sleep, 500

; [X] Dynamips
Send, {Down}
Sleep, 500

; [ ] QEMU
 Send, {Space}
Sleep, 500
Send, {Down}
Sleep, 500

; [X] VPCS
Send, {Down}
Sleep, 500

; [X] Cpulimit
Send, {Down}
Sleep, 500

; [ ] TightVNC Viewer
Send, {Space}
Sleep, 500
Send, {Down}
Sleep, 500

; [ ] VirtViewer
;Send, {Space}
Send, {Down}
Sleep, 500
ControlClick, &Next >, %winTitle1% ahk_class #32770
Sleep, 1000

; Choose Install Location
WinWait, %winTitle1%, Choose Install Location, 10
Sleep, 500
ControlClick, &Install, %winTitle1% ahk_class #32770
Sleep, 1000

; Installation Complete
WinWait, %winTitle1%, Installation Complete, 60
Sleep, 500
ControlClick, &Next >, %winTitle1% ahk_class #32770
Sleep, 1000

; Solarwinds Standard Toolset
WinWait, %winTitle1%, Solarwinds Standard Toolset, 10
Sleep, 500
ControlClick, No, %winTitle1% ahk_class #32770
Sleep, 1000
ControlClick, &Next >, %winTitle1% ahk_class #32770
Sleep, 1000

; Completing GNS3 2.1.15 Setup
WinWait, %winTitle1%, Completing GNS3 2.1.15 Setup, 10
Sleep, 500
ControlClick, Start GNS3, %winTitle1% ahk_class #32770
Sleep, 1000
ControlClick, &Finish, %winTitle1% ahk_class #32770
Sleep, 1000