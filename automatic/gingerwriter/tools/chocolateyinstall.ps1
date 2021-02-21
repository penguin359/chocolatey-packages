$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  fileFullPath	= "$toolsDir\GingerWriterSetup.exe"
  url           = 'https://downloads.gingersoftware.com/files/windows/GingerWriterSetup.exe'
  checksum      = 'ADA5BEC46A438F4A1E09D092E89B4D2A09A2260A08F2ABA2174ED32B8EA4DC24'
  checksumType  = 'sha256'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs