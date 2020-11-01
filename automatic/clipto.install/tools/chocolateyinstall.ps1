$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://github.com/clipto-pro/Desktop/releases/download/v4.5.5/clipto-4.5.5.exe'
  checksum     = 'a8eb522dd67dd2e25e2c05b8583a802a8a4eab529b9b93b9ef359b20d44e9203'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
