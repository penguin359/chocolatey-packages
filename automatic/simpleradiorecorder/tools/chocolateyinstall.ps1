$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  file         =  "$toolsDir\\SRR Setup 1.2.7.1.exe"
  
  url           = 'https://dennisbabkin.com/php/downloads/simple_radio_recorder.zip'
  checksum      = '02A10E197BC54EA0540940104EAC98C5CFAD5255D1B0347142485CD8899051E6'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyInstallPackage @packageArgs