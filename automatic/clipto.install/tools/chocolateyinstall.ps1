$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://github.com/clipto-pro/Desktop/releases/download/v4.1.0/clipto-4.1.0.exe'
  checksum     = '5679ac7a28bb961d31aa276eb42cf7928fdcdf060c3b6e5b0ba5c5ab3d81632f'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
