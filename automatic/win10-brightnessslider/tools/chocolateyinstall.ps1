$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  filefullpath  = "$toolsDir\Win10_BrightnessSlider.exe"

  url           = 'https://github.com/blackholeearth/Win10_BrightnessSlider/releases/download/v1.7.9/Win10_BrightnessSlider.exe'
  checksum      = '3E99BDEBABFD5A45E9DBEC7934E8E1F56404962AFA645DFC7D77706496E147AD'
  checksumType  = 'sha256'
}

Get-ChocolateyWebFile @packageArgs

New-ItemProperty -Force -Path HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run -Name Win10_BrightnessSlider -PropertyType String -Value "$toolsDir\Win10_BrightnessSlider.exe" | Out-Null
Start-Process -FilePath "$toolsDir\Win10_BrightnessSlider.exe" -Verb runas