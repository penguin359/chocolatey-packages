$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url64bit      = 'https://software.gopro.com/PC/GoPro_Quik-WinInstaller-2.7.0.945.exe'
  checksum64    = 'A7B28741E415C5E4D04EAC2768B02A005F28EFF1DF3F6540457DCCD0F3542C66'
  checksumType64= 'sha256'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs