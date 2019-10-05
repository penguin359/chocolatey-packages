$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"

  url           = 'https://download.vb-audio.com/Download_CABLE/VBCABLE_Driver_Pack43.zip'
  checksum      = '66FD0A4D9F4896FF41632B7E3D53892C085C4561F53E8AE8D0F0BC10EEDD1CDD'
  checksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = "$toolsDir"
  fileType      = 'exe'
  file          = "$toolsDir\VBCABLE_Setup.exe"
  file64        = "$toolsDir\VBCABLE_Setup_x64.exe"
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyInstallPackage @packageArgs