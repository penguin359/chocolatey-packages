$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  fileType      = 'exe'  

  url           = 'https://www.buffalotech.com/support/download/nasnavi-302.zip'
  checksum      = '3c8bc161a0c47039058f96d225a9d15012022c54cfb20cd4473652e4fd71bdf3'
  checksumType  = 'sha256'  
}
Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName = $env:ChocolateyPackageName 
  fileType    = 'exe'
  file        = "$toolsDir\nasnavi-302\NASNaviInst.exe"
}
Start-Process 'AutoHotKey' -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyInstallPackage @packageArgs
