$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download.kde.org/stable/umbrello/latest/win32/umbrello-mingw32-2.29.3-26.1-setup.exe'
  checksum     = '996D445C2A6AA0025ECEBDA185DC67890C8F3F9D79E36575443C89913844881F'
  checksumType = 'sha256'

  file64       = "$toolsDir\umbrello-mingw64-2.29.3-99.1-setup.exe"

  silentArgs   = "/S"
}

if (Get-OSArchitectureWidth -Compare 32) {
  Install-ChocolateyPackage @packageArgs
} else {
  Install-ChocolateyInstallPackage @packageArgs
}
