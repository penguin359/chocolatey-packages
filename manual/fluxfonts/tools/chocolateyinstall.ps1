$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\fluxfonts_install.exe"
  silentArgs  = "/S"
}

Install-ChocolateyInstallPackage @packageArgs