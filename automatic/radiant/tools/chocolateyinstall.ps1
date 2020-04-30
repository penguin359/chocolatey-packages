$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.radiantviewer.com/files/RadiAnt-2020.1.1-Setup.exe'
  checksum      = '72f0fe9331c5c46f588a42f4c2ab723bee0f33db5b24b970bc872b033600e38e'
  checksumType  = 'sha256'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
