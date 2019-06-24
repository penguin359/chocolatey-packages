#NoEnv
#Warn  ; Enable warnings to assist with detecting common errors.
#NoTrayIcon
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetControlDelay -1

WinWait, ahk_exe Stub.exe, Panda Free Antivirus installation, 60 ; Panda Free Antivirus Installation
ControlClick, Button3, ahk_exe Stub.exe,,,, NA ; Next

WinWait, ahk_exe Stub.exe, Select an installation folder., 10 ; Panda Free Antivirus Installation
ControlClick, Button2, ahk_exe Stub.exe,,,, NA ; Installation folder

WinWait, ahk_exe Stub.exe, Installation complete!, 180 ; Panda Free Antivirus Installation
ControlClick, Button2, ahk_exe Stub.exe,,,, NA ; Installation folder