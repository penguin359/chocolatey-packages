$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  fileType      = 'exe'  

  url           = 'https://www.buffalotech.com/support/download/nasnavi-29b.zip'
  checksum      = 'a5d3c73aa23dd709aa4161deaeff815a0ece17eb51ed4bcadc6836ac28cf3fed'
  checksumType  = 'sha256'  
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName = $env:ChocolateyPackageName 
  fileType    = 'exe'
  file        = "$toolsDir\nasnavi-29b\NASNaviInst.exe"
}
Start-Process 'AutoHotKey' -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyInstallPackage @packageArgs
