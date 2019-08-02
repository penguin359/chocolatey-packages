$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\umbrello-mingw32-2.28.3-22.1-setup.exe"
  file64      = "$toolsDir\umbrello-mingw64-2.28.3-95.1-setup.exe"
  silentArgs  = "/S"
}

Install-ChocolateyInstallPackage @packageArgs