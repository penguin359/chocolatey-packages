$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://github.com/clipto-pro/Desktop/releases/download/v2.8.1/clipto-2.8.1.exe'
  checksum     = '9fc9e50b09aa7b69186eb3c01c2934e42b04c00d261eeb1dddaddaa287cc84c8'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
