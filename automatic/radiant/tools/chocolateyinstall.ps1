$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.radiantviewer.com/files/RadiAnt-2020.2.1-Setup.exe'
  checksum      = '8a4356366cdf748b448bf12e66bbffbfaca5cf66cbcb1a391e75010e611d41d5'
  checksumType  = 'sha256'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
