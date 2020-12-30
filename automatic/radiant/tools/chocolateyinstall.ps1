$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://www.radiantviewer.com/files/RadiAnt-2020.2.3-Setup.exe'
  checksum      = '8dac1a658cc090315ad2522d075689cc0faa0c30d85b53ad28d972440c1a6f8f'
  checksumType  = 'sha256'

  silentArgs    = "/S"
}

Install-ChocolateyPackage @packageArgs
