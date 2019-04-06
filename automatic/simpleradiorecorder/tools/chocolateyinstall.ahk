#NoEnv
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0

; Welcome to the Simple Radio Recorder Setup
winTitle1 = Simple%A_Space%Radio%A_Space%Recorder%A_Space%
WinWait, %winTitle1%, This%A_Space%will%A_Space%install%A_Space%Simple%A_Space%Radio%A_Space%Recorder%A_Space%for%A_Space%this%A_Space%Windows%A_Space%user%A_Space%account., 30 ; This will install Simple Radio Recorder for this Windows user account.
ControlClick, Button2, %winTitle1% ahk_class #32770,,,NA

; License agreement
WinWait, %winTitle1%, License Agreement, 10
ControlClick, I &accept the agreement, %winTitle1% ahk_class #32770,,,NA
ControlClick, Button4, %winTitle1% ahk_class #32770,,,NA

; Select Destination Location
WinWait, %winTitle1%, Setup will install the program into the following folder., 10
ControlClick, Button5, %winTitle1% ahk_class #32770

; Select Start Menu Folder
WinWait, %winTitle1%, Setup will use the following folder to store the program's recordings && data files., 10
ControlClick, Button7, %winTitle1% ahk_class #32770

; Select Data Folder Location
WinWait, %winTitle1%, Setup will use the following folder to store, 10
ControlClick, Button8, %winTitle1% ahk_class #32770

; Select Additional Tasks
WinWait, %winTitle1%, Select additional tasks that you would like Setup to perform , 10
ControlClick, Button1, %winTitle1% ahk_class #32770
ControlClick, Button10, %winTitle1% ahk_class #32770

; Ready to Install
WinWait, %winTitle1%, Click Next to begin installation, 10
ControlClick, Button10, %winTitle1% ahk_class #32770

; Finished
WinWait, %winTitle1%, Setup has finished installing the program on your computer., 10
ControlClick, Button1, %winTitle1% ahk_class #32770
Sleep 1000
;ControlClick, Button3, %winTitle1% ahk_class #32770
Sleep 1000
;ControlClick, Button13, %winTitle1% ahk_class #32770 ; Next
ControlClick, Button14, %winTitle1% ahk_class #32770 ; Done