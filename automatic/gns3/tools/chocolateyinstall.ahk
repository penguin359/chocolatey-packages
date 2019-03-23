#NoEnv
#NoTrayIcon
;#Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0

; Welcome to GNS 2.1.15 Setup
winTitle1 = GNS3
WinWait, %winTitle1%, , 120 ; Welcome to GNS3 2.1.15 Setup
Sleep 350
ControlClick, Button2, %winTitle1% ahk_class #32770

; License agreement
WinWait, %winTitle1%, License Agreement, 10
ControlClick, I &Agree, %winTitle1% ahk_class #32770

; Choose Start Menu Folder
WinWait, %winTitle1%, Choose Start Menu Folder, 10
ControlClick, &Next >, %winTitle1% ahk_class #32770

; Choose Components
WinWait, %winTitle1%, Choose Components, 10
Sleep 350

; [X] GS3
Send {Down}

; [ ] WinPCAP
Send {Space}
Send {Down}

; [ ] Wireshark
Send {Space}
Send {Down}

; [X] Dynamips
Send {Down}

; [ ] QEMU
Send {Space}
Send {Down}

; [X] VPCS
Send {Down}

; [X] Cpulimit
Send {Down}

; [ ] TightVNC Viewer
Send {Space}
Send {Down}

; [ ] VirtViewer
;Send {Space}
Send {Down}
ControlClick, &Next >, %winTitle1% ahk_class #32770

; Choose Install Location
WinWait, %winTitle1%, Choose Install Location, 10
ControlClick, &Install, %winTitle1% ahk_class #32770

; Installation Complete
WinWait, %winTitle1%, Installation Complete, 60
ControlClick, &Next >, %winTitle1% ahk_class #32770

; Solarwinds Standard Toolset
WinWait, %winTitle1%, Solarwinds Standard Toolset, 10
ControlClick, No, %winTitle1% ahk_class #32770
ControlClick, &Next >, %winTitle1% ahk_class #32770

; Completing GNS3 2.1.15 Setup
WinWait, %winTitle1%, Completing GNS3 2.1.15 Setup, 10
ControlClick, Start GNS3, %winTitle1% ahk_class #32770
ControlClick, &Finish, %winTitle1% ahk_class #32770