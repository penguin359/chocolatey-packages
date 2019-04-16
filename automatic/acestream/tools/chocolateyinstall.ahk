#NoEnv
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0  
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
acestream_version = 3.1.32

; License agreement
winTitle1 = % "Ace Stream Media 3.1.32 Setup"
WinWait, %winTitle1%, License Agreement, 300
ControlClick, Button4, %winTitle1% ahk_class #32770,,,NA ; I accept
ControlClick, Button2, %winTitle1% ahk_class #32770,,,NA ; &Next >

; Choose Components
WinWait, %winTitle1%, Choose Components, 10
ControlClick, Button2, %winTitle1% ahk_class #32770,,,NA ; &Next >
 
; Choose cache drive
WinWait, %winTitle1%, Choose cache drive, 10
ControlClick, Button2, %winTitle1% ahk_class #32770,,,NA ; &Next >

; Completing Ace Stream Media Setup
WinWait, %winTitle1%, Completing Ace Stream Media 3.1.32 Setup, 60
Sleep 350
ControlClick, Button4, %winTitle1% ahk_class #32770,,,NA ; "Visit Ace Stream website and test the installed software"
ControlClick, Button2, %winTitle1% ahk_class #32770,,,NA ; &Finish