#NoEnv
#Warn  ; Enable warnings to assist with detecting common errors.
#NoTrayIcon
SendMode Input
SetTitleMatchMode, 3

winTitle = RufzXP

WinWait, %winTitle%,, 120
if ErrorLevel
{
	;MsgBox "WinWait timed out."
	return
}
WinActivate
Send !n
