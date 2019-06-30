$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.radiantviewer.com/files/RadiAnt-5.0.1-Setup.exe'
  checksum      = 'ff471c913c107912affd9e8475110170bee913b0065774a33e837e7580fa1dd8'
  checksumType  = 'sha256'

  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs
