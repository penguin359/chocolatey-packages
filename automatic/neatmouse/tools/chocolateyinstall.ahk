#NoEnv
#Warn  ; Enable warnings to assist with detecting common errors.
#NoTrayIcon
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 2  ; 2: A window's title can contain WinTitle anywhere inside it to be a match.
SetControlDelay -1
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

winTitle = Setup - NeatMouse

WinWait, %winTitle% ahk_class TWizardForm,, 180
ControlClick, TNewRadioButton1, %winTitle%,License Agreement,,, NA ; I &accept the agreement

WinWait, %winTitle% ahk_class TWizardForm,License Agreement, 10
ControlClick, TNewButton2, %winTitle%,License Agreement,,, NA ; &Next >

WinWait, %winTitle% ahk_class TWizardForm,Select Destination Location, 10
ControlClick, TNewButton3, %winTitle%,Select Destination Location,,, NA ; &Next >   Select Destination Location

WinWait, %winTitle% ahk_class TWizardForm,Select Start Menu Folder, 10
ControlClick, TNewButton4, %winTitle%,Select Start Menu Folder,,, NA ; &Next >   Select Start Menu Folder

WinWait, %winTitle% ahk_class TWizardForm,Select Additional Tasks, 10
;ControlClick, TNewCheckListBox1, %winTitle%,Select Additional Tasks,,, NA ; Create a desktop icon for all users
ControlClick, TNewButton4, %winTitle%,Select Additional Tasks,,, NA ; &Next >   Select Additional Tasks

WinWait, %winTitle% ahk_class TWizardForm,Ready to Install, 10
ControlClick, TNewButton4, %winTitle%,,,, NA ; &Install  Ready to Install

WinWait, %winTitle% ahk_class TWizardForm,Completing the NeatMouse Setup Wizard, 60
ControlClick, TNewButton4, %winTitle%,,,, NA ; &Finish   Completing the NeatMouse Setup Wizard