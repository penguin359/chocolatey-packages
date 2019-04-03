#NoEnv
#NoTrayIcon
;#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1
SetControlDelay -1

; First install
if !FileExist("$Env:APPDATA\ImprimCheques\ImprChq.ini")
{	
	winTitle1 = Format d
	WinWait, %winTitle1%,, 60
	WinClose
}

winTitle2 = ImprimCh
WinWait, %winTitle2%,, 60
WinClose, %winTitle2%