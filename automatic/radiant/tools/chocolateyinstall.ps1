$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.radiantviewer.com/files/RadiAnt-5.5.0-Setup.exe'
  checksum      = 'c5b2f7f19a92a2a820027c2f691f4787470b89123ca5ae947bd0b4261713fa29'
  checksumType  = 'sha256'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
