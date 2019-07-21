$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'  

  url           = 'https://www.buffalotech.com/support/download/nasnavi-299.zip'
  checksum      = 'ACB78EAA5D60DFD24A213A65DFE4ADC3DA1064939BD9B847F77B8162FDB85506'
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
