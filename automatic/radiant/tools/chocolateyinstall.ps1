$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.radiantviewer.com/files/RadiAnt-4.6.9-Setup.exe'
  checksum      = 'BEA76056E2CC17F32CBA51BF968AD9D7054B40E1912AC2A9094B8F32D8F6804F'
  checksumType  = 'sha256'

  silentArgs	= "/S"
}

Install-ChocolateyPackage @packageArgs