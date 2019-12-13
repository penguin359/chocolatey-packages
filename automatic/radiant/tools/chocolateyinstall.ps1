$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.radiantviewer.com/files/RadiAnt-5.5.1-Setup.exe'
  checksum      = '82d0835c6d7cf7b76635918236f0044619f37d3f4d9271928c4f84008a629857'
  checksumType  = 'sha256'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
