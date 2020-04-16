$ErrorActionPreference = 'Stop';
$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\davmail-5.5.0-3293-setup.exe"
  file64      = "$toolsDir\davmail-5.5.0-3293-setup64.exe"
  silentArgs  = "/S"
}

Install-ChocolateyInstallPackage @packageArgs
