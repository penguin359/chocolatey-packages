#NoEnv
#NoTrayIcon
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 2  ; A windows's title can contain WinTitle anywhere inside it to be a match.
SetControlDelay 0  
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Validate Windows security prompts to install driver certificates
loop
{
	if WinExist("Windows ahk_class #32770", "mshelp")
	{
		ControlClick, x460 y130, %winTitle%
	}
	Sleep 1000
}