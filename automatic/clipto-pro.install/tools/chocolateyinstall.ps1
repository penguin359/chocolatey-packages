$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://github.com/clipto-pro/Desktop/releases/download/v2.0.8/clipto.pro-2.0.8.exe'
  checksum      = 'e6273f16f81d3b3bdc5dae8369ac3cb54a46d8205c5b8ba4ee0de05797ab3d8c'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
