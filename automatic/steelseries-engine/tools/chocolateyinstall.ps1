$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesEngine3.18.12Setup.exe'
  checksum      = '09b909c5e3cc1799c35efd9d2b42d4dd60f47225df9c7b450d3afcbafad1dff8'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
