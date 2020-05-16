$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download.kde.org/stable/umbrello/latest/win32/umbrello-mingw32-2.31.1-lp151.46.1-setup.exe'
  checksum     = '19AA1D7D1B24EB324DFADE1F61D5B8A96007C607A4F919AA01AFFE28A3874490'
  checksumType = 'sha256'

  file64       = "$toolsDir\umbrello-mingw64-2.31.1-lp151.118.1-setup.exe"

  silentArgs   = '/S'
}

if (Get-OSArchitectureWidth -Compare 32) {
  Install-ChocolateyPackage @packageArgs
} else {
  Install-ChocolateyInstallPackage @packageArgs
}
