$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://engine.steelseriescdn.com/SteelSeriesEngine3.18.15Setup.exe'
  checksum      = '9d63e3bbdbe7eaf26a33f8a123a1df4c3233fb1c845f1bb305acc958dc092043'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
