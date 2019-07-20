#NoEnv
#Warn  ; Enable warnings to assist with detecting common errors.
#NoTrayIcon
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 2  ; 2: A window's title can contain WinTitle anywhere inside it to be a match.
SetControlDelay -1
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

winTitle = Natron Setup

WinWait, %winTitle% ahk_class QWidget,, 180 ; Welcome
Sleep 700
ControlClick, x302 y500, %winTitle%,,,, NA ; Next

Sleep 700
ControlClick, x302 y500, %winTitle%,,,, NA ; Installation folder

Sleep 700
ControlClick, x302 y500, %winTitle%,,,, NA ; Select Components

Sleep 1000
ControlClick, x52 y414, %winTitle%,,,, NA ; License agreement - I accept the license
Sleep 700
ControlClick, x302 y500, %winTitle%,,,, NA ; Select Components

Sleep 700
ControlClick, x302 y500, %winTitle%,,,, NA ; Start Menu shortcuts

Sleep 700
ControlClick, x302 y500, %winTitle%,,,, NA ; Ready to install

Sleep 75000 ; As-is Windows Spy does not catch any QWidget controls
ControlClick, x434 y500, %winTitle%,,,, NA ; Completing the Natron Wizard - Finish