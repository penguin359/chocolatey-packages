$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'  

  url           = 'https://www.buffalotech.com/support/download/nasnavi-297.zip'
  checksum      = 'D6BDEDDB7067CA0F2B6010283028636447F850D024388462C61FC96C81C3B4C0'
  checksumType  = 'sha256'  
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName 
  fileType      = 'exe'
  file          = "$toolsDir\nasnavi-297\NASNaviInst.exe"
}
Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyInstallPackage @packageArgs