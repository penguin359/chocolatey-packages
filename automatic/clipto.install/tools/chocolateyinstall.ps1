$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://github.com/clipto-pro/Desktop/releases/download/v3.0.7/clipto-3.0.7.exe'
  checksum     = 'e6e1c3b5752b2aaf3b7c879e10a9cdd39b4bedbd945bc979d57b82473ffc6353'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
