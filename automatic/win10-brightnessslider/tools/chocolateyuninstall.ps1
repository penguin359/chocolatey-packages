$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Stop win10_brightnessslider.exe if needed
If ( Get-Process "Win10_BrightnessSlider" -ErrorAction SilentlyContinue ) {
  Stop-Process -Name "Win10_BrightnessSlider" | Out-Null
}

If ( Get-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run | Select-Object -ExpandProperty Win10_BrightnessSlider -ErrorAction Stop | Out-Null ){
  Remove-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Name Win10_BrightnessSlider
}