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
;ControlClick, x302 y500, %winTitle%,,,, NA ; Next
ControlClick, x355 y363, %winTitle%,,,, NA ; Next

Sleep 700
;ControlClick, x302 y500, %winTitle%,,,, NA ; Installation folder
ControlClick, x355 y363, %winTitle%,,,, NA ; Installation folder

Sleep 700
;ControlClick, x302 y500, %winTitle%,,,, NA ; Select Components
ControlClick, x355 y363, %winTitle%,,,, NA ; Select Components

Sleep 2500
;ControlClick, x52 y414, %winTitle%,,,, NA ; License agreement - I accept the license
;ControlClick, x32 y301, %winTitle%,,,, NA ; License agreement - I accept the license
Sleep 1500
ControlClick, x41 y301, %winTitle%,,,, NA ; License agreement - I accept the license
Sleep 1700
;ControlClick, x32 y301, %winTitle%,,,, NA ; License agreement - I accept the license
;Sleep 1700
;ControlClick, x302 y500, %winTitle%,,,, NA ; Select Components
ControlClick, x355 y363, %winTitle%,,,, NA ; Select Components

Sleep 1700
;ControlClick, x302 y500, %winTitle%,,,, NA ; Start Menu shortcuts
ControlClick, x355 y363, %winTitle%,,,, NA ; Start Menu shortcuts

Sleep 1700
;ControlClick, x302 y500, %winTitle%,,,, NA ; Ready to install
ControlClick, x355 y363, %winTitle%,,,, NA ; Ready to install

Sleep 75000 ; As-is Windows Spy does not catch any QWidget controls
ControlClick, x437 y364, %winTitle%,,,, NA ; Completing the Natron Wizard - Finish
;loop
;{
;ControlClick, x437 y364, %winTitle%,,,, NA ; Completing the Natron Wizard - Finish
;Sleep 2000
;}