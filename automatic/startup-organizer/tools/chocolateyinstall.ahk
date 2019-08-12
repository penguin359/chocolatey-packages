#NoEnv
#Warn  ; Enable warnings to assist with detecting common errors.
#NoTrayIcon
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 2  ; A windows's title can contain WinTitle anywhere inside it to be a match.
SetControlDelay -1  
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

winTitle = Welcome ahk_class TdlgInstall ahk_exe sosetup.exe
;winTitle = Welcome

;WinWait, %winTitle%, Default, 300
WinWait, %winTitle%,, 300

ControlClick, TButton1, %winTitle%,,,, NA ; Next >
Sleep 1000

WinTitle = License Agreement
;ControlClick, TRadioButton2, %winTitle%,,,, NA ; I &accept the agreement ; Software license
ControlSend,,!a, %winTitle%
Sleep 1000
;ControlClick, TButton2, %winTitle%,,,, NA ; Next >
ControlSend,,{Tab}, %winTitle%
Sleep 350
ControlSend,,{Enter}, %winTitle%
Sleep 350

WinTitle = Choose Destination Location
;ControlClick, TButton3, %winTitle%,,,, NA ; Next > ; Installation folder
ControlSend,,{Enter}, %winTitle%
Sleep 350

WinTitle = Start Installation
;ControlClick, TButton3, %winTitle%,,,, NA ; Next > ; Program Shortcuts
ControlSend,,{Enter}, %winTitle%
Sleep 1500

;ControlClick, TCheckBox2, %winTitle%,,,, NA ; Next > ; Program Shortcuts
;ControlSend,,{Tab}, %winTitle%
;Sleep 350
;

WinTitle = Installation Complete
ControlSend,,{Tab}, %winTitle%
Sleep 1250
ControlSend,TCheckBox2,{Space}, %winTitle%
Sleep 1250
;ControlClick, TButton3, %winTitle%,,,, NA ; Finish
ControlSend,,{Enter}, %winTitle%