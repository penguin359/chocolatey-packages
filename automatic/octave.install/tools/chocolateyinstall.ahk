#NoEnv
#NoTrayIcon
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0  
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Welcome to GNU Octave Setup
winTitle1 = GNU Octave
WinWait, %winTitle1%, Welcome to GNU Octave Setup, 600
WinActivate
ControlClick, Button2, %winTitle1% ; &Next >

; License Agreement
WinWait, %winTitle1%, License Agreement, 10
ControlClick, Button2, %winTitle1% ; &Next >
 
; Install Options
WinWait, %winTitle1%, Install Options, 10
ControlClick, Button2, %winTitle1% ; &Next >

; Choose Install Location
WinWait, %winTitle1%, Choose Install Location, 10
ControlClick, Button2, %winTitle1% ; &Install

; Completing GNU Octave Setup
WinWait, %winTitle1%, Completing GNU Octave Setup, 900
ControlClick, Button4, %winTitle1% ; &Run GNU Octave
Sleep 500
ControlClick, Button5, %winTitle1% ; &Show Readme
Sleep 500
ControlClick, Button2, %winTitle1% ; &Finish