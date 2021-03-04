$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesEngine3.19.2Setup.exe'
  checksum      = '27899fb6fe11de7957fc758c34990e4dc2b52547ea52e353258723bc3b8fa6e0'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
