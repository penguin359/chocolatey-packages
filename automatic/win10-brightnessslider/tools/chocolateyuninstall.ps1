$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

If ( Get-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run | Select-Object -ExpandProperty Win10_BrightnessSlider -ErrorAction Stop | Out-Null ){
  Remove-ItemProperty -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Name Win10_BrightnessSlider
}