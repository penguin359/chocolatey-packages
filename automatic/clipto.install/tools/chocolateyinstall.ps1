$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://github.com/clipto-pro/Desktop/releases/download/v4.7.0/clipto-4.7.0.exe'
  checksum     = 'cf3d0f6537e2a16532a87a02e32bc2aac54f3247d8f6d515cb3343df334ede95'
  checksumType = 'sha256'

  silentArgs   = '/S'
}

Install-ChocolateyPackage @packageArgs
