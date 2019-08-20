$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download.kde.org/stable/umbrello/latest/win32/umbrello-mingw32-2.29.0-23.1-setup.exe'
  checksum     = 'ffb5834855436ffd86751b70921d0ae797b790dea42f677634f3bab31b970e0b'
  checksumType = 'sha256'

  file64       = "$toolsDir\umbrello-mingw64-2.29.0-96.1-setup.exe"

  silentArgs   = "/S"
}

if Get-OSArchitectureWidth -Compare 32 {
  Install-ChocolateyPackage @packageArgs
} else {
  Install-ChocolateyInstallPackage @packageArgs
}
