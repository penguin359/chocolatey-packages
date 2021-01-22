$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesEngine3.19.0Setup.exe'
  checksum      = '93db0534afd359284c10a75e6127882d0359cfef65859bff49e0e37c355460f0'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
