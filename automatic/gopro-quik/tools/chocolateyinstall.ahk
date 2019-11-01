#NoEnv
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetTitleMatchMode, 1  ; A windows's title must start with the specified WinTitle to be a match.
SetControlDelay 0  

winTitle1 = GoPro Quik

WinWait, %winTitle1%,, 300 ; Welcome

; *** Welcome ***
Sleep, 1250
ControlSend,, {Tab}, %winTitle1%
ControlSend,, {Enter}, %winTitle1%

; *** License ***
Sleep, 1250
ControlSend,, {Tab}, %winTitle1%
ControlSend,, {Tab}, %winTitle1%
Sleep, 1250
ControlSend,, {Space}, %winTitle1%
ControlSend,, {Tab}, %winTitle1%
ControlSend,, {Tab}, %winTitle1%
ControlSend,, {Enter}, %winTitle1%

; *** Install ***
Sleep, 1250
ControlSend,, {Tab}, %winTitle1%
ControlSend,, {Enter}, %winTitle1%

loop
{
  Sleep 2000
  if FileExist("C:\ProgramData\Package Cache\{AA5F7FCE-311C-46D8-B93A-ABF4DDCAB832}v0.1.945\GDA.msi")
  {    
    Run TASKKILL /F /IM GoPro_Quik-WinInstaller-2.7.0.945.exe

    break
  }
}