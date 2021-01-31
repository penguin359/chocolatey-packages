#NoEnv
#Warn  ; Enable warnings to assist with detecting common errors.
#NoTrayIcon
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetControlDelay -1  
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


Post_install_scriptDir = C:\Octave\Octave-6.1.0\post-install.bat

winTitle = GNU Octave

SetTitleMatchMode, RegEx
WinWait, %winTitle%, the installer was unable to find a Java Runtime Environment|Welcome to GNU Octave Setup, 600
IfWinExist, %winTitle%, the installer was unable to find a Java Runtime Environment
{
  ControlClick, Button1, %winTitle%,,,, NA ; &Yes
  WinWait, %winTitle%, Welcome to GNU Octave Setup, 10
}
ControlClick, Button2, %winTitle%,,,, NA ; &Next >

SetTitleMatchMode, 2  ; 2: A window's title can contain WinTitle anywhere inside it to be a match.
WinWait, %winTitle%, Welcome to GNU Octave Setup, 900
ControlClick, Button2, %winTitle%,,,, NA ; &Next >

WinWait, %winTitle%, License Agreement, 10
ControlClick, Button2, %winTitle%,,,, NA ; &Next >

WinWait, %winTitle%, Install Options, 10
ControlClick, Button2, %winTitle%,,,, NA ; &Next >

WinWait, %winTitle%, Choose Install Location, 10
ControlClick, Button2, %winTitle%,,,, NA ; &Install

; https://github.com/chocolatey-community/chocolatey-package-requests/issues/487
; PS Installation script can't be finished due to "%MSYSDIR%\bin\bash.exe --login -c echo" in post-install.bat script
;While !FileExist(Post_install_scriptDir) ; Wait for the extraction of post-install.bat script
;{
;    Sleep, 3000
;}
Sleep, 10000
FileRead, BUFF, %Post_install_scriptDir%
StringReplace, BUFF, BUFF, "`%MSYSDIR`%\bin\bash.exe" --login -c echo, REM ** Chocolatey installation fix** "`%MSYSDIR`%\bin\bash.exe" --login -c echo, All
FileDelete, %Post_install_scriptDir%
FileAppend, %BUFF%, %Post_install_scriptDir%

WinWait, %winTitle%, Completing GNU Octave Setup, 900
Sleep 350
ControlClick, Button4, %winTitle%,,,, NA ; Don't launch octave automatically after the end of the installation
Sleep 350
ControlClick, Button2, %winTitle%,,,, NA ; &Finish
