$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"  

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  fileType      = 'exe'
  file          = "$toolsDir\PCW-Tutor-6.0.0-setup.exe"

  url           = 'https://www.qsl.net/dj7hs/PCW-Tutor-60-setup.zip'
  checksum      = '1FF32CEFD077C5790D0C932C88730AF515475FEEC259C89D9F58550D796F01E8'
  checksumType  = 'sha256'
  
}

Install-ChocolateyZipPackage @packageArgs
Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyInstallPackage @packageArgs
