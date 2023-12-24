#NoEnv
#Warn  ; Enable warnings to assist with detecting common errors.
#NoTrayIcon
SendMode InputThenPlay
DetectHiddenWindows, On

winTitle = Windows Security

WinWait, %winTitle%,, 1200
if ErrorLevel
{
	;MsgBox "WinWait timed out."
	return
}
WinActivate
Send !i
