$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName

  url            = 'http://downloads.firestormviewer.org/windows/Phoenix-Firestorm-release-6-2-4-57588_Setup.exe'
  checksum       = '64a1d9bf2663c8c3d5e0c048043491ecaa7a4dff3b2b421d3291b7efe9cbdbe3'
  checksumType   = 'sha256'

  url64          = 'http://downloads.firestormviewer.org/windows/Phoenix-Firestorm-releasex64-6-2-4-57588_Setup.exe'
  checksum64     = 'e5cef7b6cee56b4b42cee9509c4bb85f544bcd905acdb5422617d4da67a872ce'
  checksumType64 = 'sha256'

  silentArgs     = "/S"
}

Install-ChocolateyPackage @packageArgs