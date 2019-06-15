$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.radiantviewer.com/files/RadiAnt-5.0.0-Setup.exe'
  checksum      = '0b5beaea2ed2e2fbc5c6fa4a6fc6327b142b8c6e1110aafb00e4da4b2a3c997a'
  checksumType  = 'sha256'

  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs
