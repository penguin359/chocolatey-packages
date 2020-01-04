$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  fileType      = 'EXE'
  file          = "$toolsDir\PCW-Fistcheck-3.0.1-setup.exe"

  url           = 'https://www.qsl.net/dj7hs/PCW-Fistcheck-setup.zip'
  checksum      = 'F343F3FB46D11F6B578BF53D8B2A784D0C5097D23F8C9BA5DD63E85FA4F2C27F'
  checksumType  = 'sha256'
  
}

Install-ChocolateyZipPackage @packageArgs
Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyInstallPackage @packageArgs
