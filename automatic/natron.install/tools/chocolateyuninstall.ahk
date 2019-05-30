#NoEnv
#Warn  ; Enable warnings to assist with detecting common errors.
#NoTrayIcon
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 2  ; 2: A window's title can contain WinTitle anywhere inside it to be a match.
SetControlDelay -1
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

winTitle = Maintain Natron

WinWait, %winTitle% ahk_class QWidget,, 30 ; Setup - Natron
Sleep 350
ControlClick, x362 y362, %winTitle%,,,, NA ; Next

Sleep 350
ControlClick, x362 y362, %winTitle%,,,, NA ; Uninstall

Sleep 30000 ; As-is Windows Spy doesn't catch any QWidget controls
ControlClick, x436 y362, %winTitle%,,,, NA ; Completing the Natron Wizard - Finish