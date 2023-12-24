#NoEnv
#Warn  ; Enable warnings to assist with detecting common errors.
#NoTrayIcon
SendMode Input
;DetectHiddenWindows, On

winTitle = RCForb (Server) Uninstall

WinWait, %winTitle%,, 120
if ErrorLevel
{
	;MsgBox "WinWait timed out."
	return
}
WinActivate
Send !y
