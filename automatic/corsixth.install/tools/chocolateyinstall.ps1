$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  destination   = "$toolsDir"
  file          = "$toolsDir\CorsixTHInstaller.exe"
  silentArgs    = "/S"
}

Install-ChocolateyInstallPackage @packageArgs
