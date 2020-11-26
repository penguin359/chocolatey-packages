$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesEngine3.17.6Setup.exe'
  checksum      = 'D1E763808387EF3E9C5DDE3E72D6608E03181694E8D7455C3D642FB8E684DFA3'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs