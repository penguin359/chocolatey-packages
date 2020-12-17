$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesEngine3.18.14Setup.exe'
  checksum      = 'e70f0653404c447d70aa019dde3047ecfcd233941153eeeeaac143210ccf95a9'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
