#NoEnv
#NoTrayIcon
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0  
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

winTitle1 = Little Fighter Install Program ahk_class InstItClass
WinWait, %winTitle1%,, 300
ControlClick, Button1, %winTitle1% ; &Next >
Sleep 750

; License agreement
ControlClick, Button4, %winTitle1% ; I agree with the above terms and conditions
Sleep 750
ControlClick, Button1, %winTitle1% ; &Next >
Sleep 750

; Directory
ControlClick, Button1, %winTitle1% ; &Next >
Sleep 750

; Littkle Fighter has been successfully installed.
WinWait, %winTitle1%, Launch Little Fighter, 180
ControlClick, Button5, %winTitle1% ; Disable "Launch Little Fighter"
Sleep 1000
ControlClick, Button1, %winTitle1% ; Exit