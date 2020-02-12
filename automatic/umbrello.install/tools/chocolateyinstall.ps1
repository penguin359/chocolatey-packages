$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download.kde.org/stable/umbrello/latest/win32/umbrello-mingw32-2.30.2-lp151.37.2-setup.exe'
  checksum     = '17F2219634ECCD91AB2FC01D92D1C3B4B19BBA8700C53951E5BE9FA47C5B213E'
  checksumType = 'sha256'

  file64       = "$toolsDir\umbrello-mingw64-2.30.2-lp151.109.2-setup.exe"

  silentArgs   = "/S"
}

if (Get-OSArchitectureWidth -Compare 32) {
  Install-ChocolateyPackage @packageArgs
} else {
  Install-ChocolateyInstallPackage @packageArgs
}
