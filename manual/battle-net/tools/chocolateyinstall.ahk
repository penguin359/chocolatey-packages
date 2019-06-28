#NoEnv
#NoTrayIcon
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0  
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Locale suppressed to be asked each time for language (enUS,frFR...)
RegDelete, HKEY_CURRENT_USER\Software\Blizzard Entertainment\Launcher, Locale

winTitle1 = ahk_class Blizzard Bootstrapper ahk_exe Battle.net-Setup.exe
; Select a Language
WinWait, %winTitle1%,, 180
ControlClick, x288 y84, %winTitle1% ; English
Sleep 750
ControlClick, x88 y296, %winTitle1% ; Continue

winTitle2 = ahk_class Qt5QWindowIcon ahk_exe Battle.net.exe
loop {
  IfWinExist (%winTitle2%)
  {    
    Sleep 750
    WinClose, %winTitle2%
    break
  } else {
    ; Install Location
    ControlClick, x633 y423, %winTitle1% ; Continue
    Sleep 1000
  }
}

Exit