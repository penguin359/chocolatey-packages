$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.radiantviewer.com/files/RadiAnt-2020.1-Setup.exe'
  checksum      = 'c9090a8531dcb4e5c7bd7e22e29348e07a9ae0041852de71952e0d0c696e6db9'
  checksumType  = 'sha256'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
