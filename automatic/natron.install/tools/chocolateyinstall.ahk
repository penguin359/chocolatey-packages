#NoEnv
#Warn  ; Enable warnings to assist with detecting common errors.
#NoTrayIcon
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 2  ; 2: A window's title can contain WinTitle anywhere inside it to be a match.
SetControlDelay -1
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

winTitle = Natron Setup

WinWait, %winTitle% ahk_class QWidget,, 90 ; Welcome
Sleep 350
ControlClick, x352 y362, %winTitle%,,,, NA ; Next

Sleep 350
ControlClick, x352 y362, %winTitle%,,,, NA ; Installation folder

Sleep 350
ControlClick, x352 y362, %winTitle%,,,, NA ; Select Components

Sleep 1000
ControlClick, x42 y302, %winTitle%,,,, NA ; License agreement - I accept the license
Sleep 350
ControlClick, x352 y362, %winTitle%,,,, NA ; Select Components

Sleep 350
ControlClick, x352 y362, %winTitle%,,,, NA ; Start Menu shortcuts

Sleep 350
ControlClick, x352 y362, %winTitle%,,,, NA ; Ready to install

Sleep 60000 ; As-is Windows Spy does not catch any QWidget controls
ControlClick, x436 y362, %winTitle%,,,, NA ; Completing the Natron Wizard - Finish