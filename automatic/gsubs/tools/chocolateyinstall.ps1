$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName = $env:ChocolateyPackageName
  file        = "$toolsDir\gSubs.Setup.1.0.3.exe"
  silentArgs  = "/S"
}

Install-ChocolateyInstallPackage @packageArgs
