$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://github.com/clipto-pro/Desktop/releases/download/v2.2.2/clipto.pro-2.2.2.exe'
  checksum      = '2ce009b393a4f8f522b58bcab4d547d324cfdcf8aed77a4126ae3d33f4f50543'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
