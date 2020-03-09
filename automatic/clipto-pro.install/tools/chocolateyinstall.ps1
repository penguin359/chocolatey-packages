$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName

  url           = 'https://github.com/clipto-pro/Desktop/releases/download/v2.4.0/clipto.pro-2.4.0.exe'
  checksum      = '29cfe3969d4234152e88ef692d7e587877671f0bc4e53594fb221ed8d8f10b99'
  checksumType  = 'sha256'

  silentArgs    = '/S'
}

Install-ChocolateyPackage @packageArgs
