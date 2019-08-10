$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\huggle_3.4.9.exe"
  file64      = "$toolsDir\huggle_3.4.9_x64.exe"
  silentArgs  = "/S"
}

Install-ChocolateyInstallPackage @packageArgs