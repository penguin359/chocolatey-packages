$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesEngine3.18.13Setup.exe'
  checksum      = '47a87f4d11ce3eb778f8b0e3d8caedb0aec466cd5b684125da7dd428762250d4'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
