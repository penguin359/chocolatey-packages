$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName  = $env:ChocolateyPackageName

  url          = 'https://download.kde.org/stable/umbrello/latest/win32/umbrello-mingw32-2.30.0-31.1-setup.exe'
  checksum     = 'EA8A72A4806F572642911140B60FD25ED3339177773E72BFFD69D8D4CDCBB727'
  checksumType = 'sha256'

  file64       = "$toolsDir\umbrello-mingw64-2.30.0-103.1-setup.exe"

  silentArgs   = "/S"
}

if (Get-OSArchitectureWidth -Compare 32) {
  Install-ChocolateyPackage @packageArgs
} else {
  Install-ChocolateyInstallPackage @packageArgs
}
