$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://metaproducts.com/download/sosetup.exe'
  checksum     = '229CB1A8DA1CF99CC813B3A4A5705007C69BAB3DD8BC65E934102B1471C4586F'
  checksumType = 'sha256'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs