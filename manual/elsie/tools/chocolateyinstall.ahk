#NoEnv
; #Warn  ; Enable warnings to assist with detecting common errors.
#NoTrayIcon
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0  
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

winTitle = Elsie Installation

WinWait, %winTitle%, Welcome to the Elsie Setup program, 30
ControlClick, Button2, %winTitle% ahk_class AIDialogTemplate

WinWait, %winTitle%, License agreement, 10
ControlClick, Button1, %winTitle% ahk_class AIDialogTemplate
ControlClick, Button3, %winTitle% ahk_class AIDialogTemplate

WinWait, %winTitle%, Readme, 10
ControlClick, Button2, %winTitle% ahk_class AIDialogTemplate

WinWait, %winTitle%, System information, 10
ControlClick, Button2, %winTitle% ahk_class AIDialogTemplate

WinWait, %winTitle%, Select destination directory, 10
ControlClick, Button4, %winTitle% ahk_class AIDialogTemplate

WinWait, %winTitle%, Select Program Folder, 10
ControlClick, Button2, %winTitle% ahk_class AIDialogTemplate

WinWait, %winTitle%, Summary, 10
ControlClick, Button2, %winTitle% ahk_class AIDialogTemplate ; Install

WinWait, %winTitle%, Finished, 30
ControlClick, Button7, %winTitle% ahk_class AIDialogTemplate