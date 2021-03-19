$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://downloads.firestormviewer.org/windows/Phoenix-Firestorm-Release-6-4-12-62831_Setup.exe'
  checksum       = 'f89dcc1e7a84bed494f96279e0e63bafbf9fe98fd9d3d0b7fe3b939f82ad94a0'
  checksumType   = 'sha256'

  url64          = 'https://downloads.firestormviewer.org/windows/Phoenix-Firestorm-Releasex64-6-4-12-62831_Setup.exe'
  checksum64     = '5005190e98fbb5c9f22fd6190128b580dafc00a94f8468d82a26a11ca7cf6b67'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs