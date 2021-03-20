$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'https://downloads.firestormviewer.org/windows/Phoenix-Firestorm-Release-6-4-13-63251_Setup.exe'
  checksum       = '2f275fac88b0b44808c662db76de51eb2fa3ba0366b101db2d0cd838fef9dab8'
  checksumType   = 'sha256'

  url64          = 'https://downloads.firestormviewer.org/windows/Phoenix-Firestorm-Releasex64-6-4-13-63251_Setup.exe'
  checksum64     = 'e7fe9b81127b70e0ce15d36b6e18044b0ddf2f204832c04ec9de63a09eb77ccf'
  checksumType64 = 'sha256'

  silentArgs     = '/S'
}

Start-Process "AutoHotKey" -Verb runas -ArgumentList "`"$toolsDir\chocolateyinstall.ahk`""
Install-ChocolateyPackage @packageArgs