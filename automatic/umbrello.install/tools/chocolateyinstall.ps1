$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  file          = "$toolsDir\umbrello-i686-w64-mingw32-2.27.3-10.4-setup.exe"
  file64        = "$toolsDir\umbrello-x86_64-w64-mingw32-2.27.3-82.4-setup.exe"
  silentArgs    = "/S"
}

Install-ChocolateyInstallPackage @packageArgs