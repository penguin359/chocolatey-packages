$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download.kde.org/stable/umbrello/latest/win32/umbrello-mingw32-2.32.0-54.1-setup.exe'
  checksum     = ''
  checksumType = 'sha256'

  file64       = "$toolsDir\umbrello-mingw64-2.32.0-126.1-setup.exe"

  silentArgs   = '/S'
}

if (Get-OSArchitectureWidth -Compare 32) {
  Install-ChocolateyPackage @packageArgs
} else {
  Install-ChocolateyInstallPackage @packageArgs
}
