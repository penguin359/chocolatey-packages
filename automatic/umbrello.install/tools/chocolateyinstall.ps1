$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download.kde.org/stable/umbrello/latest/win32/umbrello-mingw32-2.29.0-23.1-setup.exe'
  checksum     = 'FFB5834855436FFD86751B70921D0AE797B790DEA42F677634F3BAB31B970E0B'
  checksumType = 'sha256'

  file64       = "$toolsDir\umbrello-mingw64-2.29.0-96.1-setup.exe"

  silentArgs   = "/S"
}

if (Get-OSArchitectureWidth -Compare 32) {
  Install-ChocolateyPackage @packageArgs
} else {
  Install-ChocolateyInstallPackage @packageArgs
}